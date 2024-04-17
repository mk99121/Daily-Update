Ansible is a configuration management tool by Redhat And developed using python.
It is used to automate the tasks mainly use in infrastructure and applications management.
It allows you to deploy and update applications using SSH without agent installation on remote hosts.
You can manage and configure infra and applications on remote hosts using "yaml" by writing "playbooks" for setof tasks.
For executing one or two commands on remote hosts we can use "adhoc" commands.
By default inventory file is located at /etc/ansible/hosts.
Inventory file is used to store remote hosts IP's to communicate with them.
python is the prerequisite for ansible to run.

SETTING UP ANSIBLE & HOST Machines:

1.After Installation, we have to enable password less authentication for control machine & remote host to manage configuration in remote hosts.
for that we need to keep controller machines public.key in remote host .ssh/authrozation file
2.And need to add servers IP's into the inventory file so ansible can manage those nodes by using ssh protocol.

Example for adhoc commands:
1.To execute shell commands on remote host
ansible -i inventory all -m "shell" -a "touch /home/ubuntu/dummy-1.txt"

Example for playbooks:
1.Suppose you want to install nginx on remote host and start
create a playbook using yml extention "playbook-nginx.yml"
To start writing ansible playbook start with 3 hypens[---]
---
- name:Install and start nginx
  hosts: all
  become: root
  
  tasks:
    - name: Install nginx
	  apt:            # we used apt module as ansible providing "apt" package manager or we can run shell command aswell
	    name: nginx  
		state: present
	- name: Start nginx
	  service:               # to manage the service of nginx we have Service Module, we can start,stop,restart,enable,restart etc. using this module.
	     name: nginx
		 state: started
		 
Tomcat Playbook:

---
- name: Download Tomcat8 from tomcat.apache.org
  hosts: testserver
  vars:
    download_url: https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.83/bin/apache-tomcat-8.5.83.tar.gz
  tasks:
   - name: Download Open JDK
     become: yes
     apt:
      name: openjdk-8-jre-headless
      update_cache: yes
      state: present
  
   - name: validate if Java is availble 
     shell: 
      java -version
     
   - name: Create the group
     become: yes
     group: 
      name: tomcat
      state: present
   - name: Create the user
     become: yes
     user:
        name: tomcat
        state: present
   - name: Create a Directory /opt/tomcat8
     become: yes
     file:
       path: /opt/tomcat8
       state: directory
       mode: 0755
       owner: tomcat
       group: tomcat
   - name: Download Tomcat using unarchive
     become: yes
     unarchive:
       src: "{{download_url}}"
       dest: /opt/tomcat8
       mode: 0755
       remote_src: yes
       group: tomcat
       owner: tomcat
    
   - name: Move files to the /opt/tomcat8 directory
     become: yes
     become_user: tomcat
     shell: "mv /opt/tomcat8/apache*/* /opt/tomcat8"
   - name: Creating a service file
     become: yes
     copy: 
      content: |-
        [Unit]
        Description=Tomcat Service
        Requires=network.target
        After=network.target
        [Service]
        Type=forking
        User=tomcat
        Environment="CATALINA_PID=/opt/tomcat8/logs/tomcat.pid"
        Environment="CATALINA_BASE=/opt/tomcat8"
        Environment="CATALINA_HOME=/opt/tomcat8"
        Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
        ExecStart=/opt/tomcat8/bin/startup.sh
        ExecStop=/opt/tomcat8/bin/shutdown.sh
        Restart=on-abnormal
        [Install]
        WantedBy=multi-user.target
      dest: /etc/systemd/system/tomcat.service
   - name: Reload the SystemD to re-read configurations
     become: yes
     systemd:
        daemon-reload: yes
   - name: Enable the tomcat service and start
     become: yes
     systemd:
        name: tomcat
        enabled: yes
        state: started
		
To execute the playbooks need to follow the command with the playbook-name
# ansible-playbook -i inventory palaybook-name.yml
later it will execute the tasks mentioned in the playbook

Ansible Roles:
1: Ansible roles are efficient way of writing ansible playbooks that will help to write complex playbooks
2. we can segregate and properly structure the playbooks

To start using Ansible Roles: for example use role in creating kubernetes cluster,follow the command:
cd into the created kubernetes dir#ansible-galaxy
#ansible-galaxy role init kubernetes
now ansible will create bunch of folders like:
templates
files
tasks   #
handlers
tests
vars
defaults
meta

Using these folders we structure our ansible playbook for kubernetes

