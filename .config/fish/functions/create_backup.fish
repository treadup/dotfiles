function create_backup
  set -l BACKUP_FILENAME /backup/backup_(hostname)_(date +"%Y%m%d_%H%M").tar.gz
  cd $HOME
  tar -cvpzf $BACKUP_FILENAME \
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
  .
end
