workflow "Main" {
  on = "push"
  resolves = [
    "GitHub Action for Docker",
  ]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@master"
  args = "build -t dlerps/pushr:test-1 ."
}
