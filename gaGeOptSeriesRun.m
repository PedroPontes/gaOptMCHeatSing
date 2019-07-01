
ObjectiveFunction = @NewHeatResistanceModel;
nvars = 4;      % Number of variables
p = 50;       %um precisão

LB = [  p   p   p   p   ];        % Lower bound
UB = [  1   1   1   1 ]*1E3;   % Upper bound

opts = optimoptions(@ga);%'ga','PlotFcn',{@gaplotdistance,@gaplotrange},...
%'MaxStallGenerations',100);

%stopping criteria
opts.FunctionTolerance = 1e-6;
opts.MaxGenerations = 200;
%opts.MutationFcn =

testvar = [0.5 0.9 1];
testvar2 = [0.5 0.75 1];

n=1;

for s = 1:1
        %problem parameters
        opts.PopulationSize = 160;
        opts.CrossoverFraction = 0.8;
        
        for i = 1:500
            [parameters(i,:),fval(i),exitFlag,Output(i)] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB,[],opts);
            if exitFlag == 1
                converging(n) = i;
                n=n+1;
            end
        end
        
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           %
%  channelHeight   = x(1);  %
%  channelWidth    = x(2);  %
%  baseHeight      = x(3);  %
%  wallWidth       = x(4);  %
%                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%