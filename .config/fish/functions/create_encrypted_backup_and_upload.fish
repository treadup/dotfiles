function create_encrypted_backup_and_upload
  set -l BACKUP_FILENAME /backup/backup_(hostname)_(date +"%Y%m%d_%H%M").tgz.gpg
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
  --exclude './tmp' \
  --exclude './node_modules' \
  --exclude './nerd_fonts' \
  . | gpg --output $BACKUP_FILENAME --encrypt --recipient 'henrik.treadup@gmail.com'
aws s3 cp $BACKUP_FILENAME s3://redwood-backup/
end
