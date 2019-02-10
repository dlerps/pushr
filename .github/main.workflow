workflow "New workflow" {
  on = "push"
  resolves = [
    "Unit Test",
    "Publish",
    "Build",
  ]
}

action "Unit Test" {
  uses = "./"
  needs = ["Build"]
}

action "Build" {
  uses = "./"
  args = "/src/build.sh"
}

action "Publish" {
  uses = "./.github/publish"
  needs = ["Unit Test"]
}
