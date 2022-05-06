provider "google" {}



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
