 apt update
      apt install default-jdk -y
     apt install maven
      apt install maven -y
      sudo wget -O /usr/share/keyrings/jenkins-keyring.asc   https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
    
  sudo apt-get update
    
  sudo apt-get install jenkins
    
  cat /var/lib/jenkins/secrets/initialAdminPassword
    sudo apt update
   sudo apt install software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
   sudo apt install ansible
   sudo apt-get updae && sudo apt-get install -y gnupg software-properties-common
 
  sudo apt-get update && sudo apt-get install -y gnupg software-prop.erties-common

 sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
 
  wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

  gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

  gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

  sudo apt update

 sudo apt-get install terraform

  sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installDocker.sh -P /tmp

   sudo chmod 755 /tmp/installDocker.sh
 
 sudo bash /tmp/installDocker.sh
   
  sudo systemctl restart docker.service

 sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installCRIDockerd.sh -P /tmp

  sudo chmod 755 /tmp/installCRIDockerd.sh

 sudo bash /tmp/installCRIDockerd.sh

 sudo systemctl restart cri-docker.service

