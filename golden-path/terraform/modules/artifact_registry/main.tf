resource "google_project_service" "spanner" {
  service = "artifactregistry.googleapis.com"
}

resource "google_artifact_registry_repository" "my-repo" {
  location      = "asia-northeast1"
  repository_id = var.repository_id
  format        = "DOCKER"
}