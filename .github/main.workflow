workflow "New workflow" {
  on = "push"
  resolves = ["Unit Test"]
}

action "Unit Test" {
  uses = ".github/test"
}
