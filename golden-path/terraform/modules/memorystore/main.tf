resource "google_project_service" "redis" {
  service = "redis.googleapis.com"
}

resource "google_redis_instance" "redis_instance" {
  name           = var.instance_name
  tier           = "BASIC"
  memory_size_gb = 2
  redis_version  = "REDIS_6_X"
}