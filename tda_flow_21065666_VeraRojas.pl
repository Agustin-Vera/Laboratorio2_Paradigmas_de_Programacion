%#################################################################
%             TDA Flow
%#################################################################
% Representacion: Id X NameMsg X Options
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
    myMember(List, Elemento) (aridad = 2)
    flowExist(Flows, NewFlow) (aridad = 2)

Metas primarias:
    
Metas secuandarias:
    
*/


% ------------------------------ Selectores ------------------------------------

% Dominio: Flow X OptionList
% Descripcion: Obtiene las Options del Flow
% Tipo de algoritmo: N/A
% Recorrido: list
getFlowOptions([_, _, Options], Options).

% Dominio: Flow X int
% Descripcion: Obtiene el ID del Flow
% Tipo de algoritmo: N/A
% Recorrido: int
getFlowID([Id, _, _], Id).

% Dominio: Flow X string
% Descripcion: Obtiene el NameMsg dek Flow
% Tipo de algoritmo: N/A
% Recorrido: String
getFlowNameMsg([_, NameMsg, _], NameMsg).

% Dominio: FlowList X IdList
% Descripcion: Obtiene todos los IDs de una lista de Flows
% Tipo de algoritmo: Recursion de cola
% Recorrido: list
getFlowsIDs([], []).
getFlowsIDs([Flow|Resto], [Id|Resultado]) :-
    getFlowID(Flow, Id),
    getFlowsIDs(Resto, Resultado), !.

% Obtiene un flow dado su ID y una lista de flows
% getFlowByID(CurrentChatbotFlows, CurrentFlowID, CurrentFlow),
getFlowByID([], _, []).
getFlowByID([Flow|_], FlowID, Flow) :-
    getFlowID(Flow, FlowID), !.
getFlowByID([_|Resto], FlowID, Resultado) :-
    getFlowByID(Resto, FlowID, Resultado), !.

% ------------------------------ Pertenencias ----------------------------------

% Dominio: FlowList
% Descripcion: Verifica si una lista posee Flows unicos
% Tipo de algoritmo: N/A
% Recorrido: boolean
uniqueFlows(Flows) :-
    getFlowsIDs(Flows, FlowsIDs),
    flowIdExist(FlowsIDs).

% Dominio: IdList
% Descripcion: Verifica si una lista posee IDs unicos
% Tipo de algoritmo: N/A
% Recorrido: boolean
flowIdExist([]).
flowIdExist([Id|Resto]) :-
    not(member(Id, Resto)),
    flowIdExist(Resto).

% Dominio: List X Elemento
% Descripcion: Verifica si un Elemento esta dentro de una Lista
% Tipo de algoritmo: Recursion de cola
% Recorrido: boolean
myMember([Elemento|_], Elemento) :- !.
myMember([_|Resto], Elemento) :-
    myMember(Resto, Elemento), !.

% Dominio: FlowList X Flow
% Descripcion: Verifica si un flow existe en una lista de flows
% Tipo de algoritmo: Recursion de cola
% Recorrido: boolean
flowExist(Flows, NewFlow) :-
    getFlowsIDs(Flows, FlowsIDs),
    getFlowID(NewFlow, NewFlowID),
    not(myMember(FlowsIDs, NewFlowID)).

% ------------------------------ Modificadores ---------------------------------

% Dominio: Flow X OptionList X Flow
% Descripcion: Modifica la lista de Options de un Flow
% Tipo de algoritmo: 
% Recorrido: Flow
setFlowOptions(Flow, NewOptions, NewFlow) :-
    flow(Id, NameMsg, _, Flow),
    flow(Id, NameMsg, NewOptions, NewFlow).

% ------------------------------ Otros predicados ------------------------------

% Dominio: OptionList X Option X OptionList
% Descripcion: Agrega una Option a una lista de Options
% Tipo de algoritmo: N/A
% Recorrido: list
addOptionToOptions(FlowOptions, Option, NewFlowOptions) :-
    append(FlowOptions, [Option], NewFlowOptions).