# VS Code Remote Tunnel Docker

[English](README.md) | [日本語](README_ja.md)

このプロジェクトは、Visual Studio Code Remote Tunnel を実行するための Docker 化された環境を提供します。SSH を必要とせず、どこからでも VS Code を使用してこのコンテナにリモート接続できます。

## 前提条件

- Docker
- Docker Compose

## 始め方

### 1. ビルドと実行

Docker Compose を使用してトンネルを開始できます。これにより、イメージがビルドされ、コンテナが起動します。

```bash
docker compose up -d
```

### 2. トンネルの認証

初回実行時には、GitHub または Microsoft アカウントでトンネルを認証する必要があります。

コンテナのログを確認して、認証コードと URL を見つけます。

```bash
docker compose logs -f vscode-tunnel
```

次のようなメッセージが表示されます：
> To grant access to the server, please log into https://github.com/login/device and use code XXXX-XXXX

リンクにアクセスし、コードを入力してこのトンネルをアカウントにリンクしてください。

### 3. VS Code 経由で接続

1. ローカルマシンで VS Code を開きます。
2. **Remote - Tunnels** 拡張機能をインストールします。
3. コマンドパレット (`F1` または `Ctrl+Shift+P`) を開き、`Remote-Tunnels: Connect to Tunnel...` を実行します。
4. 設定で定義されたトンネル名を選択します（デフォルト: `remote-machine`）。

## 設定

### 環境変数

[`compose.yml`](compose.yml) の `TUNNEL_NAME` 環境変数を変更することで、トンネル名を設定できます。

```yaml
environment:
  - TUNNEL_NAME=my-custom-tunnel-name
```

### 永続化

VS Code CLI データ（認証トークンを含む）は、`vscode-cli-data` という名前の Docker ボリュームを使用して永続化されます。これにより、コンテナを再起動するたびに再認証する必要がなくなります。

## ユーザー詳細

- **ユーザー:** `ubuntu`
- **パスワード:** `ubuntu`
