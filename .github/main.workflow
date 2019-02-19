workflow "Main" {
  on = "push"
  resolves = ["Docker Push"]
}

action "Docker Build" {
  uses = "actions/docker/cli@master"
  args = "build -t dlerps/pushr:test-1 ."
}

action "Docker Hub Login" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  secrets = ["DOCKER_PASSWORD", "DOCKER_USERNAME"]
  needs = ["Docker Build"]
}

action "Docker Push" {
  uses = "actions/docker/cli@master"
  needs = ["Docker Hub Login"]
  args = "push dlerps/pushr"
}
