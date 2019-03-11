%% Script to read DOS_spectrum output files from the GaussSum program

cd '/Users/janvanbuel/Documents/Box Sync/MATLAB/Plot_orbitalDOS';
[data] = read_DOS('./DOS_spectrum.txt');

%% Determine HOMO and LUMO
[homo,lumo,open_shell] = find_HOMO_LUMO(data);

%% Extract orbital decomposition into basis vectors

[atoms, basis, orb_energy, orb_decomp] = orbital_decomposition(data,open_shell);


if(open_shell)           
     alpha_basis = basis(1:length(basis)/2,:);
     beta_basis = basis(length(basis)/2+1:end,:);
else
     alpha_basis = basis;
end
            
%% Combine basis vectors in S, P, D, ... components for different atoms

[unique_atoms,unique_basis,unique_L] = combine_basis(alpha_basis,atoms);
 
 %% Add together DOS of the same type 


for i = 1:length(unique_atoms)

    [atom(i).energy,atom(i).alphapdos,atom(i).betapdos] = PDOS(orb_decomp,orb_energy,basis,unique_atoms(i),unique_L{i},open_shell);
    atom(i).name = unique_atoms(i);
end

%% plot & save data

c = distinguishable_colors(20);
figure
hax = axes;
hold on
for i = 1:length(atom)

    plot(atom(i).energy,atom(i).alphapdos)
    if(open_shell)
        plot(atom(i).energy,-atom(i).betapdos)
    end

    data = [atom(i).energy atom(i).alphapdos atom(i).betapdos];
    filename = strcat(atom(i).name,'_PDOS.dat');
    save(filename{:},'data','-ascii')
end

fermi_level = (homo.energy + lumo.energy)/2;
hold on
line([fermi_level fermi_level],get(hax,'YLim'),'Color',[0 0 0])
%[PDOS] = PDOS(atom,L);



