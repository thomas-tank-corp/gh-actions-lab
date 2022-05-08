provider "vault" {
  address = data.terraform_remote_state.hcp.outputs.VAULT_ADDR
  token = data.terraform_remote_state.hcp.outputs.VAULT_TOKEN
}

data "vault_generic_secret" "default" {
  path = "gcp/roleset/workshop/key"
}

provider "google" {
  access_token = data.vault_generic_secret.default.data["key"]
  project      = var.project
  region       = var.region
}


resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "f1-micro"
  zone = "europe-west2-c"

  tags = ["test", "git"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
