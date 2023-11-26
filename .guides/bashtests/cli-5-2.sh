#!/bin/bash
. ~/workspace/.guides/bashtests/function.sh

bash_history=~/.bash_history
BASHDIR=/home/codio/workspace/.guides
check_file=cli-5-2
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
				expect_commands "Using numerical notation, update the ~/workspace/admin directory and subdirectories permissions to be: 'rwxr-xr-x'" "chmod -R 755 admin" "chmod -R 755 ~/workspace/admin" "chmod -R 755 /home/codio/workspace/admin"
				;;
			2 )
				expect_commands "Using numerical notation, update the ~/workspace/README.md file permissions to be: 'r--r-----'" "chmod 440 README.md" "chmod 440 ~/workspace/README.md" "chmod 440 /home/codio/workspace/README.md"
				;;
			3 )
				expect_commands "Using numerical notation, update the ~/workspace/index.php file permissions to be: '-w--w---x'" "chmod 221 index.php" "chmod 221 ~/workspace/index.php" "chmod 221 /home/codio/workspace/index.php"
				;;
		esac
	else 
    echo "Well done!"
		return 0
	fi
}


test_command