# Setup docker
# sudo apt install docker docker-compose -y
sudo systemctl enable docker && sudo systemctl start docker && sudo groupadd docker && sudo usermod -aG docker $USER && newgrp docker

# Download sources
mkdir ShTP && cd ShTP
git clone https://github.com/ItClassDev/Docker # Docker configs
git clone https://github.com/ItClassDev/Frontend # Frontend sources
git clone https://github.com/ItClassDev/Backend # Backend sources

# Run IT
cd Docker
./run.sh
