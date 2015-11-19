function [Win,Wrec,Wdec,Wout] = trainSRN(input_simpel,input_complex,Win,Wrec,Wdec,Wout,eta)

% [Win,Wrec,Wdec,Wout] = trainSRN(input_simpel,input_complex,Win,Wrec,Wdec,Wout,eta)
%
% Traint en test een 4-laags Simple Recurrent Netwerk op de
% Elman-woordvoorspellingstaak, gedurende 1 epoch
% 
% input_simpel : rijvectoren met woordnummers van simpele zinnen
% input_complex: rijvectoren met woordnummers van complexe zinnen
% W...    : gewichtenmatrices.
%           Win  = vanuit input
%           Wrec = vanuit contextlaag
%           Wdec = naar decodelaag
%           Wout = naar output
% eta     : learning rate. Default: .1

if nargin<7; eta = .1; end

% maakt eerst de traininput door de simpele en complexe zinnen in
% willekeurige volgorde aaneen te rijgen, zodanig dat de verhouding
% simpel:complex = 1:4 (zoals in de laatste trainingsfase van v.d.Velde)

nrsimpel = size(input_simpel,1);
nrcomplex = size(input_complex,1);
versimpeling = nrcomplex/nrsimpel/4; % zoveel keer extra moeten alle simpele zinnen erin
zinnummers = 1:nrsimpel;
for i = 2:floor(versimpeling)
    zinnummers = [zinnummers 1:nrsimpel];
end
restje = round((versimpeling-floor(versimpeling))*nrsimpel); % zoveel simpele zinnen nog
z = randperm(nrsimpel); zinnummers = [zinnummers z(1:restje)];
zinnummers = [zinnummers nrsimpel+1:nrcomplex+nrsimpel]; % complexe zinnen erbij, genummberd vanaf nrsimpel+1
volgorde = randperm(length(zinnummers));
zinnummers = zinnummers(volgorde);

% en nu eindelijk de traininput maken
traininput = [];
for i = zinnummers
    if i > nrsimpel
       traininput = [traininput input_complex(i-nrsimpel,:)];
    else
        traininput = [traininput input_simpel(i,:)];
    end
end

nrhidden = size(Win,1);
nrtijd = length(traininput);
nrwoord = max(traininput);

Ain = zeros(nrwoord,1);
Ahid = .5*ones(nrhidden,1);
target = zeros(nrwoord,1);    

for wrd = 1:nrtijd-1 
    Ain(traininput(wrd)) = 1;
    target(traininput(wrd+1)) = 1;

    Ahidcopy = Ahid;
    Ahid = 1./(1+exp(-(Win*[Ain;1] + Wrec*Ahidcopy)));
    Adec = 1./(1+exp(-(Wdec*[Ahid;1])));
%     Aout = sigmoid(Wout*[Adec;1]); % logistische outputactivatie
    Aout = exp(Wout*[Adec;1]); Aout = Aout./sum(Aout); % softmax outputactivatie
    
%     DeltaOut = Aout.*(1-Aout).*(target-Aout); % errorfunctie = MSE     
	DeltaOut = target-Aout; % errorfunctie = cross-entropy
    DeltaDec = Adec.*(1-Adec).*(Wout(:,1:end-1)'*DeltaOut);
    DeltaHid = Ahid.*(1-Ahid).*(Wdec(:,1:end-1)'*DeltaDec);

    dWout = DeltaOut*[Adec;1]';
    dWdec = DeltaDec*[Ahid;1]';
    dWrec = DeltaHid*Ahidcopy';
    dWin  = DeltaHid*[Ain;1]';   
    
    Win  = Win  + eta*dWin;
    Wrec = Wrec + eta*dWrec;
    Wdec = Wdec + eta*dWdec;
    Wout = Wout + eta*dWout;       

    Ain(traininput(wrd)) = 0;
    target(traininput(wrd+1)) = 0;
end
