function [ species ] = DNAClassifier(testSpecies)
load('AncestorData.mat');
h_s = normxcorr2(humans,testSpecies);
c_s = normxcorr2(chimps,testSpecies);
r_s = normxcorr2(rhesus,testSpecies);
h=h_s(4,1000);
c = c_s(4,1000);
r=r_s(4,1000);
if(abs(h) > abs(r) && abs(c) < abs(h))
    species='humans';
end
if (abs(h) < abs(r) && abs(r) > abs(c))
        species='rhesus';
    end
if (abs(h) < abs(c) && abs(r) < abs(c))
            species='chimps';
        end