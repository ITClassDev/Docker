# Docker env
We created a compose of docker containers to run ITC System via one command!

# Howto run
* To run ITC you have to install `docker` and `docker-compose` packages in your system.
* Then download sources of Backend and Frontend to any folder of your server
* Change pathes to sources of Frontend and Backend in `.env` file
* Export variables from .env to your terminal: `source ./.env`
* Run `docker-compose -f docker-compose.dev.yaml up`

