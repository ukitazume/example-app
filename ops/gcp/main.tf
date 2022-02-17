resource "google_cloud_run_service" "this" {
  name     = "cloudrun-example-app"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "ukitazume/example-app:123"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
