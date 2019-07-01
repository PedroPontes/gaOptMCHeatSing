function [outputResistance] = NewHeatResistanceModel(x)

%fluid properties (Water)
kl          = 0.6294;   % W.m-1.K
Cp          = 4204;     % J.kg-1.K-1 at patm and T=40
massFlow    = 3.75E-4;   % kg.s-1

%solid properties (Copper)
ks = 413;       % W.m-1.K


%Inputs for Resistance calculation:
channelHeight   = x(1)/10^6;
channelWidth    = x(2)/10^6;
baseHeight      = x(3)/10^6;
wallWidth       = x(4)/10^6;

%celldimensions
cellWidth   = 0.01;
cellLength  = 0.01;
cellNumber  = floor((cellWidth)/(channelWidth+wallWidth));

%convection
sizeRatio = channelHeight/channelWidth;
Dh = channelHeight*channelWidth/(channelHeight+channelWidth/2); %diametro caracteristico secção rectangular 4A/P

Nusselt = 2.253 + 8.164*(sizeRatio/(sizeRatio+1))^1.5; %FOR Re<1000

hconv= Nusselt*kl/Dh;

% Individual resistance calculation
Rbase = baseHeight/(ks*((channelWidth/2)+(wallWidth/2))*cellLength);
Rsubconv = 1/(hconv*channelHeight*cellLength);
Rwall = channelHeight/(ks*(wallWidth/2)*cellLength);
Rwallconv = 1/(hconv*channelHeight*cellLength);
Rfluid = 1/massFlow/Cp;

Rtot = Rbase + (1/Rsubconv + 1/(Rwall+Rwallconv))^(-1) + Rfluid;

outputResistance = Rtot/cellNumber;

