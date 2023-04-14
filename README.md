# Docker env
We created a compose of docker containers to run ShTP via one command(almost). TODO: Add Nginx for production setup.

# Automatic installation
### Prepare
* Create ShTP folder
* Clone this repository

Arch-Based systems:
```shell
mkdir ShTP
cd ShTP
git clone https://github.com/ITClassDev/Docker
cd Docker
./install-arch.sh
```
Debian-Based systems:
```shell
mkdir ShTP
cd ShTP
git clone https://github.com/ITClassDev/Docker
cd Docker
./install-deb.sh
```

If you run ShTP on production server, you have to tune backend settings in `Backend/Dockerfile` file(for more refer to Backend's readme). </br>
Change values below to yours():
```
ITC_SECRET_KEY="PLACE RANDOM STRING HERE" # this string used for jwt token encryption (salt)
ITC_SETUP_MODE=1 # Set this value to 1 to enable setup mode on ShTP, then after setup stop ShTP, change to 0 and restart ShTP
```

### Run

Just use run.sh script
```shell
./run.sh
```

# Manual installation
### Server setup
To run ShTP we recommend to use a server running Linux. I don't know how docker works on Windows. 
* Then you have to install docker and docker compose. </br>
Arch-based: `sudo pacman -S docker docker-compose`</br>
Debian-based(ex. Ubuntu Server): `sudo apt install docker docker-compose`
* Run docker daemon and setup its autorun (for systemd init solutions) </br>
```
sudo systemctl enable docker
sudo systemctl start docker
```
* Enable non-root access to docker (refer to official docs)</br>
```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```
You may need to re-login to apply changes. But now, our server is ready.

### Prepare sources
* Then download sources of Backend and Frontend to any folder of your server. We use such directory tree: </br>
```
── ShTP
    ── Docker:
    ──── This repo sources
    ── Frontend
    ──── Frontend repo sources
    ── Backend
    ──── Backend repo sources
```
To download sources, use git: 
```
git clone https://github.com/ITClassDev/Backend
git clone https://github.com/ITClassDev/FrontEnd
```
* If you run ShTP on production server, you have to tune backend settings in `Backend/Dockerfile` file(for more refer to Backend's readme). </br>
Change values below to yours():
```
ITC_SECRET_KEY="PLACE RANDOM STRING HERE" # this string used for jwt token encryption (salt)
ITC_SETUP_MODE=1 # Set this value to 1 to enable setup mode on ShTP, then after setup stop ShTP, change to 0 and restart ShTP
```
### Run ShTP
* Change patches to sources of Frontend and Backend in `.env` file (you can use absolute or relative path)
```
BACKEND_SOURCE="../Backend/"
FRONTEND_SOURCE="../Frontend"
```
* Export variables from .env to your terminal session: `source ./.env`
* Run `docker-compose -f docker-compose.dev.yaml up` or `./run.sh` (If you changed some code, run docker-compose with --build flag at the end of command)
The first time run of docker-compose can take some time, because it will build Frontend, Backend docker images and download postgresql image.
</br> You will be able to access ShTP after such line in docker log (last container is frontend): </br>
`docker-frontend-1  |  INFO  Accepting connections at http://localhost:3000`
