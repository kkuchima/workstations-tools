resource "google_project_service" "artifact_registry" {
  service = "artifactregistry.googleapis.com"
}

resource "google_artifact_registry_repository" "my-repo" {
  location      = "asia-northeast1"
  repository_id = var.repository_id
  format        = "DOCKER"
  depends_on    = [google_project_service.artifact_registry]
}
