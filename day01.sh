#!/bin/bash

powershell.exe Get-Clipboard | awk '{print $1}' | sort > new.txt
powershell.exe Get-Clipboard | awk '{print $2}' | sort > new2.txt
paste -d ' ' new.txt new2.txt > new3.txt

# Result 1
awk '{print $1 - $2}' new3.txt | sed 's/-//g' | awk '{sum += $1} END {print sum}'

# Result 2
cat new.txt | xargs -I {} sh -c 'echo "{} $(grep -cF "{}" new2.txt)"' | awk '{print $1 * $2}' | awk '{sum += $1} END {print sum}'

# Cleanup
rm -rf new*.txt