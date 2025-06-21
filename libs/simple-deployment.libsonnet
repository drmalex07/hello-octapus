# vim: set syntax=jsonnet:

{
  Deployment: function (name, replicas, image, containerPort=8080) {
      "apiVersion": "apps/v1",
      "kind": "Deployment",
      "metadata": {
        "labels": {
          "app": name
        },
        "name": name
      },
      "spec": {
        "replicas": replicas,
        "selector": {
          "matchLabels": {
            "app": name
          }
        },
        "template": {
          "metadata": {
            "labels": {
              "app": name
            }
          },
          "spec": {
            "containers": [
              {
                "image": image,
                "imagePullPolicy": "IfNotPresent",
                "name": name,
                "ports": [
                  {
                    "containerPort": containerPort,
                    "protocol": "TCP"
                  }
                ],
                "resources": {
                  "requests": {
                    "cpu": "150m",
                    "memory": "128Mi"
                  }
                }
              }
            ],
            "dnsPolicy": "ClusterFirst",
            "restartPolicy": "Always",
            "securityContext": {},
            "terminationGracePeriodSeconds": 30
          }
        }
      }
    },

    Service: function (name, port=8080, containerPort=8080) {
      "apiVersion": "v1",
      "kind": "Service",
      "metadata": {
        "name": name
      },
      "spec": {
        "type": "ClusterIP",
        "ports": [
          {
            "port": port,
            "protocol": "TCP",
            "targetPort": containerPort
          }
        ],
        "selector": {
          "app": name
        }
      }
    },

    Ingress: function (name, hostname, serviceName, servicePort=8080) {
      "apiVersion": "networking.k8s.io/v1",
      "kind": "Ingress",
      "metadata": {
        "name": name,
        "annotations": {
          "nginx.ingress.kubernetes.io/limit-rps": "10",
          "cert-manager.io/cluster-issuer": "letsencrypt-http01-staging-issuer"
        }
      },
      "spec": {
        "ingressClassName": "nginx",
        "tls": [
          {
            "hosts": [
              hostname
            ],
            "secretName": name + "-tls"
          }
        ],
        "rules": [
          {
            "host": hostname,
            "http": {
              "paths": [
                {
                  "path": "/",
                  "pathType": "Prefix",
                  "backend": {
                    "service": {
                      "name": serviceName,
                      "port": {
                        "number": servicePort
                      }
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }

}
