#!/bin/bash

# ASCII Art for SCORSA UNISEL
echo "=========================="
echo "+========================+"
echo "+   SCORSA UNISEL   +"
echo "+========================+"
echo "=========================="

ask_yes_no() {
    while true; do
        read -p "$1 (yes/no): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Function to install Docker
install_docker() {
    if ask_yes_no "Do you want to install Docker?"; then
        echo "Installing Docker..."
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh
        sudo usermod -aG docker $USER
        echo "Docker installed successfully. Please log out and back in for the changes to take effect."
    else
        echo "Skipping Docker installation."
    fi
}

# Function to install Docker Compose
install_docker_compose() {
    if ask_yes_no "Do you want to install Docker Compose?"; then
        echo "Installing Docker Compose..."
        sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        echo "Docker Compose installed successfully."
    else
        echo "Skipping Docker Compose installation."
    fi
}

# Check if Docker is installed, if not, prompt for installation
if ! [ -x "$(command -v docker)" ]; then
    install_docker
else
    echo "Docker is already installed."
fi

# Check if Docker Compose is installed, if not, prompt for installation
if ! [ -x "$(command -v docker-compose)" ]; then
    install_docker_compose
else
    echo "Docker Compose is already installed."
fi

services=""

# Function to prompt user for service installation
prompt_service_installation() {
    local service_name="$1"
    local docker_compose_service_name="$2"
    if ask_yes_no "Do you want to install and start $service_name?"; then
        services+="$docker_compose_service_name "
    fi
}

# Prompting for each service
prompt_service_installation "Node-RED" "nodered"
prompt_service_installation "MQTT Broker" "mosquitto"
prompt_service_installation "InfluxDB" "influxdb"
prompt_service_installation "Grafana" "grafana"

if [ -n "$services" ]; then
    echo "Starting selected services: $services"
    docker-compose up $services
else
    echo "No services selected for installation."
fi
