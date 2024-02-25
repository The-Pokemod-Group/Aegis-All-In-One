# Aegis All in One Mapping Solution

## Introduction

This repository is meant to help newbies to give their first steps into the Pokémon Mapping world using Aegis (https://pokemod.dev) and the Unown# (https://github.com/blahblah) stack.

For people rather interested in Atlas (https://pokemod.dev) and RDM (https://blahblah), you should head over to our other repository

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
- unown/...
