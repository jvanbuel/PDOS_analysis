function [ HOMO,LUMO,open_shell] = find_HOMO_LUMO(data)

nbasis = (size(data.data,2)-6)/2;
if(~rem(length(split(data.textdata(1),' ')),2))
    open_shell = true;
    disp(open_shell)
    headerlines = 4 + nbasis;

    orbital_data = readtable('orbital_data.txt','Headerlines',headerlines);

    levels = orbital_data.Var2;

    i = find(contains(levels,'HOMO'));
    HOMO.number = orbital_data.AlphaMO(i);
    HOMO.energy = orbital_data.eV(i);

    i = find(contains(levels,'LUMO'));
    LUMO.number = orbital_data.AlphaMO(i);
    LUMO.energy = orbital_data.eV(i);
else
    open_shell = false;
    disp(open_shell)
    headerlines = nbasis*2+5;

    orbital_data = readtable('orbital_data.txt','Headerlines',headerlines);

    levels = orbital_data.Var2;

    i = find(contains(levels,'HOMO'));
    HOMO.number = orbital_data.MO(i);
    HOMO.energy = orbital_data.eV(i);

    i = find(contains(levels,'LUMO'));
    LUMO.number = orbital_data.MO(i);
    LUMO.energy = orbital_data.eV(i);

end

end

