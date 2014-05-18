function remove_function {

    type $1 | grep -q 'shell function'

}

# initialize a path segment -- grab relative path
function path_tail {

	echo `pwd` | awk '{ n=split($1,a,"/")} END{ print a[n-1] "/" a[n] }'
}

# get the absolute path of a file
function path {

	if [[ ${1} == "." || ${1} == ".." ]]; then
		_path="`pwd`"

	else
		_path="`pwd`/$1"
	fi

	echo "${_path}"
}


# create a function that is useful for loading in custom configuration for local projects
function custom_shell {

	# now see if the file exists
	if [[ -f ./.shell_config ]]; then
		#statements
		source .shell_config
		echo "Source Loaded."
	fi
	
}

function reload {
	
	# check to see if current shell is zsh or not so we can load proper main files
	if [[ $SHELL == */zsh ]];then

		source $DOTFILES_DIR/bin/bootstrap.sh
	else
		
		source $DOTFILES_DIR/bin/bootstrap.sh		
	fi
	
	# load up any .shell_configs
	custom_shell

	# check to see if we are currently running a  virtualenv in python
	if [[ -d bin && -f bin/activate ]];then
		source bin/activate
	fi
}

