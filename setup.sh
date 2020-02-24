#/bin/bash
cat disclaimer.txt
read -p "This will zfsfileserver setup. Running presetup. Press Any Key"
sudo apt install nano python ansible openssh-server -y >/dev/null
sudo systemctl enable ssh
sudo systemctl start ssh


while true; do
    echo "-------------------------------------"
    echo 'Press "C" for Edit of Config';
    echo 'Press "I" for install';
    echo "-------------------------------------"
    read -p "Enter Choice (C,I)? " yn
    case $yn in
        [Ii]* ) sudo ansible-playbook zfsfileserver.yml; break;;
        [Cc]* ) nano zfsfileserver.yml;;
        * ) exit;;
    esac
done
#sudo ansible-playbook zfsfileserver.yml
