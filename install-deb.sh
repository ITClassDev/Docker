cd ..
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -fy
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -fy
sudo apt install docker docker-compose -fy
sudo systemctl enable docker
sudo systemctl start docker
git clone https://github.com/ITClassDev/Backend
git clone https://github.com/ITClassDev/FrontEnd
