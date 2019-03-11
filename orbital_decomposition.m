function [atoms, basis, orb_energy, orb_decomp] = orbital_decomposition(data,open_shell)

basis_raw = data.textdata{2};
basis = textscan(basis_raw,'%s ');
basis = basis{1};
basis = basis(3:end-1);
if(open_shell)
    basis(round(length(basis)/2))=[]; % Remove 'Total' column
else
    basis(length(basis))=[];
end

orb_energy = data.data(:,1);
orb_decomp = data.data(:,2:end-4);

if(open_shell)
    orb_decomp(:,round(length(basis)/2)+1) = []; % Remove 'Total' column
end

buffer = basis;
basis = cell(length(basis),2);

for i = 1:length(basis)
    basis(i,:) = textscan(buffer{i},'%s%s','Delimiter','_');
end

atoms = unique(cell2table(basis(:,1))); 



end

