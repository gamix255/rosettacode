#/bin/bash

mem=(15 17 -1 17 -1 -1 16 1 -1 16 3 -1 15 15 0 0 -1 72 101 108 108 111 44 32 119 111 114 108 100 33 10 0 )

ADDR=0
STEP=0

while [[ $((STEP++ )) -lt 300 ]]
do
  A=${mem[$ADDR]}
  B=${mem[(($ADDR + 1))]}
  C=${mem[(($ADDR + 2))]}
  ADDR=$((ADDR + 3))
  if [[ $B -lt 0 ]]; then
     printf '%b' '\x'$(printf '%x' ${mem[$A]})
  else
    mem[$B]=$((${mem[$B]} - ${mem[$A]}))
    if [[ ${mem[$B]} -le 0 ]]; then
      if [[ $C -eq -1 ]]; then
        echo "Total step:"$STEP
        exit 0
      fi
      ADDR=$C
    fi
  fi
done
echo "Total step:"$STEP
