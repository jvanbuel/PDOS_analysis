function [unique_atoms,unique_basis, unique_L] = combine_basis(alpha_basis, atoms)

atoms = table2cell(atoms);
pattern = '[A-Z]*';
unique_atoms = cell(length(atoms),1);
    for i = 1:length(atoms)
        unique_atoms(i) = regexp(atoms{i},pattern,'match','ignorecase');
    end
unique_atoms = unique(unique_atoms);

unique_basis = cell(1,length(unique_atoms));
unique_L = cell(1,length(unique_atoms));

    for i = 1:length(unique_atoms)
        t = alpha_basis(:,1);
        for j = 1:length(t)
            t(j) = t{j};
        end
        indices = contains(t,unique_atoms(i));
        s = alpha_basis(indices,2);
        for k = 1:length(s)
            s(k) = s{k};
        end
        unique_basis(i) = {unique(s)};
        buffer= unique_basis{i};
        for j = 1:length(unique_basis{i})
            buffer{j} = buffer{j}(2);
        end
        unique_L{i}=unique(buffer);
    end

end

