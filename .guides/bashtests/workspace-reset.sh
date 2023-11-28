#!/bin/bash
# workspace-reset file hierarchy

WORKSPACE=/home/codio/workspace/
arg=$1

function init_workspace {
<<<<<<< HEAD
  mkdir ${WORKSPACE}config
=======
	mkdir ${WORKSPACE}admin
  mkdir ${WORKSPACE}content
  mkdir ${WORKSPACE}content/plugins
  mkdir ${WORKSPACE}content/themes
  mkdir ${WORKSPACE}content/uploads
  touch ${WORKSPACE}.htaccess
  touch ${WORKSPACE}admin/admin.php
  touch ${WORKSPACE}config.php
  touch ${WORKSPACE}index.php
  touch ${WORKSPACE}README.md
>>>>>>> efd3cbac117f04602c79a5b6022229ae3b3d13f2
	echo "Project files have been reseted"
	sleep 2
	clear
}

function reset_workspace {
<<<<<<< HEAD
  rm -r ${WORKSPACE}config
  rm -r ${WORKSPACE}count.txt
=======
	rm -r ${WORKSPACE}admin
  rm -r ${WORKSPACE}content
  rm -r ${WORKSPACE}.htaccess
  rm -r ${WORKSPACE}config.php
  rm -r ${WORKSPACE}index.php
  rm -r ${WORKSPACE}README.md
>>>>>>> efd3cbac117f04602c79a5b6022229ae3b3d13f2
  > ~/.bash_history
	echo "Reseting project files and directories"
	sleep 2
	init_workspace
}

function reset_challenges {
	find "${WORKSPACE}.guides/bashtests/" -path "*.txt" -delete
	# find "${WORKSPACE}/bashtests/" -path "*.txt" -delete
	echo "Project challenges files have been reseted."
	sleep 2
	clear
}

case $arg in
	challenges ) reset_challenges
		;;
	workspace ) reset_workspace
		;;
	* ) echo "'$arg' doesn't match any available arguments" 
		;;
esac