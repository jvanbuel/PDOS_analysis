#!/usr/bin/env zsh

CURDIR=$PWD
echo $CURDIR
# Move all files from gausssum3 to MATLAB/Plot_OrbitalDOS

ls "./gausssum3"
cp ./gausssum3/*.txt "/Users/janvanbuel/Documents/Box Sync/MATLAB/Plot_OrbitalDOS/"

# Run matlab script DOS.m (first remove other .dat files)
cd "/Users/janvanbuel/Documents/Box Sync/MATLAB/Plot_OrbitalDOS/"
rm ./*.dat

alias matlab='/Applications/MATLAB_R2016b.app/bin/matlab'
export MATLABPATH=/Users/janvanbuel/Documents/Box\ Sync/MATLAB/Plot_OrbitalDOS/:$MATLABPATH
matlab -nodesktop -nosplash -nodesktop -r "try,DOS, catch, end, quit;"
echo "matlab exit code: $?"

# Move all ouptut script back to gausssum3 folder

cp ./*dat $CURDIR/gausssum3/
