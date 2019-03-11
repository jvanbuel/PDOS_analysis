#!/usr/bin/env zsh


T=$(grep 'xyz' ./input.in | sed 's/^.*: //')
C_S=${T//[!0-9 ]/}
FILE="./pdos.in"

/bin/cat <<EOM >$FILE
!PBE def2-TZVP d3bj TightSCF VerySlowConv KDIIS SOSCF Grid5 FinalGrid5
* xyzfile $C_S ./input.xyz
%scf
  MaxIter = 2000
end
%output
PrintLevel=Huge
end
EOM

echo "Single point energy calculation..."
orca "./pdos.in" > "./pdos.out"

echo "GaussSum DOS calculation"

mkdir "./gausssum3"
FILE="./gausssum3/Groups.txt"

/bin/cat <<EOM >$FILE
allorbitals
EOM
GaussSum.py "./pdos.out"
