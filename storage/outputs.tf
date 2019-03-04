#---storage/output.tf

output "bucketname" {
  value = "${google_storage_bucket.tf_code.id}"
}
