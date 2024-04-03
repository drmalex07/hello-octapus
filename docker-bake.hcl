# vim: set syntax=hcl:

target "maven" {
  dockerfile = "src/main/docker/maven.Dockerfile"
  context = "."
}

target "default" {
  args = {
    git_url = ""
    git_commit = ""
    git_tags = ""
    git_build_time =  
  }
  dockerfile = "src/main/docker/Dockerfile"
  context = 
  contexts = {
    "maven-build" = "target:maven"
  }
  tags = [
    "localhost/hello-octapus:1.8.6",  
    "localhost/hello-octapus:latest"  
  ]
}
