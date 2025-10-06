<p align="center">
  <img src="https://github.com/user-attachments/assets/9e8d6a8c-2651-4bb3-9625-438a663fe3e1" width="600" alt="welcome"></p>

Hi! I'm Nahuel, a tech enthusiast on the path to become SysAdmin. 
My first contact with the field was when I was 8 years old and I hosted my first dedicated servers, I also became interested in hardware since a young age.
After a brief pause and exploring different career paths (and feeling a bit lost) I've now decided to fully dive into IT, creating this project to learn, experiment and rediscover my old passion. 

# My intensive learning journey to become SysAdmin
I'm on an ultralearning journey to acquire the skills and knowledge needed to pursue a junior sysadmin position. I dedicate 6-8 hours of study/work, 7 days a week and my final goal, with work and dedication, is to earn certifications, build a portfolio with lab projects and gain the knowledge and experience necessary to launch my career in IT. The main focus of this journey is to learn:
- 📺 Virtualization
- 📟 Servers
- 🌐 Networking
- 📄 Scripting
- 💻 A programming language
- 📦 Containerization
- ☁️ Cloud

## 📚Resources:
<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=powershell,linux,vscode,ubuntu,windows,go,docker,aws" />
    <img src="https://upload.wikimedia.org/wikipedia/commons/0/00/Virtualbox_logo.svg" alt="VirtualBox" width="48" height="48" />
   <img src="https://upload.wikimedia.org/wikipedia/commons/7/70/Kvmbanner-logo2_1.png" alt="KVM" width="80" height="80" />
  </a>
</p>


## 📁Projects:
**I used the projects as a way of learning by doing, to track my strengths and identify areas for improvement.**

---

### <p align="center"> <ins> Ubuntu Server: my main lab</ins></p>
**🧠 <ins>Goals**</ins>
- ✅ Create a server with users, groups, and permissions
- ✅ Make it multifunctional (Web server, DNS server, install a VPN)
- ✅ Automate basic maintenance tasks (system updates, backups, etc)
- ✅ Implement security measures (firewall, SSH hardening, monitoring)
- ✅ Use of containers for deployment
- ✅ Expand server functionality (add more services)

**⚙️ <ins>Server Specifications**</ins> 
- **OS**: Ubuntu Server 24.04
- **VM**: VirtualBox
- **Network**: NAT port-forwarding / Bridged to connect via other devices
- **Access**: SSH LAN

**🧰 <ins>Running Services</ins>**
- 🔹**Pihole + WG-easy** 🐳
1. I installed the Docker packages following the official documentation.
2. I combined the Pi-hole and wg-easy containers. [docker-compose.yml](docker-compose.yml)
3. Then, I applied my custom settings, opened the necessary ports, and resolved any conflicts.
> _this part took me a lot of time and effort, as i had to disable systemd-resolved, adjust and forward ports, assign a static IP to the DNS, etc._

et Voila!
<p align="left">
  <img src="https://github.com/user-attachments/assets/feeff055-dd9f-4895-8e04-258da28a4016" width="510" alt="1">
  <img src="https://github.com/user-attachments/assets/ca6f5a0e-6ad6-48e6-a4ee-2db9d09b16e9" width="500" alt="2">
</p>
<p align="left">
  <img src="https://github.com/user-attachments/assets/02e12ea4-b680-4d30-ae5f-6ffccc0c1ea2" width="500" alt="3">
</p>

<p align="left">
  <img src="https://github.com/user-attachments/assets/cb9f037d-aeb8-4b6d-9296-7775057e60fc" width="500" alt="4">
</p>

- 🔹**Apache**
1. Install Apache packages.
2. Configure the .html.
3. Change the port to avoid conflicts with the other services.
<p align="left">
 <img width="790" height="654" alt="5" src="https://github.com/user-attachments/assets/b198d789-6385-419f-af7f-5f8d45d40359" />
</p>

>_it's the first version of my retro page that I later migrated to golang._

### 🐳**More Docker containers**
  - I have another docker compose file that runs the following services together: Nginx, Postgres, Adminer and Portainer.
    - <ins>Portainer: to manage and see the logs on the different services.</ins>
<p align="left">
  <img src="https://github.com/user-attachments/assets/582d490b-7891-4a1e-ae4d-771c36a7cb02" width="800" alt="11">
</p>
<ins>Adminer-PostgreSQL: I plan in the future to get started with databases so, I have it installed already.</ins>
<p align="left">
  <img src="https://github.com/user-attachments/assets/7870bfda-dc68-454f-9fec-51bd15307a4d" width="800" alt="12">
</p>

- 🔹**Automation scripts**
  - *Scheduled with cron:*
    [scripts/update.sh](scripts/update.sh): Bash script for automated system updates and cleanup using `apt`.
  - *Manual:*
    [scripts/scriptfind.sh](scripts/scriptfind.sh): Bash script to find archives.
   
>_it's basics scripts but is the ones i used the most._

**🔒 <ins>Security</ins>**
- A quick SSH Hardening
  
1. Run `ssh-keygen t- ed22519` in PowerShell

2. Copy the public key using `cat ~/.ssh/id_ed25519.pub` and paste it to
the `~/.ssh/authorized_keys` file on the server.

3. I connect to the server, `ssh -i ~/.ssh/id_ed25519 user@localhost -p (port)` in my case

> _here i had a permissions error with the private key of my host machine. to adjust permissions:_

4. In powershell, I remove inheritance, "Everyone", "Users" and I give read-only permissions:

`icacls id_ed25519 /inheritance:r
icacls id_ed25519 /remove "Everyone"
icacls id_ed25519 /remove "Users"
icacls id_ed25519 /grant:r "$($env:USERNAME):(R)"`

5. I connect again to the server to check everything is alright and then with `sudo nano /etc/ssh/ssh_config` . I uncomment `#PasswordAuthentication` and set it to `no`. Restart ssh with `systemctl restart ssh`.
After executing `ssh -v` we see that it connects with the public key.
<p align="left">
  <img src="https://github.com/user-attachments/assets/f4287904-9318-4702-84cd-ec7909ff4dbc" width="800" alt="13">
</p>

- Other security measures implemented: Firewall UFW, maintaining all in the LAN with NAT, non-root user accounts with sudo, system updates, and backups.

**📌 <ins>Key points</ins>**
- I decided to keep wg-easy running over HTTP only, as I don't have a domain to set up a reverse proxy yet.
- Since the server doesn't need to be accessed from outside the LAN, it remains within the private network.
- I plan to replicate this in the future using a RaspBerry Pi.
- Some services are run separately to avoid interference between them. 

---

### <p align="center"> <ins> Window Server</ins> </p>
**🧠 <ins>Goals**</ins>
- ✅ Create a server simulating an enterprise with organizational units, groups and users.
- ✅ Learn the fundamentals of AD, GPOs and management.
- :white_large_square: Replicate settings but using PowerShell only.

**⚙️ <ins>Server Specifications**</ins>
- **OS**: Windows Server 2022
- **VM**: VirtualBox
- **Network**: NAT / Bridged
- **Access**: Remote Desktop

**🗃️ <ins>Active Directory Structure**</ins>
- To emulate an enterprise environment, I created three OUs to represent different floors of a corporate HQ, each containing users, groups and different settings. Below a diagram I did in Packet Tracer to show the setup.
<p align="left">
  <img src="https://github.com/user-attachments/assets/f3e9775c-a25c-490e-b622-e9c9f0c56a2d" width="500" alt="6">
</p>

<p align="left">
  <img src="https://github.com/user-attachments/assets/11572da7-4563-45b0-a63f-ae428d862771" width="500" alt="7">
</p>

**📝 <ins>GPOs**</ins>
- For the OU 1 and 2 I setted the next policies:
  - One common background for every user in the same floor.
  - Control Panel, Task Manager disabled.
  - CMD, Powershell disabled.
  - Regedit disabled.
- For OU 3, there are more permissions as it is supposed to be the administration floor.
<p align="left">
  <img src="https://github.com/user-attachments/assets/48af4557-761c-4fec-8292-316de355a747" width="800" alt="8">
</p>

>_After gpupdate /force, remote connecting to one of the users of Floor 1 group:_

<p align="left">
  <img src="https://github.com/user-attachments/assets/271cd781-4b42-4696-90aa-61290858384a" width="800" alt="9">
</p>

**📌 <ins>Key points</ins>**
- The graphical interface was easier to work with than expected, as it's similar to what I grew up with (changing settings, control panel, network configuration, etc) so I plan to replicate the setup from scratch using Powershell to improve my knowledge.

---

### <p align="center"> <ins> Infrastructure Automation with Ansible</ins></p>
When I learned about the "Pet vs Cattle" analogy, I figured out it is a very important skill of a Sysadmin to be able to deploy software and configurate systems using automatization. Infrastructure automatization called my attention since long. Therefore, I decided to start to play with Ansible.

**🧠 <ins>Goals**</ins>
- ✅ Control a VM with my Main Lab.
- ✅ Successfully send an order to a VM from my Main Lab with a playbook.
- :white_large_square: Expand to other VMs and deploy more tools and settings.

1. **Virtualbox network configuration and ISO install**

To not mess with my network settings in my main lab, the first thing I did was to add a new adapter "Host-Only" on virtualbox.
Then, I installed the ISO of Alpine (virtual version) and I did the same in the network settings, I added "Host-Only". 

<p align="left">
  <img src="https://github.com/user-attachments/assets/1b60c9b3-b642-4692-82a6-7aa16ce77ab2" width="1000" alt="14">
</p>

2. **Network configuration inside the VMs**

The host-only adapter hadn't an IP assigned, I had to manually assign IPs to both VMs so they could communicate with each other.
For this: 

(Main lab)
`sudo ip link set enp0s8 up && sudo ip addr add IP/PREFIX dev enp0s8`

(Alpine, _I was using root_)
`ip link set eth0 up && ip addr add IP/PREFIX dev eth0`

3. **Communication between VMs**

I ping both machines, both pongs are right. But Alpine is very minimalist and it doesn't have ssh installed.
<p align="left">
  <img src="https://github.com/user-attachments/assets/8cbf8f08-b9d7-4e32-be55-f543bcc40565" width="1000" alt="15">
</p>

I do  `apk add openssh` `rc-update add sshd` `service sshd start`

Now ssh works, but I couldn't get in with root, so I added an user with:  `adduser user` `addgroup user wheel` `passwd user` and I got in.
<p align="left">
  <img src="https://github.com/user-attachments/assets/645543cc-d0d1-4ea1-8adc-08510e76ab04" width="700" alt="16">
</p>

4. **Preparing Ansible**

In my main lab, I execute `sudo apt update -y && sudo apt install ansible sshpass`
> _At the beginning I had problems to execute the playbook because I didn't have sshpass installed. So I include it in the command.
After, I use  `ansible --version` to see it's correctly installed and I execute:_

`sudo mkdir -p /etc/ansible`

`sudo nano /etc/ansible/hosts`  _Inside, I write the IP of Alpine VM_

`mkdir ansible && cd ansible`

`nano prueba.yml`  _The playbook_

`ansible-playbook prueba.yml -u user --ask-pass`

> _Here, I had a lot of errors because Alpine doesn't have phyton3 packages installed, and I have to get the official repositories of Alpine. I want this machine to use as little space as possible, so I'll just keep it simple for now and after when I install another ISO I'll add more settings and tools._

<p align="left">
  <img src="https://github.com/user-attachments/assets/6336702b-d1bb-4ef3-aca6-86a51934c07f" width="1000" alt="17">
</p>

> _At the end it works and the command is executed in the second VM._

**📌 <ins>Key points</ins>**
- It's a tool I really liked to use and I'll do more tests with it when I get a new SSD or I get rid of garbage in my SSD.
- I encountered and resolved more issues at the application layer than during installation and setup.

---
### <p align="center"> <ins> Monitoring stack (Prometheus + Grafana)</ins></p>

**🧠 <ins>Goals**</ins>
- ✅ Monitoring one of my servers.
- :white_large_square: Deploy another machine, monitorize and log it.
- :white_large_square: Configure alert-manager to receive alerts on my phone.

To begin with this project, I'm going to set monitoring to my Windows Server first. I use Prometheus + Grafana and Windows Exporter for the metrics. My stack has also alert manager, Node Exporter and Loki, but I'll use it later with the next server.
- **Config of the servers and Docker-Compose🐳**

The first thing I did was to make sure Windows Server and my Main Lab where communicating with each other, so for this I added an Host Only adaptor to the Windows Server and added an IP to the `ethernet 2` executing in powershell:

`New-NetIPAddress -InterfaceAlias "Ethernet 2" -IPAddress "IP" -PrefixLength "PREFIX" -DefaultGateway "IPGateway of the vbox network"`

After this, I created a new dir `monitoring-stack` in my Main Lab that It looks like this:

```
├── alertmanager
│   └── config.yml
├── docker-compose.yml
├── loki
│   └── config.yml
└── prometheus
    └── prometheus.yml
```
Inside the `docker-compose.yml` I have all the tools mentioned before, and inside `prometheus.yml` I have the config of the scraping and the IP and ports mapped.

Then, in the Windows Server I downloaded and installed `windows_exporter-0.31.3-amd64.msi` from prometheus community repository.
>_After I realized some processes and metrics weren't working, because I forgot to do this:_

Inside windows exporter folder, I executed in powershell the following command: `.\windows_exporter.exe --collectors.enabled "[defaults],process,container"` then I restart the service.

- **Config of Prometheus and Grafana to work together**
I do `docker compose up -d` and I verify Prometheus is serving metrics in `localhost:9090/metrics`.
Then I go to Grafana web interface with `localhost:3000` and in Connections I added Prometheus server url. 
<img width="2542" height="1218" alt="19" src="https://github.com/user-attachments/assets/3dfe27ae-7c18-4e8d-8d0b-fb0b08e84862" />

> _In my case, it worked with http://prometheus:9090._

- At last, I import a dashboard with an ID, I select prometheus data source and:

<img width="2560" height="1280" alt="20" src="https://github.com/user-attachments/assets/09d0ecbf-0af7-4858-b398-681d0cb7c8b3" />

_It works!_

**📌 <ins>Key points</ins>**
- It was intended to monitor the Alphine Linux machine too, but due to the number of missing packages and basic libraries, I decided to postpone it and consider using a new ISO instead.
- Alertmanager and Loki are planned for the future to improve alerting and logging.

---
### <p align="center"> <ins> Backup strategy</ins></p>
**🧠 <ins>Goals**</ins>
- ✅ Implement an automatized backup system for my servers.
- ✅ Send the backup to an external device or to the host by ssh.
- :white_large_square: Implement more complexity in the backup.

This project shows my current backup setup of my main lab. My plan is to start simple and gradually increase complexity, integrating more advanced backup tools, cloud storage, or an additional home storage server.  
- **Backup with Shell script**

I use a shell script to backup specific directories of my system. [añadir]
After I added it to cron using `sudo crontab -e` (with sudo to make sure it executes all properly) 

`0 11 * * 1 /home/user/scriptbackup/backup.sh >> /home/user/scriptbackup/backup.log 2>&1`

- **Rsync: Sending backup to my Windows Host**

Since Windows doesn't natively support `rsync` and it doesn't have openSSH installed neither, I had to prepare the host with the following steps:
  1. Verify network connection by pinging the Windows machine.
  2. Allow SSH connections by opening the necessary port (usually 22, 2222).
  4. Install OpenSSH Server and Client.
  5. Install `rsync` on Windows.
<img width="2560" height="906" alt="21" src="https://github.com/user-attachments/assets/36608991-69e1-4b9d-81d6-61c13fdfcbe9" />

Once the environment was ready, I run `rsync` from the lab to send the backup file to my Desktop.
`rsync -azv -e ssh /backups/server-Friday.tgz user@192.168.x.x:/c/Users/<USERNAME>/Desktop/`

<img width="723" height="454" alt="22" src="https://github.com/user-attachments/assets/af27921f-ef30-4d85-810a-f94bbe4f4aea" />

**📌 <ins>Key points</ins>**
- Current setup backs up weekly or after an important change in the system.

---

### <p align="center"> <ins> Website with GO</ins></p>

**🧠 <ins>Goals**</ins>
- ✅ Host a website using GO.
- ✅ Add css, images and subpages.
- :white_large_square: Add javascript.

 It started as a simple html I made to test Apache on my server. Then I came up with a fun idea that could also help me practice and take my first steps with a programming language. I decided to make a retro website using GO, which contains memories from my childhood on the internet.
[main.go](main.go)
<p align="left">
  <img src="https://github.com/user-attachments/assets/f901f656-1732-4b85-829c-687d03c4b8ea" width="1000" alt="10">
</p>

This is how my workstation for the website looks now:
<p align="left">
  <img src="https://github.com/user-attachments/assets/29437bde-c336-4eae-85d1-e7ff07e1e87b" width="1000" alt="18">  
</p>


**📌 <ins>Key points</ins>**
- It helped me learning the basics of go, css and html.
- Javascript and more subpages will be added.
---
