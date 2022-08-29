provider "multipass" {
  # Nothing to configure as of yet ⚙️
  # Stayed tuned to https://registry.terraform.io/providers/larstobi/multipass
}

resource "multipass_instance" "sample" {
  name           = "sample"
  cpus           = 1
  disk           = "3GiB"
  memory         = "1GiB"
  image          = "jammy"
  cloudinit_file = "terra-cloud-init.yml"
}

terraform {
  required_providers {
    multipass = {
      source  = "larstobi/multipass"
      version = ">= 1.4.1, < 2.0.0"
    }
  }
}

output "multipass_instance_name" {
  value = multipass_instance.sample.name
}