#-----compute/main.tf 

/* EXAMPLE
data "google_compute_instance" "appserver" {
	name = "primary-app-server"
	zone = "us-central1-a"
}
*/

/*
## FORCING DELAY
resource "null_resource" "before" {
}

resource "null_resource" "delay" {
	provisioner "local-exec" {
		command = "sleep 300"
	}
	triggers = {
		"before" = "${null_resource.before.id}"
	}
}

resource "null_resource" "after" {
	depends_on = ["null_resource.delay"]
}
## END FORCED DELAY
*/

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
    #network = "default"
    #subnetwork = "${var.project_name}-subnet"
	subnetwork = "${element(var.public_subnet, count.index)}"
    #subnetwork = "${var.public_subnet}"
     #subnetwork = "us-east4/jjs-sandbox-subnet"

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
