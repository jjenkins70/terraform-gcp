## Main.tf

## provider information
provider "google" {
  project = "${var.project_name}"
  region  = "${var.region}"
}

## Keep terraform statefile on GCP
terraform {
  backend "gcs" {
    bucket = "jj-terraform-course-state"
    prefix = "terraform/state"
  }
}

## deploy network
module "networking" {
  source       = "./networking"
  project_name = "${var.project_name}"
  subnet_cidr  = "${var.subnet_cidr}"
  region       = "${var.region}"
}

## deploy storage resources
module "storage" {
  source       = "./storage"
  project_name = "${var.project_name}"
  region       = "${var.region}"
}

## deploy compute resources
module "compute" {
  source        = "./compute"
  project_name  = "${var.project_name}"
  public_subnet = "${module.networking.public_subnet}"
}
