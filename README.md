# Docker env
We created a compose of docker containers to run ShTP via one command(almost). TODO: Add Nginx for production setup.

# Server setup
To run ShTP we recomend to use a server running Linux. I don't know how docker works on Windows. 
* Then you have to install docker and docker compose. </br>
Arch-based: `sudo pacman -S docker docker-compose`</br>
Debian-based: `sudo apt install docker docker-compose`
* Run docker daemon and setup its autorun (for systemd init solutions) </br>
```
sudo systemctl enable docker
sudo systemctl start docker
```
* Enable non root access to docker (refer to official docs)</br>
```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```
You may need to relogin to apply changes. But now, our server is ready.

# How to run
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
* Change pathes to sources of Frontend and Backend in `.env` file (you can use absolute or relative path)
```
BACKEND_SOURCE="../Backend/"
FRONTEND_SOURCE="../Frontend"
```
* Export variables from .env to your session: `source ./.env`
* Run `docker-compose -f docker-compose.dev.yaml up` or `./run.sh`
The first time run of docker-compose can take some time, because it will build Frontend, Backend docker images and download postgresql image.
</br> You will be able to access ShTP after such line in docker log (last container is frontend): </br>
`docker-frontend-1  |  INFO  Accepting connections at http://localhost:3000`
