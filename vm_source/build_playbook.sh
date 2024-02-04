exe="./playbook/playbook_sql.yaml"

log_file="../logs/build_image_playbook.log"

ansible-playbook -i ./config/inventory $exe | tee -a "$log_file"
