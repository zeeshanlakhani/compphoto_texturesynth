function simquant =  DocSimilarity(testd,teste)

% testd = { 'how', 'much', 'wood', 'could', 'a', 'woodchuck', 'chuck', ... 
% 'if', 'a', 'woodchuck', 'could', 'chuck', 'wood' };
% 
% teste = { 'all', 'the', 'wood', 'that', 'a', 'woodchuck', 'could', ... 
% 'if', 'a', 'woodchuck', 'could', 'chuck', 'wood' }; 


largeodd = 10000001; 
GetStopWords;


S = sparse(1,largeodd);
D = sparse(1,largeodd);
E = sparse(1,largeodd);
simquant = zeros(1,1);

%less than 3
dless = cellfun(@length,testd);
eless = cellfun(@length,teste);
dless = find(dless < 3);
eless = find(eless < 3);

testd(dless) = [];
teste(eless) = [];


%%
stoppers = cellfun(@(x)hash(x,largeodd),stopwords);
indexD = cellfun(@(x)hash(x,largeodd),testd);
indexE = cellfun(@(x)hash(x,largeodd),teste);

S(1,1:end) = histc(stoppers,1:largeodd);
D(1,1:end) = histc(indexD,1:largeodd);
E(1,1:end) = histc(indexE,1:largeodd);

fstopE = intersect(find(E),find(S));
fstopD = intersect(find(D),find(S));

E(1,fstopE) = 0;
D(1,fstopD) = 0; 

simquant(1,1) = (D*E')/(norm(D)*norm(E));

%%