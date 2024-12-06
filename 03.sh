#!/bin/bash

# Result 1
powershell.exe Get-Clipboard 
    | grep -o 'mul([0-9]*,[0-9]*)' 
    | sed 's/mul(//g' 
    | tr ',' '*' 
    | tr ')' '+' 
    | sed 's/.$//' 
    | xargs -L1 -I{} echo {} 
    | bc 
    | awk '{sum += $1} END {print sum}'

# Result 2
powershell.exe Get-Clipboard
    | grep -o 'mul([0-9]*,[0-9]*)\|do()\|don'\''t()'
    | sed 's/mul(//g' 
    | tr ',' ' ' 
    | sed 's/)//' 
    | awk '
        BEGIN { doing = 1 } 
        /do\(/ { doing = 1 }
        /don.*/ { doing = 0 }
        { sum += ($1 * $2) * doing } 
        END { print sum }
    ' 
