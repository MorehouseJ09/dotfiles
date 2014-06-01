#!/usr/bin/env zsh

# if no args - print usage
if [[ $@ -lt 2 ]];then
  echo "Usage: command file"
  echo "\texport -- export current GPG_KEY_ID's pub/sec keys"
  echo "\timport -- import keys from file"
  echo "\nExample Usage:"
  echo "\tgpg_keys.sh export keys.asc"
  echo "\tgpg_keys.sh import keys.asc"
fi

if [[ $1 = "import" ]];then
  
  echo $1

fi

# export public / private keys and make a secured joint key
#gpg --output pubkey.gpg --export $GPG_KEY_ID
#gpg --output - --export-secret-key $GPG_KEY_ID | cat pubkey.gpg - | gpg --armor --output $output --symmetric --cipher-algo AES256
#rm pubkey.gpg





