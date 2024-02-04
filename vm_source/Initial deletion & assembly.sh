exe="./playbook/playbook_update_install.yaml"
exe2="./playbook/playbook_inst_docker.yaml"
log_file="../logs/initial-setup-playbook.log"
log_file2="../logs/build_docker_playbook.log"


ansible-playbook -i ./config/inventory $exe | tee -a "$log_file"
ansible-playbook -i ./config/inventory $exe2 | tee -a "$log_file2"