
function [outputResistance] = heatResistanceModel(x)

Height      = x(1);
inRatio     = x(2);
inFriction  = x(3);
Length      = 10; %mm

load('model.mat')

%first data interpolation to get more points
[newFriction, newRatio] = meshgrid(linspace(1.9,0,100),linspace(5,24,100));
newdata = interp2(friction,ratio,data,newFriction,newRatio,'linear');

%friction and ratio based resistance
resistance = interp2(newFriction,newRatio,newdata,inFriction,inRatio,'linear');

%calculate the microchannel unit size
unitLength = Height/inRatio;

%calculate the output resistance of the setup
outputResistance = resistance/floor(Length/unitLength);