# Installation steps for openSUSE leap 15.0  

  - Install openSUSE Leap 15.0  
  
  - Update os:  
    ```
    sudo zypper update
    ```
  - Prepair user for passwordless sudo access  
    ```
    sudo usermod -aG wheel currentuser
    sudo visudo
    ```   
  - Update pip:   
    ```
    sudo pip install -U pip
    ```   
  - Install usefull packages:  
    ```
    sudo zypper install -y git
    sudo zypper install -y lsb-release
    sudo zypper install -y python-os-testr
    ```
  - Prepair working directories:  
    ```
    sudo mkdir -p /opt/stack
    sudo chown currentuser:wheel /opt/stack
    ```
      
