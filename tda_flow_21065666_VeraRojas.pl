
%#################################################################
%             TDA Flow
%#################################################################

% Constructor
newFlow(Id, NameMsg, Option, [Id, NameMsg, Option]).


% Selectores
getFlowOptions([_, _, Options], Options).


% Modificadores

setFlowOptions(Flow, NewOptions, NewFlow) :-
    flow(Id, NameMsg, _, Flow),
    flow(Id, NameMsg, NewOptions, NewFlow).


% Otros predicados

addOptionToOptions(FlowOptions, Option, NewFlowOptions) :-
    append(FlowOptions, [Option], NewFlowOptions).