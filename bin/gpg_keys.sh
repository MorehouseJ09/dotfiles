#!/usr/bin/env zsh

# if no args - print usage
if [[ $# -lt 2 ]];then
  echo "Usage: command file"
  echo "\texport -- export current GPG_KEY_ID's pub/sec keys"
  echo "\timport -- import keys from file"
  echo "\nExample Usage:"
  echo "\tgpg_keys.sh export keys.asc"
  echo "\tgpg_keys.sh import keys.asc"
  return 0
fi

if [[ $1 == "import" ]];then
  
  # import keys
  gpg --no-use-agent --output - $2 | gpg --import
  # now trust these keys
  gpg --edit-keys $GPG_KEY_ID trust quit

fi

if [[ $1 == "export" ]];then 

  #export public / private keys and make a secured joint key
  gpg --output pubkey.gpg --export $GPG_KEY_ID
  # create an encrypted container with both keys
  gpg --output - --export-secret-key $GPG_KEY_ID |\
    cat pubkey.gpg - |\
    gpg --armor --output $2 --symmetric --cipher-algo AES256

  # clean up
  rm pubkey.gpg
fi


