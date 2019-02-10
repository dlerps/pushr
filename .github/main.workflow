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
<<<<<<< HEAD
  uses = "./.github/publish"
=======
  uses = "./DockerfilePublish"
>>>>>>> 9992d4c8b27861d1e116bc5757b3ff47a10f70cc
  needs = ["Unit Test"]
}
