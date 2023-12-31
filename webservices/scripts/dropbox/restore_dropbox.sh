#!/bin/bash
count=1
backuppath="/root/backups/dropbox"

Format2Options()
{
  local count="$1"
  local title="$2"
  printf "\t %3b ) %-23b\n" "$count" "$title"
}

InputError()
{
  echo -e "\n\t\t Invalid Selection, Please try again"; sleep 2
}

MainMenu()
{
  clear
  echo -e "\n\t Select a backup to restore from"
  for file in `ls $backuppath`; do
    Format2Options "$count" "$file"
    let "count++";
  done
  echo -ne "\n\t Enter a Selection:"
  read filein
  case $filein in
    q|Q) exit 0;;
      *) if (( $filein >= 1 && $filein < $count)) 2>/dev/null; then
           backupfile=`ls $backuppath | sed -n ${filein}p`
	   cd /tmp
           mkdir trestore
           cd trestore
           cp $backuppath/$backupfile .
           tar -xzvf $backupfile
           docker exec -i owncloud_db mysql -uowncloud -powncloud owncloud < owncloud.sql 
           rm -r /tmp/trestore
         else
           InputError
           MainMenu
         fi
  esac
}
MainMenu
         
