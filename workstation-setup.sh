#!/bin/bash
set -e

echo "===== Updating system ====="
sudo apt update -y && sudo apt upgrade -y

# ---------------------------
# Prerequisites
# ---------------------------
echo "===== Installing prerequisites ====="
sudo apt install -y curl wget gnupg software-properties-common unzip

# ---------------------------
# JDK 21
# ---------------------------
echo "===== Installing OpenJDK 17 ====="
sudo apt install fontconfig openjdk-21-jre

# ---------------------------
# Jenkins
# ---------------------------
echo "===== Installing Jenkins ====="
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# ---------------------------
# AWS CLI v2
# ---------------------------
echo "===== Installing AWS CLI v2 ====="
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# ---------------------------
# Terraform
# ---------------------------
echo "===== Installing Terraform ====="
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt install -y terraform

echo "===== Installation Completed Successfully! ====="
