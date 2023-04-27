# Docker env
We created a compose of docker containers to run ShTP via one command(almost).

# Automatic installation
### Prepare
These scripts perform the following actions:
* Install Docker and Docker-Compose
* Clones the necessary repositories to the directories

Arch-Based systems:
```shell
sudo pacman -S docker docker-compose && sudo systemctl enable docker && sudo systemctl start docker && mkdir ShTP && git clone https://github.com/ITClassDev/Docker ShTP/Docker && git clone https://github.com/ITClassDev/Backend ShTP/Backend && git clone https://github.com/ITClassDev/FrontEnd ShTP/Frontend
```
Debian-Based systems:
```shell
sudo apt update && sudo apt install apt-transport-https ca-certificates curl software-properties-common -fy && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y && sudo apt install docker docker-compose -fy && sudo systemctl enable docker && sudo systemctl start docker && mkdir ShTP && git clone https://github.com/ITClassDev/Docker ShTP/Docker && git clone https://github.com/ITClassDev/Backend ShTP/Backend && git clone https://github.com/ITClassDev/FrontEnd ShTP/Frontend
```

If you run ShTP on production server, you have to tune backend settings in `api->environment` section of `shtp_beta.dev.yaml` file(for more refer to Backend's readme). </br>
Change values below to yours():
```
ITC_SECRET_KEY="PLACE RANDOM STRING HERE" # this string used for jwt token encryption (salt)
ITC_SETUP_MODE=1 # Set this value to 1 to enable setup mode on ShTP, then after setup stop ShTP, change to 0 and restart ShTP
```
### Run
Just use run.sh script in Docker folder
```shell
cd ShTP/Docker && ./run.sh
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
