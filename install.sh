--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash
ansible :
sudo apt update
sudo apt install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
aws:
#install aws cli
sudo apt update
sudo apt install awscli
sudo apt install curl unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
aws configure
    #then add access key and secret access key
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
docker:
#Ubuntu
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

#Centos
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
gcloud:
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli
# IAM & Admin > Service Accounts > Create Service Account > Assign Roles > In the Service Accounts > three dots on the right and choose Manage keys > dd Key > Create New Key > Select JSON
gcloud auth activate-service-account [JSON_SERVICE_ACCOUNT_EMAIL] --key-file=[JSON_KEY_FILE]
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
jenkins:
docker run -p 8080:8080 -p 50000:50000 -d \                                                                                                                                               ✔ 
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker jenkins/jenkins:jdk21


#then
#on host  : 
  getent group docker -> docker:x:999:your_username
  sudo chmod 660 /var/run/docker.sock

docker exec -u root -it jenkins /bin/bash 
  groupadd -g 999 docker
  usermod -aG docker jenkins
  chown -R jenkins:jenkins /var/jenkins_home
  chmod -R 775 /var/jenkins_home

docker restart jenkins

#install python :
apt-get update
apt-get install -y python3 python3-pip
apt-get install -y python3-venv
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
kubernates:
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
terraform:
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform

terraform -version


#infracost
curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh
cd my-terraform-project
infracost breakdown --path .
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
