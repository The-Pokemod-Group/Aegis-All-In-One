# Aegis All in One Mapping Solution

## Introduction

This repository is meant to help newbies to give their first steps into the Pokémon Mapping world using Aegis (https://www.pokemod.dev) and the Unown# (https://github.com/UnownHash) stack.

For people rather interested in Atlas (https://www.pokemod.dev) and RDM (https://github.com/RealDeviceMap), you should head over to our other repository (https://github.com/The-Pokemod-Group/Atlas-All-In-One)

## Disclaimer

This repository is meant to be used as a **PROOF OF CONCEPT** meaning that it's not meant to be used in a production environment. It's meant to be used as a learning tool and to help you understand how the different services interact with each other.

# WARNING WARNING WARNING

This is an **INSECURE** install. If you run this on an internet exposed server, you can easily be hacked as many services don't have embedded authentication. Some of the services will leak personal information even while using the default embedded auth (Dragonite Admin, Koji, etc) so consider yourself **WARNED**.

Ideally, you **SHOULD** use a reverse proxy and, at the minimum, place basic auth for your exposed services. If you run a reverse proxy like **SWAG** (https://docs.linuxserver.io/general/swag/) you should opt to run **Authelia** to assure further security and privacy all around. In a production environment with remote ATV devices, you only want to have ports 80, 443 and 7070 (protected by authbearer) exposed. With a local server and devices, you shouldn't expose port 7070 to the outside world.

## Installation

### 1. Clone the repository

```
git clone https://github.com/The-Pokemod-Group/Aegis-All-In-One.git
```

### 2. Copy the configuration files

```
cd Aegis-All-In-One
cp env-default .env
```

### 3. Edit the configuration files

Despite that you can immediately start the stack with the default passwords and secrets defined, we strongly urge you to change them to your liking.

If you do, pay special attention to the secrets inside the .env file and make sure apiKeys and passwords match in the following places:

- .env
- reactmap/local.json
- unown/dragonite_config.toml
- unown/golbat_config.toml
- unown/rotom_config.json (AuthBearer for Aegis Devices)

You can run everything with the default passwords but obviously, it's not recommended.

### 4. Start the stack

```
sudo docker-compose up -d --force-recreate --build
```

You should check each running container for errors after first start in the form of:

```
sudo docker logs <name_of_container>
```

It's normal that after the first start some errors appear as, for example, Koji needs to have
at least one project for dragonite/reactmap to pull the areas from but overall, all containers should boot up normally.

### 5. Check if all systems are running

Point your browser to the following addresses. replace localhost with your server's IP address, if needed:

- http://localhost:6001 (reactmap)
- http://localhost:6002 (Dragonite UX)
- http://localhost:6003 (Rotom UX)
- http://localhost:6004 (Koji UX)
- http://localhost:6005 (PhpMyAdmin)
- http://localhost:6006 (Grafana UX)

### 6. What now?

Now comes the fun part. Start reading and learning how all of this works. We recommed you to head over to the unown# discord server for specific help regarding Dragonite, Golbat and Rotom (https://discord.gg/Vjze47qchG), for Reactmap and Koji check ou their server at https://discord.gg/EYYsKPVawn.

Anything regarding Aegis, feel free to ask about in our Discord server (https://discord.gg/pokemod) too!

In general terms, you will need to:

1. Add accounts to Dragonite
2. Add at least one project with areas in Koji (check the image below for an example of a full running setup)
3. Sync the project with dragonite
4. Add at least one Aegis Device (should be autodetected by Rotom once you configure the ATV and Aegis properly)
5. Map away

Additionally you can

6. Check out unown# github and download the available Grafana Dashboards for easy import into your grafana instance

_Koji Projects:_

![Koji Sample Projects](https://i.ibb.co/YhdSWCq/koji-projects.png)

_ReactMap:_

![Reactmap Sample Area](https://i.ibb.co/b7BS6Ww/reactmap.png)

_Dragonite:_

![Dragonite Sample](https://i.ibb.co/7SDmxrm/dragonite.png)

_Rotom:_

![Rotom Sample](https://i.ibb.co/6FPB2ry/rotom.png)

_Grafana:_

![Grafana Sample](https://i.ibb.co/qr1v3CP/grafana.png)

# REMEMBER

This setup **ISN'T** production ready. You really need to secure your install. Prefereably with a Reverse Proxy and close/protect your accesses.

Debugging is a big part of the process, so don't be afraid to ask for help in our Discord server (https://discord.gg/pokemod)
