# Aegis All in One Mapping Solution

## Introduction

This repository is meant to help newbies to give their first steps into the Pokémon Mapping world using Aegis (https://www.pokemod.dev) and the Unown# (https://github.com/UnownHash) stack.

For people rather interested in Atlas (https://www.pokemod.dev) and RDM (https://github.com/RealDeviceMap), you should head over to our other repository (https://github.com/The-Pokemod-Group/Atlas-All-In-One)

## Installation

### 1. Clone the repository

```
git clone https://github.com/The-Pokemod-Group/Aegis-All-In-One.git
```

### 2. Copy the configuration files

```
cd aegis-all-in-one
cp .env-default .env
cp docker-compose-default.yaml docker-compose.yaml
```

### 3. Edit the config files to your liking. Pay special attention to the Api secrets inside the .env file

Make sure ApiKeys and Passwords match in the following places:

- .env
- reactmap/local.json
- unown/dragonite_config.toml
- unown/golbat_config.toml
- unown/rotom_config.json (AuthBearer for Aegis Devices)

### 4. Start the stack

```
sudo docker-compose up -d --force-recreate --build
```

You should check each running container for errors after first start in the form of:

```
sudo docker logs <name_of_container>
```

It's normal that after the first start some errors appear as, for example, Koji needs to have
at least one project for dragonite/reactmap.

![Koji Sample Projects](https://i.ibb.co/YhdSWCq/koji-projects.png)

Debugging is a big part of the process, so don't be afraid to ask for help in our Discord server (https://discord.gg/pokemod)

# WARNING WARNING WARNING

This is an insecure setup. If you run this on an internet exposed server, you can easily be hacked as many services don't have embedded auth. Some will leak personal information even while using the embedded auth so consider yourself **warned**.

Ideally, you **should** use a reverse proxy and, at the minimum, place basic auth to your exposed services. If you run a reverse proxy like SWAG (https://docs.linuxserver.io/general/swag/) you should opt to run **Authelia** to assure further security and privacy all around.
