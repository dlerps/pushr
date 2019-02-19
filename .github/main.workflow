workflow "Main" {
  on = "push"
  resolves = [
    "Unit Test",
    "Publish",
    "Build",
    "GitHub Action for Docker",
  ]
}

action "Unit Test" {
  uses = "./DotNetCore.Dockerfile"
  needs = ["Build"]
}

action "Build" {
  uses = "./DotNetCore.Dockerfile"
  args = "/src/build.sh"
}

action "Publish" {
  uses = "./.github/publish"
  needs = ["Unit Test"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "[\"-t\", \"dlerps/pushr:test-1\", \".\"]"
}
