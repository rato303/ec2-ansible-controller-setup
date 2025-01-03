# 概要

Ansibleのマネージドノード用EC2インスタンスを構築するTerraformファイル管理用リポジトリ。  

![イメージ](./images/イメージ.svg)

## 環境差分

devのみEC2インスタンスに直接ansibleがインストールされる。  
playbookを実行するだけの場合はprod環境の利用を推奨する。  

### dev

- dockerがインストールされる
- ansibleがインストールされる
- ansible実行用のコンテナがインストールされる

### prod

- dockerがインストールされる

# ディレクトリ構成

```
ec2-ansible-controller-setup/
├── environments/ 環境ごとの設定ファイルを格納するディレクトリ
│   ├── dev/ 開発環境用のTerraform設定ファイルを含むディレクトリ
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   └── prod/ 本番環境用のTerraform設定ファイルを含むディレクトリ
│       ├── backend.tf
│       ├── main.tf
│       ├── terraform.tfvars
│       └── variables.tf
├── images/ README添付用の画像格納ディレクトリ
│   ├── イメージ.drawio.svg
│   └── イメージ.svg
└── modules/  再利用可能なTerraformモジュールを格納するディレクトリ
    └── ec2_instance/
        ├── main.tf
        ├── outputs.tf
        └── variables.tf
```

# 実行方法

$key_nameは自身のAWS環境で利用しているキーペア名  

1. カレントディレクトリを作成したい環境のディレクトリに変更
    ```
    cd ec2-ansible-controller-setup/environments/prod/
    ```

2. プロバイダー・モジュールの依存解決
    ```
    terraform init
    ```

3. planを確認
    ```
    terraform plan -var-file=terraform.tfvars -var="key_name=$key_name"
    ```

4. planを適用
    ```
    terraform apply -var-file=terraform.tfvars -var="key_name=$key_name"
    ```

# Appendix

## Terraformインストール手順

Cloud Shell上で実行する想定での手順。  
Terraformのインストールは実行環境毎に適宜変更。

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