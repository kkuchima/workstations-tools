module "artifact_registry" {
  source        = "./modules/artifact_registry"
  repository_id = var.repository_id
}

module "spanner" {
  source        = "./modules/spanner"
  instance_name = var.spanner_instance_id
  db_name       = var.spanner_db_id
}

module "memorystore" {
  source        = "./modules/memorystore"
  instance_name = var.redis_instance_id
}
