
#!/bin/bash
echo "Copying SSH public key..."
scp $SSH_PUBLIC_KEY $ANSIBLE_USER@$ANSIBLE_HOST:/home/$ANSIBLE_USER/.ssh/uploaded_rsa.pub
ansible oxidized -u $ANSIBLE_USER -i hosts -m shell -a 'cat ~/.ssh/uploaded_rsa.pub >> ~/.ssh/authorized_keys' -k
ansible oxidized -u $ANSIBLE_USER -i hosts -m shell -a 'rm ~/.ssh/uploaded_rsa.pub'
echo "Copying router file..."
scp ../config/router.db $ANSIBLE_USER@$ANSIBLE_HOST:/home/$ANSIBLE_USER/
echo "Copying config file..."
scp ../config/config $ANSIBLE_USER@$ANSIBLE_HOST:/home/$ANSIBLE_USER/
echo "Server will now be provised..."
ansible-playbook oxidized_full_provision.yml -i hosts -u $ANSIBLE_USER --private-key /home/ansible/.ssh/id_rsa -v -b
echo "DONE"
