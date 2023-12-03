# Scorsa IoT Stack

## Overview
Scorsa IoT Stack is an integrated suite of tools designed to streamline the setup and management of IoT environments. It includes Node-RED for flow-based programming, MQTT for messaging, InfluxDB for database management, and Grafana for data visualization. This stack is particularly tailored for handling IoT sensor data, making it ideal for educational and developmental purposes in the IoT domain.

## Features
- **Node-RED**: An easy-to-use programming tool for wiring together hardware devices, APIs, and online services.
- **MQTT Broker**: A lightweight messaging protocol, ideal for communication in IoT applications.
- **InfluxDB**: A time-series database designed to handle high write and query loads.
- **Grafana**: A powerful visualization tool for time-series data.

## Installation
1. Ensure Docker and Docker Compose are installed on your system.
2. Clone this repository:

git clone:
'''
https://github.com/username/scorsa-iot-stack.git
'''
3. Navigate to the cloned directory:

cd scorsa-iot-stack

4. Run the setup script:

bash start-scorsa-iot-stack.sh

5. Follow the on-screen prompts to select and start the desired services.

## Usage
- Access Node-RED at `http://<your-pi-ip>:1880`
- Connect to the MQTT broker at `<your-pi-ip>:1883`
- Access Grafana at `http://<your-pi-ip>:3000`
- InfluxDB will be running at `<your-pi-ip>:8086`

## Contributing
Contributions to Scorsa IoT Stack are welcome! Please read our contributing guidelines for details.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
