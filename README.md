# PDOS_analysis
(Bash) scripts for the analysis of the orbital density of states (DOS) of ORCA files.

Requires an ORCA output file name 'input.out' of a geometry relaxation as well as the open source software [GaussSum](https://github.com/gausssum/gausssum).

1. Run 'pdos_run.sh' for a single point energy calculation (SPEC) of the final (converged) geometry in the 'input.out' file.
2. 'pdos_run.sh' finalizes by calling GaussSum.py on the SPEC outputfile 'pdos.out'. The user can then calculate the DOS.
3. (optional) run 'matlab_dos.sh' to analyze the PDOS in MATLAB. The program outputs the PDOS per atom and symmetry type (S, P, D, F, ...).
