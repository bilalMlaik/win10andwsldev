# Windows Subsystem Linux Developers' tools installations

1. [Install and Configure Git](./wsl-dev-git.md)

2. Install .NET Core SDK
    - [Install with `apt-get`]](./wsl-dev-dotnetcore.md)
    - [Install Previews](./wsl-dotnet-preview.md)

3. Install WSL build essential

```bash
    sudo apt-get install -y build-essential
```

4. Install [nvm](https://github.com/creationix/nvm)

```bash
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
```

5. Install Node.js

```bash
    export NODE_VERSION=10.13.0 && \
    nvm install ${NODE_VERSION} && \
    nvm use ${NODE_VERSION}
```

6. [Install Docker and Kubernetes](./wsl-docker-kube.md)

7. Install Python

```bash
sudo apt-get install -y python && \
sudo apt install python3 && \
echo "alias python='python3'" >> ~/.bashrc && \
source ~/.bashrc
```

8. [Install Azure CLI with apt](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest)
Or Script
```bash
    # requires python 2.7
    curl -L https://aka.ms/InstallAzureCli | bash
```

## Clean up WSL

```bash
    #This terminal command deletes all .deb files from /var/cache/apt/archives. It basically cleans up the apt-get cache.
    sudo apt-get autoclean
    
    #This terminal command is used to free up the disk space by cleaning up downloaded .deb files from the local repository.
    sudo apt-get clean

    #This terminal command used to remove packages that were automatically installed to satisfy dependencies for some package and no longer needed by those packages.
    sudo apt-get autoremove
```

### Reference posts

- [Webdev on Windows with WSL and VS Code](https://daverupert.com/2018/04/developing-on-windows-with-wsl-and-visual-studio-code/)
- [Install Azure CLI on Linux manually](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?view=azure-cli-latest)
- [Running Kubernetes CLI on Windows Subsystem for Linux (WSL)](https://devkimchi.com/2018/06/05/running-kubernetes-on-wsl/)
- [Setting Up Docker for Windows and WSL to Work Flawlessly](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly)
- [Containers, Kubernetes and DevOps for an Old as Dirt Developer (Or DevOps Nirvana with Kubernetes), Part 2/6](https://abelsquidhead.com/index.php/2018/04/25/containers-kubernetes-and-devops-for-an-old-as-dirt-developer-or-devops-nirvana-with-kubernetes-part-2many/)
- [Ubuntu for Windows: Setup Docker for WSL](https://gist.github.com/sgtoj/129a057e492b8d8f832964b7b73c6c57)