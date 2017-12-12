function create_backup
  set -l BACKUP_FILENAME /backup/backup_(date +"%Y%m%d_%H%M").tar.gz
  cd $HOME
  tar -cvpzf $BACKUP_FILENAME \
  --exclude './fun' \
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
  .
end
