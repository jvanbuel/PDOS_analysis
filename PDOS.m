function [E, alphapdos, betapdos] = PDOS(orb_decomp,orb_energy,basis,atom,unique_L,open_shell)
    %disp(unique_atoms(i))
    p = basis(:,1);
    alphapdos = [];
    betapdos = [];
    E = orb_energy;
    for j = 1:length(p)
        p(j) = p{j};
    end

    indices_A = contains(p,atom);

    for j = 1:length(unique_L)
        %disp(unique_L(j))
        q = basis(:,2);
        for k = 1:length(q)
            q(k) = q{k};
        end
        indices_L = contains(q,unique_L{j});
        indices = and(indices_A,indices_L);
        if(open_shell)
            tot_DOS  = sum(orb_decomp(:,indices),2);
            alphados  = sum(orb_decomp(:,indices(length(indices)/2+1:end)),2);
            betapdos = [betapdos (tot_DOS - alphados)];
            alphapdos = [alphapdos alphados];

        else
            alphapdos  = [alphapdos sum(orb_decomp(:,indices),2)];
        end
        
    end
end