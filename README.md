#  vyv-store (Development Environment with Poetry + Nix Flakes)

This repository is a fork of the original [vyv-store](link-to-original),  
with a modernized and reproducible **development environment** powered by **Poetry** and **Nix Flakes**.  

The goal is to make onboarding seamless for any developer, regardless of OS or setup.

---

## Features
- Cross-platform development setup: **Linux**, **macOS**, **Windows (WSL2/DevContainers)**
- Dependency management with [Poetry](https://python-poetry.org/)
- Reproducible environment with [Nix Flakes](https://nixos.wiki/wiki/Flakes)
- Build a **Docker image** for the project without a Dockerfile
- Works with **Python 3.12**

---

##  Setup Instructions

###  Option 1: Using Poetry (classic way)
1. Install **Poetry**  
   - **Linux/macOS**:
     ```bash
     curl -sSL https://install.python-poetry.org | python3 -
     ```
   - **Windows (PowerShell)**:
     ```powershell
     (Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | python -
     ```

2. Ensure you have **Python 3.12** installed:  
   - Ubuntu:
     ```bash
     sudo apt install python3.12 python3.12-venv python3.12-dev
     poetry env use python3.12
     ```

3. Install dependencies:
   ```bash
   poetry install

4. Run the development server:
   
   ```
    poetry run python manage.py runserver

    ```

Option 2: Using Nix Flakes (recommended for Nix users)

1. Enable Flakes in Nix:


```mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

```
2. Enter the development environment:
   
```
   nix develop

```

3. Run the development server:
  
```
   poetry run python manage.py runserver

```


Option 3: Build Docker Image with Nix

Build a Docker image without writing a Dockerfile:

```
    nix build .#dockerImage

```

Load and run the image:

```
  docker load < result
  docker run -p 8000:8000 vyv-store:latest

```


Supported Platforms

Linux (tested on Ubuntu 22.04)

macOS (tested on macOS 14, Apple Silicon)

Windows (via WSL2 or DevContainers)




🤝 Contributing

Pull requests and issues are welcome! 







