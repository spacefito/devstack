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
  - Clone devstack repo
    ```
    cd /opt/stack
    git clone https://git.openstack.org/openstack-dev/devstack
    ```
  - Prepair simple local.conf: 
    ```
    cd /opt/stack/devstack
    vi local.conf
    ```
    local.conf should look something like: 
    ```
    [[local|localrc]]
    ADMIN_PASSWORD=secret
    DATABASE_PASSWORD=$ADMIN_PASSWORD
    RABBIT_PASSWORD=$ADMIN_PASSWORD
    SERVICE_PASSWORD=$ADMIN_PASSWORD
    
