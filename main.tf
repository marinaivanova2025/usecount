terraform {
  required_providers {
    null = {
      source  = "registry.terraform.io/hashicorp/null"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.2"
}

locals {
  commands = [
    "echo 'Hello from instance 0!'",
    "echo 'Greetings from instance 1!'",
    "echo 'Hola from instance 2!'"
  ]
}

resource "null_resource" "example" {
  count = 3
  provisioner "local-exec" {
    command = local.commands[count.index]
  }
}

