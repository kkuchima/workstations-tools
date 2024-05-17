# Workstation 立ち上げ後に実施すること

## 1. 認証情報の取得
```bash
export PROJECT_ID=<対象の Project ID>
gcloud auth application-default login

gcloud auth login
gcloud config set project ${PROJECT_ID}
```

## 2. ドキュメントの確認

```bash
cd mkdocs
docker build . -t mkdocs:latest
docker run -p 8000:8000 mkdocs:latest
```


## 3. Terraform 実行
### 3-1. State を保管するための GCS バケットを指定
`storage.tf` を編集し、State を保管するための GCS バケットを指定する
```
terraform {
  backend "gcs" {
    bucket = ""
    prefix = "starter-kit"
  }
}
```

### 3-2. tfvars の作成
このディレクトリに `terraform.tfvars` を新規作成し、必要情報を入力する。
```
project_id          = ""
repository_id       = ""
spanner_instance_id = ""
spanner_db_id       = ""
redis_instance_id   = ""
```

### 3-3. Terraform を実行しリソースを作成
```bash
terraform init

terrafrom plan

terraform apply
```