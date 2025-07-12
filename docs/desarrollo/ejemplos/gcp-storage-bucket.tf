resource "google_storage_bucket" "copilot_bucket" {
  name     = "copilot-multicloud-storage"
  location = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 90
    }
  }
}