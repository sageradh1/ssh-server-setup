#!/bin/bash
_remote="ashishs@124.41.198.206"
_user="ashishs"
_user_folder="/home/asmi/setup/ssh-server-setup/containers/tjg-13-ashish"

echo "Local system name: $HOSTNAME"
echo "Local date and time: $(date)"
 
echo
echo "*** Running commands on remote host named $_remote ***"
echo
ssh -i $_user -T $_remote <<'EOL'
    echo "Normal user"
    mkdir -p /home/ashishs/setup/ssh-server-setup/containers
	echo "Bye"
EOL


# _root_remote="asmi@124.41.198.206"
# _root_user="asmi"
# ssh -i $_root_user -t $_root_remote <<'EOL'
#     echo "Root user"
#     sudo cp -rf /home/asmi/setup/ssh-server-setup/containers/tjg-1-manish /home/manishb/setup/ssh-server-setup/containers/
# EOL

_root_remote="asmi@124.41.198.206"
_root_user="asmi"
ssh -i $_root_user -t $_root_remote sudo cp -rf $_user_folder /home/$_user/setup/ssh-server-setup/containers/

#ssh -i manishb manishb@124.41.198.206

#after ssh
# mkdir -p /home/manishb/setup/ssh-server-setup/containers

# sudo cp -rf /home/asmi/setup/ssh-server-setup/containers/tjg-1-manish /home/manishb/setup/ssh-server-setup/containers/

# exit
