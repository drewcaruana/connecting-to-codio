#!/bin/bash
. ~/workspace/.guides/bashtests/function.sh

bash_history=~/.bash_history
BASHDIR=/home/codio/workspace/.guides
check_file=cli-5-1
hist_file="$BASHDIR/bashtests/$check_file.txt"

echo "$check_file" >> $bash_history
grep -A2000 -e "^$check_file" $bash_history > "$BASHDIR/bashtests/${check_file}.txt"
find "$hist_file" -type f -exec sed -i "s@~@$HOME@g" {} \; 

# Must match for erasing history
RES_HIST=0
COUNT=0
QCOUNT=3

# Run test
function test_command {
	(( COUNT ++ ))
	if [[ $COUNT -le $QCOUNT ]]; then
		case $COUNT in
			1 )
				expect_commands "List visible and hidden file details including file size suffixes for ~/workspace" "ls -alh" "ls -lah" "ls -hal" "ls -hla" "ls -ahl" "ls -lha"
				;;
			2 )
				expect_permissions "index.php" "-r-x-w----" "/home/codio/workspace"
				;;
			3 )
				expect_permissions "admin" "d-w-rw-rw-" "/home/codio/workspace"
				;;
		esac
	else 
    echo "Well done!"
		return 0
	fi
}


test_command