# vim: set syntax=jsonnet:

local image = "gcr.io/google-samples/hello-app:1.0";

local hostname = std.extVar('HOSTNAME');

local replicas = std.parseInt(std.extVar('REPLICAS')); 

local simple_deployment = import 'simple-deployment.libsonnet';

[
   simple_deployment.Deployment('helloworld', replicas, image),
   simple_deployment.Service('helloworld'),
   simple_deployment.Ingress('helloworld', hostname, 'helloworld')
]
