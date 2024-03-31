# Aegis All in One Mapping Solution

## Introduction

This repository is meant to help newbies to give their first steps into the Pokémon Mapping world using Aegis (https://www.pokemod.dev) and the Unown# (https://github.com/UnownHash) stack.

For people rather interested in Atlas (https://www.pokemod.dev) and RDM (https://github.com/RealDeviceMap), you should head over to our other repository (https://github.com/The-Pokemod-Group/Atlas-All-In-One)

## Disclaimer

This repository is meant to be used as a **PROOF OF CONCEPT** meaning that it's not meant to be used in a production environment unless you secure it properly. It's meant to be used as a learning tool and to help you understand how the different services interact with each other.

# WARNING WARNING WARNING

This is an **INSECURE** install. If you run this on an internet exposed server, you can easily be hacked as many services don't have embedded authentication. Some of the services will leak personal information even while using the default embedded auth (specially Dragonite Admin, Koji and Rotom) so consider yourself **WARNED**.

Ideally, you **SHOULD** use a reverse proxy and, at the minimum, place basic auth for your exposed services. If you run a reverse proxy like **SWAG** (https://docs.linuxserver.io/general/swag/) you should opt to run **Authelia** to assure further security and privacy all around. In a production environment with remote ATV devices, you only want to have ports 80, 443 and 7070 (protected by authbearer) exposed. With a local server and devices, you shouldn't expose port 7070 to the outside world.

## Pre-installation

Make sure you have a Linux environment available. Albeit it is possible to run Docker under Windows, this AIO hasn't been tested in that environment so no support can be provided.

Moreover, you will need to have Docker Engine and Docker Compose plugin updated to a recent version in order for services used in this AIO repository to work correctly!!!

Regarding Docker configurations, due to the massive logs size that can accumulate over time, it is strongly recommended that you configure your Docker service to limit and rotate logs. You can achieve this by creating or editing the daemon.json file in your system:

```
sudo nano /etc/docker/daemon.json
```

and placing inside:

```
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m",
    "max-file": "3"
  }
}
```

This will limit the logs to a total of 300Mbytes and rotate them every 100Mbytes.

Don't forget to restart the docker service once you've edited/create the file above with

```
sudo systemctl restart docker
```

## Installation

### 1. Clone the repository

```
git clone https://github.com/The-Pokemod-Group/Aegis-All-In-One.git
```

### 2. Copy the configuration files

```
cd Aegis-All-In-One
cp env-default .env
cp reactmap/local-default.json reactmap/local.json
cp unown/dragonite_config-default.toml unown/dragonite_config.toml
cp unown/golbat_config-default.toml unown/golbat_config.toml
cp unown/rotom_config-default.json unown/rotom_config.json
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

After recent Pokemon-Trainer-Club (PTC) changes, you are required to use some sort of login proxy to bypass the Imperva Anti-Bot protection placed on PTC login.
The Unown# team has introduced two new tools for that; Swirlix and Xilriws. At the time of this being written Swirlix is not working for everyone, therefore we are using Xilriws!
Please refer to the Xilriws GitHub Repository (https://github.com/UnownHash/Xilriws-Public) to understand more.
If you are planning to use many workers you SHOULD change `replicas` value under `xilriws-worker` service on:
- docker-compose.yml
to some higher value. KEEP IN MIND, the higher the number, the more resources (CPU-RAM) required. If you have no refresh tokens you will require more PTC logins and this more replicas!

Finally, before starting the stack, you should go through the `docker-compose.yml` and adjust things to your liking. For example, you might want to change the ports that the services are exposed on.

### 4. Start the stack

```
docker compose up -d --force-recreate --build
```

(\*) You might need to run the above command with sudo if your local user doesn't have permissions over the docker service

If you get an error in form of `The "UID" variable is not set. Defaulting to a blank string.` it means your shell isn't exporting the UID/GUID variables that are needed for grafana. You can overcome this by starting the stack with:

```
UID=${UID} GID=${GID} docker compose up -d --force-recreate --build
```

(\*) You might need to run the above command with sudo if your local user doesn't have permissions over the docker service

Another option would be to comment out the grafana section if you don't need it.

You should check each running container for errors after first start in the form of:

```
docker logs <name_of_container>
```

(\*) You might need to run the above command with sudo if your local user doesn't have permissions over the docker service

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

#### Special note

On some occasions one or more of these ports may already be assigned to other services which largely depends on each specific machine. If you're presented with a **_"port already in use"_** error, please change the corresponding container port in the `docker-compose.yaml` file.

### 6. Working with Grafana

Albeit not critical to normal operation, it's always nice and informative to have some kind of performance metrics of your setup. In order to get a glimpse of what you can get with it, you should import our custom example dashboard that's inside the grafana folder (based on Dragonite's default prometheus dashboard but with some other metrics).

1.  point your browser to http://localhost:6006
2.  login with the default admin/admin credentials (for God sake, change them once you've logged in)
3.  Add a new prometheus datasource and point it to `victoriametrics:8428`
4.  Tap on Dashboards → Add New → Import and select `Dragonite-Emi-v5.json`
5.  Tap save

That's it. If you want more dashboards, you can find them at Unown#'s github.

### 7. What now?

Now comes the fun part. Start reading and learning how all of this works. We recommed you to head over to the unown# discord server for specific help regarding Dragonite, Golbat and Rotom (https://discord.gg/Vjze47qchG), for Reactmap and Koji check ou their server at https://discord.gg/EYYsKPVawn.

Anything regarding Aegis, feel free to ask about in our Discord server (https://discord.gg/pokemod) too!

In general terms, you will need to:

1. Add accounts to Dragonite (lots of them! Account usage depends on each setup and use case including active options like `recycle_on_jail=true` but to be safe, consider at least 100 per worker x `minimum_account_reuse_hours` / 24)
2. Add at least one project with areas in Koji (check the image below for an example of a full running setup)
3. Sync the project with Dragonite and Reactmap
4. Add at least one Aegis Device (should be autodetected by Rotom once you configure the ATV and Aegis properly)
5. Map away

### 8. Aegis config

This is typically unnecessary, because filling in the details in the app is usually sufficient.

The configuration file for Aegis is placed in /data/local/tmp/aegis_config.json, and the same goes for the logs at /data/local/tmp/aegis.log.

As for the configuration file, here is an example:

```
{
    "authBearer": "bearer_for_rotom",
    "deviceAuthToken": "your_unique_auth_token_from_aegis_portal",
    "deviceName": "your_device_name",
    "email": "your_email_from_aegis_portal",
    "rotomUrl": "ip:port",
    "runOnBoot": true
}
```

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
