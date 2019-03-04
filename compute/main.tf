#-----compute/main.tf 

data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = "debian-cloud"
}

resource "google_compute_instance" "default" {
  count        = "1"
  name         = "test1"
  machine_type = "n1-standard-1"
  zone         = "us-east4-c"
  tags         = ["what", "this-tag"]
  project	= "${var.project_name}"

  boot_disk {
    auto_delete = "true"

    initialize_params {
      image = "debian-cloud/debian-9"
      size  = "20"
    }
  }

  network_interface {
    subnetwork = "${element(var.public_subnet, count.index)}"

    access_config {
      ## ephemeral ip
    }
  }

  metadata {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["compute-ro", "storage-rw"]
  }
}
