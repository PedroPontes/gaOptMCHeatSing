
ObjectiveFunction = @NewHeatResistanceModel;
nvars = 4;      % Number of variables
p = 50;       %mm precisão

LB = [  p   p   p   p   ];        % Lower bound
UB = [  1   1   1   1 ]*1E3;   % Upper bound

opts = optimoptions('ga','PlotFcn',{@gaplotbestf},...
    'MaxStallGenerations',100);

%stopping criteria
opts.FunctionTolerance = 1e-6;
opts.MaxGenerations = 200;

%problem parameters
opts.PopulationSize = 160;
opts.CrossoverFraction = 0.8;

[parameters,fval,exitFlag,Output] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB,[],opts);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           %
%  channelHeight   = x(1);  %
%  channelWidth    = x(2);  %
%  baseHeight      = x(3);  %
%  wallWidth       = x(4);  %
%                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%