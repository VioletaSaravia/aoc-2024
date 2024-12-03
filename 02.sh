#!/bin/bash

# Result 1
powershell.exe Get-Clipboard | awk '{
    safe = 1; last = 0; 
    
    for (i = 1; i < NF; i++) {
        cur = $i - $(i+1); 
        if (cur && cur < 4 && cur > -4 && cur * last >= 0) {
            last = cur;
            continue;
        } 

        safe = 0; 
        break;
    }
    
    if (safe) print 1;
    }' | wc -l