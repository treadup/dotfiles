function create_encrypted_backup
  set -l BACKUP_FILENAME /backup/backup_(date +"%Y%m%d_%H%M").tgz.gpg
  cd $HOME
  tar -cpz \
  --exclude './Downloads' \
  --exclude './Videos' \
  --exclude './VirtualBox VMs' \
  --exclude './Music' \
  --exclude './Desktop' \
  --exclude './Private' \
  --exclude './private' \
  --exclude './.*' \
  --exclude './Linux' \
  --exclude './linux' \
  --exclude './node_modules' \
  --exclude './nerd_fonts' \
  . | gpg --output $BACKUP_FILENAME --encrypt --recipient 'henrik.treadup@gmail.com' 
end
