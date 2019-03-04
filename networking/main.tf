##-----networking/main.tf

data "google_compute_zones" "available" {}

## Create VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_name}-vpc"
  auto_create_subnetworks = "false"
}

## create subnet us-east
resource "google_compute_subnetwork" "subnet-us" {
  name             = "${var.project_name}-subnet"
  ip_cidr_range    = "${lookup(var.subnet_cidr, var.region)}"
  network          = "${var.project_name}-vpc"
  depends_on       = ["google_compute_network.vpc"]
  region           = "${var.region}"
  enable_flow_logs = true
}

## create subnet europe-west
//resource "google_compute_subnetwork" "subnet-europe" {
//    name                = "${var.project_name}-subnet"
//    ip_cidr_range       = "${lookup(var.subnet_cidr, var.region)}"
//    network             = "${var.project_name}-vpc"
//    depends_on          = ["google_compute_network.vpc"]
//    region              = "europe-west2"
//    enable_flow_logs    = true
//}


// Firewall rules for the network


// SSH 


// the following doesn't seem to be needed (as compared to AWS examples)
// will confirm when environment either does, or does not work
// as expected
//
// internet gateway
// route tables
// private route table

