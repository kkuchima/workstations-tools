resource "google_project_service" "spanner" {
  service = "spanner.googleapis.com"
}

resource "google_spanner_instance" "spanner_instance" {
  name         = var.instance_name
  config       = "regional-asia-northeast1"
  display_name = var.instance_name
  num_nodes    = 1
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.spanner_instance.name
  name     = var.db_name
  # you can define DDL as well
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
  deletion_protection = false
}
