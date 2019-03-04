#------networking/outputs.tf

output "public_subnet" {
  value = "${google_compute_subnetwork.subnet-us.*.name}"
}
