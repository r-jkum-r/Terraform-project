#!/bin/bash

# Update system packages
sudo apt update -y

# Install Java (required for Jenkins)
sudo apt install openjdk-17-jdk -y

# Verify Java
java -version

# Add Jenkins key and repo
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
sudo apt update -y
sudo apt install jenkins -y

# Start Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Print Jenkins status
sudo systemctl status jenkins
