# Debian LAMP Stack
**L**inux, **A**pache HTTP Server, **M**ySQL/**M**ariaDB, **P**HP/**P**erl/**P**ython

### Vagrant Config


> View `./Vagrantfile`

- Box: **[debian/jessie64](https://app.vagrantup.com/debian/boxes/jessie64)**
- Network: [http://192.168.33.10/](http://192.168.33.10/)
- Synced Folder: `./public`
- Provider: [VirtualBox](https://www.virtualbox.org/)  

[https://www.vagrantup.com/docs/vagrantfile/](https://www.vagrantup.com/docs/vagrantfile/)

---

### Vagrant Provision (Shell)

> View `./bootstrap.sh`

- Apache2
- PHP 7.1
 \- CLI  
 \- CURL  
 \- MBSTRING  
 \- MySQLi & PDO  
 \- Xdebug  
 \- Zip  
- MySQL (MariaDB 10.0)
- CURL
- Composer
- Git  

[https://www.vagrantup.com/docs/provisioning/shell.html](https://www.vagrantup.com/docs/provisioning/shell.html)

---

### Install

> Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/).  
Copy files in your project folder or clone this project with [Git](https://git-scm.com/).  
Open console:

	cd /go/in/your/project/folder/
    vagrant up --provision

> View in your browser [http://192.168.33.10/](http://192.168.33.10/)