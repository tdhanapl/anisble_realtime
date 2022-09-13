##################################################
### Ansible Configuration Files                ###
### Inventory File - /etc/ansible/hosts        ###
### Config File - /etc/ansible/ansible.cfg     ###
##################################################

# List all ansible managed hosts
$ ansible all --list-hosts

# Ping the remote hosts from the inventory
$ ansible all -m ping

# Execute a command
$ ansible all -a "/bin/echo 'Hello Ansible!!'"

# Echo terminal
$ ansible all -a 'echo $TERM'

# Copy files from source to remote hosts
$ ansible all -m copy -a "src=/etc/hosts dest=/var/tmp/hosts"

# Create files in remote hosts and update ownership and permissions
$ ansible all -m shell -a "touch /var/tmp/hello"
$ ansible all -m file -a "dest=/var/tmp/hello owner=admin group=admin mode=644"

# Create directory on remote hosts
$ ansible all -m file -a "dest=/var/tmp/dir1 owner=admin group=admin mode=644 state=directory"

# Delete a directory
$ ansible all -m file -a "dest=/var/tmp/dir1 state=absent"

# Install, Update or Remove Package
#$ ansible all -m yum -a "name=sscg state=present" --become -K
#$ ansible all -m yum -a "name=sscg state=latest" --become -K
#$ ansible all -m yum -a "name=sscg state=absent"

# Managing Users and Groups
$ ansible all -m user -a "name=test password=test" --become -K
$ ansible all -m user -a "name=test state=absent" --become -K

# Managing Services
#$ ansible all -m service -a "name=docker state=started"

# Gathering Facts
#$ ansible all -m setup
