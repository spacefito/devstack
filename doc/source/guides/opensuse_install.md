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
    
   - Run stack:
     ```
     cd /opt/stack/devstack
     ./stack.sh
     ```
     
     DONE:
     ```
     =========================
     DevStack Component Timing
      (times are in seconds)  
     =========================
     run_process           56
     test_with_retry        3
     osc                  195
     wait_for_service      21
     git_timed            101
     dbsync               422
     pip_install          492
     -------------------------
     Unaccounted time     1192
     =========================
     Total runtime        2482

     This is your host IP address: 192.168.121.15
     This is your host IPv6 address: ::1
     Horizon is now available at http://192.168.121.15/dashboard
     Keystone is serving at http://192.168.121.15/identity/
     The default users are: admin and demo
     The password: secret

     WARNING: 
     Using lib/neutron-legacy is deprecated, and it will be removed in the future


     Services are running under systemd unit files.
     For more information see: 
     https://docs.openstack.org/devstack/latest/systemd.html

     DevStack Version: train
     Change: dc9ba8b8aee4022ef1598cd0d8cfd7dfe34a4b6b Add opendev to repo search list 2019-04-23 13:02:54 +0000
     OS Version: openSUSE 15.0 n/a

     2019-04-24 23:06:50.730 | stack.sh completed in 2482 seconds.
     ```
