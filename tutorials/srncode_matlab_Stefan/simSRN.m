function [Aout, Ahid] = simSRN(input,Win,Wrec,Wdec,Wout,Ahid0)

% [Aout, Ahid] = simSRN(input,Win,Wrec,Wdec,Wout,Ahid0) simuleert een 4-laags SRN.
%
% input   : reeks woordnummers
% W...    : gewichtenmatrices.
%           Win  = vanuit input
%           Wrec = vanuit contextlaag
%           Wdec = naar decodelaag
%           Wout = naar output
% Ahid0   : beginactivaties van hidden units. Default: .5

nrwoord = size(Wout,1);
nrhidden = size(Wrec,1);
nrtijd = length(input);

if nargin < 6; Ahid0 = .5*ones(nrhidden,1); end

Ain = zeros(nrwoord,1); 
Ahid = zeros(nrhidden,nrtijd);
Aout = zeros(nrwoord,nrtijd);

Ain(input(1)) = 1;
Ahid(:,1) = sigmoid(Win*[Ain;1] + Wrec*Ahid0);
Adec = sigmoid(Wdec*[Ahid(:,1);1]);
% Aout(:,1) = sigmoid(Wout*[Adec;1]); % logistische outputactivatie
Aout(:,1) = exp(Wout*[Adec;1]); Aout(:,1) = Aout(:,1)/sum(Aout(:,1)); % softmax outputactivatie

for wrd = 2:nrtijd
    Ain(input(wrd-1)) = 0;
    Ain(input(wrd)) = 1;
    Ahid(:,wrd) = sigmoid(Win*[Ain;1] + Wrec*Ahid(:,wrd-1));
    Adec = sigmoid(Wdec*[Ahid(:,wrd);1]);
%     Aout(:,wrd) = sigmoid(Wout*[Adec;1]); % logistische outputactivatie
	Aout(:,wrd) = exp(Wout*[Adec;1]); Aout(:,wrd) = Aout(:,wrd)/sum(Aout(:,wrd)); % softmax outputactivatie
end