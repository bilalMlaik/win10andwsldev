# Installing and running different versions of .NET Core SDK on Windows Linux Sybsystem
While it is possible to use `apt-get` to install the RTM version of dotnet. This document describes steps how to install and configure multiple versions of dotnet on Ubuntu Linux system.

The easiest way to keep multiple versions of .NET Core SDK running side-by-side is to use `global.json` file. 
To Switch between version of SDKs installed run the following commands:

```bash
    #displayed all installed versions
    dotnet --list-sdks
    
    #override global.json file
    dotnet new globaljson --sdk-version 3.0.100-preview-009812 --force
```

## Install .NET Core Required components

On Ununtu Linux distro run these command to install pre-req.

```bash
sudo apt-get update \
    && apt-get install -y --no-install-recommends \
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu60 \
        liblttng-ust0 \
        libssl1.0.0 \
        libstdc++6 \
        zlib1g 
```

Add the following into `~/.bashrc`
[https://www.microsoft.com/net/download/dotnet-core/2.2](https://www.microsoft.com/net/download/dotnet-core/2.2)
`Bash Shell: ~/.bash_profile, ~/.bashrc` Edit the appropriate source file for you shell and add :$HOME/dotnet to the end of the exiting PATH statement. If no PATH statement is included, add a new line with export PATH=$PATH:$HOME/dotnet.
```bash

    vi ~/.bashrc

    #add value to the end of the existing values
    export DOTNET_ROOT=$HOME/dotnet
    export PATH=$PATH:$HOME/dotnet

```

## Install .NET Core RTM Version

```bash
    #RTM Versions have different location, this retrieved by going to official download page and copying the link for the downloaded file.
    #https://download.visualstudio.microsoft.com/download/pr/519eac6e-f2c9-49dd-a60d-02072ed8e5b3/aed96c5eee6a74a5cde2e3f1ad4c7121/dotnet-sdk-2.2.100-linux-x64.tar.gz
    #https://dotnetcli.blob.core.windows.net/dotnet/checksums/2.2.100-sdk-sha.txt
    export DOTNET_SDK_VERSION=2.2.100

    curl -SL --output dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/519eac6e-f2c9-49dd-a60d-02072ed8e5b3/aed96c5eee6a74a5cde2e3f1ad4c7121/dotnet-sdk-$DOTNET_SDK_VERSION-linux-x64.tar.gz \
    && dotnet_sha512='C8282CE26DBB60872FC5BEB61EE2B6C7D07B87B57554455C017038EE5805596E277E47C721D6C676C8E5ABE3794AB0BD99CFF51147975B88E0B8D4C066FB6E15' \
    && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
    && tar -zxf dotnet.tar.gz -C $HOME/dotnet \
    && rm -f dotnet.tar.gz

```

## Install .NET Core SDK 2.2 Preview

```bash

    #https://dotnetcli.blob.core.windows.net/dotnet/checksums/2.2.100-preview3-009430-sdk-sha.txt
    export DOTNET_SDK_VERSION=2.2.100-preview3-009430
    
    curl -SL --output dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_SDK_VERSION/dotnet-sdk-$DOTNET_SDK_VERSION-linux-x64.tar.gz \
    && dotnet_sha512='c74aeec0e141711359e4af0785fa3af457949783233ad07e7afea2f98f34ddfbf9ced56fb29a92b5350381c4698a4fae09865af9ee03ef24195ec659e852a089' \
    && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p $HOME/dotnet \
    && tar -zxf dotnet.tar.gz -C $HOME/dotnet \
    && rm -f dotnet.tar.gz \
    && echo "export DOTNET_ROOT=$HOME/dotnet " >> ~/.bashrc \
    && source ~/.bashrc

```

## Install .NET Core SDK 3.0.100-preview-009812

```bash

    #https://dotnetcli.blob.core.windows.net/dotnet/checksums/3.0.100-preview-009812-sdk-sha.txt

    export DOTNET_SDK_VERSION=3.0.100-preview-009812

    curl -SL --output dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_SDK_VERSION/dotnet-sdk-$DOTNET_SDK_VERSION-linux-x64.tar.gz \
    && dotnet_sha512='109E2EA82350DFAC79ED0D5A3FD56B22BD78269AE7099ED288A7893DF4B24DB6E5A7934F4764A5763D3F0777FE8E51A8F2454EA1055700D62111B396FA5E8B39' \
    && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p $HOME/dotnet \
    && tar -zxf dotnet.tar.gz -C $HOME/dotnet \
    && rm -f dotnet.tar.gz

```

## [Installing Microsoft Artifacts Cred Provider](https://github.com/Microsoft/artifacts-credprovider)

```bash
    sudo curl -SL https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh | bash
```