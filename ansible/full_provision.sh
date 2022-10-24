
#!/bin/bash
echo "Copiando chave ssh..."
scp ~/.ssh/id_rsa.pub $ANSIBLE_USER@$ANSIBLE_HOST:/home/$ANSIBLE_USER/.ssh/uploaded_rsa.pub
ansible oxidized -u $ANSIBLE_USER -i hosts -m shell -a 'cat ~/.ssh/uploaded_rsa.pub >> ~/.ssh/authorized_keys' -k
ansible oxidized -u $ANSIBLE_USER -i hosts -m shell -a 'rm ~/.ssh/uploaded_rsa.pub'
echo "Copiando arquivo de rota..."
scp ~/ansible/oxidized/configs/router.db $ANSIBLE_USER@$ANSIBLE_HOST:/home/$ANSIBLE_USER/
echo "Copiando arquivo de configuração..."
scp ~/ansible/oxidized/configs/config $ANSIBLE_USER@$ANSIBLE_HOST:/home/$ANSIBLE_USER/
echo "Servidor pronto para provisionamento"
ansible-playbook oxidized_full_provision.yml -i hosts -u $ANSIBLE_USER --private-key /home/ansible/.ssh/id_rsa -v -b
