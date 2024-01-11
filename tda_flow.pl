%#################################################################
%             TDA Flow
%#################################################################
% Representacion: Id(int) X NameMsg(String) X Option
/*
Predicados:
    getFlowOptions(Flow, Options) (aridad = 2)
    getFlowID(Flow, Id) (aridad = 2)
    getFlowNameMsg(Flow, NameMsg) (aridad = 2)
    getFlowsIDs(FlowList, IdsList) (aridad = 2)
    getFlowByID([Flow|_], FlowID, Flow) (aridad = 3)
    uniqueFlows(Flows) (aridad = 1)
    flowIdExist([Id|Resto]) (aridad = 1)
    myMember([Elemento|_], Elemento) (aridad = 2)
    flowExist(Flows, NewFlow) (aridad = 2)
    setFlowOptions(Flow, NewOptions, NewFlow) (aridad = 3)
    addOptionToOptions(FlowOptions, Option, NewFlowOptions) (aridad = 3)

Metas primarias:
    getFlowByID, uniqueFlows, flowIdExist, flowExist, setFlowOptions, addOptionToOptions

Metas secuandarias:
    getFlowOptions, getFlowID, getFlowNameMsg, getFlowsIDs, myMember
*/

% ------------------------------ Selectores ------------------------------------

% Dominio: Flow X List(Option)
% Descripcion: Obtiene las Options del Flow
% Tipo de algoritmo: N/A
% Recorrido: List(Option)
getFlowOptions([_, _, Options], Options).

% Dominio: Flow X int
% Descripcion: Obtiene el ID del Flow
% Tipo de algoritmo: N/A
% Recorrido: int
getFlowID([Id, _, _], Id).

% Dominio: Flow X String
% Descripcion: Obtiene el NameMsg dek Flow
% Tipo de algoritmo: N/A
% Recorrido: String
getFlowNameMsg([_, NameMsg, _], NameMsg).

% Dominio: List(Flow) X List(int)
% Descripcion: Obtiene todos los IDs de una lista de Flows
% Tipo de algoritmo: Recursion de cola
% Recorrido: List(int)
getFlowsIDs([], []).
getFlowsIDs([Flow|Resto], [Id|Resultado]) :-
    getFlowID(Flow, Id),
    getFlowsIDs(Resto, Resultado), !.

% Dominio: List(Flow) X int X Flow
% Descripcion: Obtiene un Flow dada una lista de Flows y un ID para identificarlo
% Tipo de algoritmo: Recursion de cola
% Recorrido: Flow
getFlowByID([], _, []).
getFlowByID([Flow|_], FlowID, Flow) :-
    getFlowID(Flow, FlowID), !.
getFlowByID([_|Resto], FlowID, Resultado) :-
    getFlowByID(Resto, FlowID, Resultado), !.

% ------------------------------ Pertenencias ----------------------------------

% Dominio: List(Flow)
% Descripcion: Verifica si una lista posee Flows unicos
% Tipo de algoritmo: N/A
% Recorrido: boolean
uniqueFlows(Flows) :-
    getFlowsIDs(Flows, FlowsIDs),
    flowIdExist(FlowsIDs).

% Dominio: List(int)
% Descripcion: Verifica si una lista posee IDs unicos
% Tipo de algoritmo: Recursion de cola
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

% Dominio: List(Flow) X Flow
% Descripcion: Verifica si un flow existe en una lista de flows
% Tipo de algoritmo: N/A
% Recorrido: boolean
flowExist(Flows, NewFlow) :-
    getFlowsIDs(Flows, FlowsIDs),
    getFlowID(NewFlow, NewFlowID),
    not(myMember(FlowsIDs, NewFlowID)).

% ------------------------------ Modificadores ---------------------------------

% Dominio: Flow X List(Option) X Flow
% Descripcion: Modifica la lista de Options de un Flow
% Tipo de algoritmo: N/A
% Recorrido: Flow
setFlowOptions(Flow, NewOptions, NewFlow) :-
    flow(Id, NameMsg, _, Flow),
    flow(Id, NameMsg, NewOptions, NewFlow).

% ------------------------------ Otros predicados ------------------------------

% Dominio: List(Option) X Option X List(Option)
% Descripcion: Agrega una Option a una lista de Options
% Tipo de algoritmo: N/A
% Recorrido: List(Option)
addOptionToOptions(FlowOptions, Option, NewFlowOptions) :-
    append(FlowOptions, [Option], NewFlowOptions).