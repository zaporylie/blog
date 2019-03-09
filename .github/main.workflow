workflow "Deploy to production" {
  on = "push"
  resolves = ["Filters branch"]
}

action "Filters branch" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  args = "branch zaporylie-patch-1"
}

action "Deploy to Droplet" {
  needs = ["Filters branch"]
  uses = "digitalocean/action/doctl@master"
  args = ["droplet ssh blog --ssh-command=ls"]
}
