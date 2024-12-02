powershell.exe Get-Clipboard | awk '{print $1}' | sort > new.txt
powershell.exe Get-Clipboard | awk '{print $2}' | sort > new2.txt
paste -d ' ' new.txt new2.txt > new3.txt
awk '{print $1 - $2}' new3.txt | sed 's/-//g' | awk '{sum += $1} END {print sum}'
cat new.txt | xargs -I {} sh -c 'echo {} 0' | awk '{print  * }' | awk '{sum += } END {print sum}'
