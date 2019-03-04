## outputs.tf
output "Bucket Name" {
  value = "${module.storage.bucketname}"
}

output "Public Subnet:" {
  value = "${module.networking.public_subnet}"
}
