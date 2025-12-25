# VS Code Remote Tunnel Docker

[English](README.md) | [日本語](README_ja.md)

This project provides a Dockerized environment to run a Visual Studio Code Remote Tunnel. It allows you to connect to this container remotely using VS Code from anywhere, without needing SSH.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

### 1. Build and Run

You can start the tunnel using Docker Compose. This will build the image and start the container.

```bash
docker compose up -d
```

### 2. Authenticate the Tunnel

On the first run, you need to authenticate the tunnel with your GitHub or Microsoft account.

Check the container logs to find the authentication code and URL:

```bash
docker compose logs -f vscode-tunnel
```

You will see a message similar to:
> To grant access to the server, please log into https://github.com/login/device and use code XXXX-XXXX

Follow the link and enter the code to link this tunnel to your account.

### 3. Connect via VS Code

1. Open VS Code on your local machine.
2. Install the **Remote - Tunnels** extension.
3. Open the Command Palette (`F1` or `Ctrl+Shift+P`) and run `Remote-Tunnels: Connect to Tunnel...`.
4. Select the tunnel name defined in your configuration (default: `remote-machine`).

## Configuration

### Environment Variables

You can configure the tunnel name by modifying the `TUNNEL_NAME` environment variable in [`compose.yml`](compose.yml).

```yaml
environment:
  - TUNNEL_NAME=my-custom-tunnel-name
```

### Persistence

The VS Code CLI data (including authentication tokens) is persisted using a Docker volume named `vscode-cli-data`. This ensures you don't have to re-authenticate every time you restart the container.

## User Details

- **User:** `ubuntu`
- **Password:** `ubuntu`
