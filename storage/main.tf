#-----storage/main.tf--------

## Create random bits
resource "random_id" "tf_bucket_id" {
  byte_length = 2
}

## Create GCS bucket
resource "google_storage_bucket" "tf_code" {
  project       = "${var.project_name}"
  name          = "${var.project_name}-terraform-${random_id.tf_bucket_id.dec}"
  location      = "${var.region}"
  storage_class = "REGIONAL"
  force_destroy = true
}
