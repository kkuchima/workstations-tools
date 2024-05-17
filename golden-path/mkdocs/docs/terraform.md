# Terraform 実行
## State を保管するための GCS バケットを指定
`storage.tf` を編集し、State を保管するための GCS バケットを指定する
```
terraform {
  backend "gcs" {
    bucket = ""
    prefix = "starter-kit"
  }
}
```

## tfvars の作成
このディレクトリに `terraform.tfvars` を新規作成し、必要情報を入力する。
```
project_id          = ""
repository_id       = ""
spanner_instance_id = ""
spanner_db_id       = ""
redis_instance_id   = ""
```

## Terraform を実行しリソースを作成
```bash
terraform init

terrafrom plan

terraform apply
```