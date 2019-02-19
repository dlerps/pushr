workflow "Main" {
  on = "push"
  resolves = [
    "Unit Test",
    "Publish",
    "Build",
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
