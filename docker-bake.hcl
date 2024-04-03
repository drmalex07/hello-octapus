# vim: set syntax=hcl:

target "maven" {
  dockerfile = "src/main/docker/maven.Dockerfile"
  context = "."
}

target "default" {
  dockerfile = "src/main/docker/Dockerfile"
  context = "."
  contexts = {
    "maven-build" = "target:maven"
  }
  tags = [
    "localhost/hello-octapus:1.8.6"  
  ]
}
