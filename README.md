# 概要

構築されたAnsibleコントローラーをEC2インスタンスで構築するためのTerraformファイル管理用リポジトリ

# 使い方

1. 当該リポジトリをCloud Shell内でclone
    - `git clone https://github.com/rato303/ec2-ansible-controller-setup.git`

## 事前準備(CloudShell作成時に1度のみ)

1. Terraformのダウンロード・解凍
    ```
    TERRAFORM_VERSION="1.5.6" # 例: 最新バージョン
    ```

    ```
    curl -fsSL "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o terraform.zip
    ```

    ```
    unzip terraform.zip
    ```
2. Terraformのインストール・動作確認
    ```
    sudo mv terraform /usr/local/bin/
    ```

    ```
    terraform -v
    ```
3. 当該リポジトリをclone
   ```
   git clone https://github.com/rato303/ec2-ansible-controller-setup.git
   ```

## 実行方法(利用環境を例)

```
cd ec2-ansible-controller-setup/environments/prod/
```

```
terraform init
```

$key_nameは自身のAWS環境で利用しているキーペア名

```
terraform plan -var-file=terraform.tfvars -var="key_name=$key_name"
```

```
terraform apply -var-file=terraform.tfvars -var="key_name=$key_name"
```