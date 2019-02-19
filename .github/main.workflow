workflow "Main" {
  on = "push"
  resolves = ["Docker Hub Login"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@master"
  args = "build -t dlerps/pushr:test-1 ."
}

action "Docker Hub Login" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["GitHub Action for Docker"]
  secrets = ["DOCKER_PASSWORD", "DOCKER_USERNAME"]
}
