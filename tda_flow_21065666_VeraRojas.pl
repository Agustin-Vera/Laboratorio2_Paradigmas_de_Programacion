
%#################################################################
%             TDA Flow
%#################################################################

/*
Predicados:
    getFlowOptions(Flow, Options) (aridad = 2)
    getFlowID(Flow, Id) (aridad = 2)
    getFlowNameMsg(Flow, NameMsg) (aridad = 2)
    getFlowsIDs(FlowList, IdsList) (aridad = 2)
    uniqueFlows(Flows) (aridad = 1)
    flowIdExist(IdsList) (aridad = 1)
    setFlowOptions(Flow, NewOptions, NewFlow) (aridad = 3)
    addOptionToOptions(FlowOptions, Option, NewFlowOptions) (aridad = 3)

Metas primarias:
    
Metas secuandarias:
    
*/

% Constructor
%newFlow(Id, NameMsg, Option, [Id, NameMsg, Option]).

%#################################################################
%             Selectores
%#################################################################

% Dominio: Flow - OptionList
% Descripcion: Obtiene las Options del Flow
% Tipo de algoritmo:
getFlowOptions([_, _, Options], Options).

% Dominio: Flow - int
% Descripcion: Obtiene el ID del Flow
% Tipo de algoritmo:
getFlowID([Id, _, _], Id).

% Dominio: Flow - string
% Descripcion: Obtiene el NameMsg dek Flow
% Tipo de algoritmo:
getFlowNameMsg([_, NameMsg, _], NameMsg).

% Dominio: FlowList - IdList
% Descripcion: Obtiene todos los IDs de una lista de Flows
% Tipo de algoritmo:
getFlowsIDs([], []).
getFlowsIDs([Flow|Resto], [Id|Resultado]) :-
    getFlowID(Flow, Id),
    getFlowsIDs(Resto, Resultado), !.

%#################################################################
%             Pertenencias
%#################################################################

% Dominio: FlowList
% Descripcion: Verifica si una lista posee Flows unicos
% Tipo de algoritmo:
uniqueFlows(Flows) :-
    getFlowsIDs(Flows, FlowsIDs),
    flowIdExist(FlowsIDs).

% Dominio: IdList
% Descripcion: Verifica si una lista posee IDs unicos
% Tipo de algoritmo: N/A
flowIdExist([]).
flowIdExist([Id|Resto]) :-
    not(member(Id, Resto)),
    flowIdExist(Resto).

%#################################################################
%             Modificadores
%#################################################################

% Dominio: Flow - OptionList - Flow
% Descripcion: Modifica la lista de Options de un Flow
% Tipo de algoritmo: 
setFlowOptions(Flow, NewOptions, NewFlow) :-
    flow(Id, NameMsg, _, Flow),
    flow(Id, NameMsg, NewOptions, NewFlow).

%#################################################################
%             Otros predicados
%#################################################################

% Dominio: OptionList - Option - OptionList
% Descripcion: Agrega una Option a una lista de Options
% Tipo de algoritmo: N/A
addOptionToOptions(FlowOptions, Option, NewFlowOptions) :-
    append(FlowOptions, [Option], NewFlowOptions).