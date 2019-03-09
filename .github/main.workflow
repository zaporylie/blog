workflow "Deploy to production" {
  on = "push"
  resolves = ["deploy"]
}

action "filter" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  args = "branch zaporylie-patch-1"
}

action "deploy" {
  needs = ["filter"]
  uses = "digitalocean/action/doctl@master"
  args = "compute droplet ssh blog --ssh-command=ls"
  secrets = [
    "DIGITALOCEAN_ACCESS_TOKEN",
  ]
}
