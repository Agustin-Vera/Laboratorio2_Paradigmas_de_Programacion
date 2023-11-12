%#################################################################
%             TDA Chatbot
%#################################################################
% Representacion: ChatbotID(int) X Name(String) X WelcomeMessage(String) X StartFlowID(int) X Flow
/*
Predicados:
    getChatbotID(Chatbot, Id) (aridad = 2)
    getChatbotName(Chatbot, Name) (aridad = 2)
    getChatbotFlows(Chatbot, Flows) (aridad = 2)
    getChatbotStartFlowID(Chatbot, StartFlowID) (aridad = 2)
    setChatbotFlows(Chatbot, NewFlows, NewChatbot) (aridad = 3)
    addFlowToFlows(FlowList, Flow, FlowList) (aridad = 3)
    uniqueChatbots(Chatbots) (aridad = 1)
    getChatbotsIDs(ChatbotList, IdList) (aridad = 2)
    chatbotIdExist(IdList) (aridad 2)
    isInitialChatbot(Chatbot, InitialChatbotCodeLink, InitialFlowID) (aridad = 3)
    getStartFlowIDByInitialChatbots(ChatbotList, InitialChatbotID, InitialFlowID) (aridad  = 4)
    getChatbotByID([Chatbot|_], ChatbotID, Chatbot) (aridad = 3)
    chatbotExist(Chatbots, NewChatbot) (aridad = 2)

Metas primarias:
    isInitialChatbot, getStartFlowIDByInitialChatbots, getChatbotByID, uniqueChatbots, chatbotExist, setChatbotFlows, addFlowToFlows

Metas secuandarias:
    getChatbotID, getChatbotName, getChatbotFlows, getChatbotStartFlowID, getChatbotsIDs, chatbotIdExist, 
*/

% ------------------------------ Selectores ------------------------------------

% Dominio: Chatbot X int
% Descripcion: Obtiene el Id del Chatbot
% Tipo de algoritmo: N/A
% Recorrido: int
getChatbotID([Id, _, _, _, _], Id).

% Dominio: Chatbot X String
% Descripcion: Obtiene el Name del Chatbot
% Tipo de algoritmo: N/A
% Recorrido: String
getChatbotName([_, Name, _, _, _], Name).

% Dominio: Chatbot X List(Flow)
% Descripcion: Obtiene los Flows del Chatbot
% Tipo de algoritmo: N/A
% Recorrido: List(Flow)
getChatbotFlows([_, _, _, _, Flows], Flows).

% Dominio: Chatbot X int
% Descripcion: Obtiene el StartFlowID del Chatbot
% Tipo de algoritmo: N/A
% Recorrido: int
getChatbotStartFlowID([_, _, _, StartFlowID, _], StartFlowID).

% Dominio: List(Chatbot) X List(int)
% Descripcion: Obtiene todos los ID de los Chatbots dentro de una lista de Chatbots
% Tipo de algoritmo: N/A
% Recorrido: List(int)
getChatbotsIDs([], []).
getChatbotsIDs([Chatbot|Resto], [Id|Resultado]) :-
    getChatbotID(Chatbot, Id),
    getChatbotsIDs(Resto, Resultado), !.

% Dominio: List(Chatbot) X int X int X int
% Descripcion: Obtiene el IntialFlowID dada una lista de Chatbots y un InitialChatbotID
% Tipo de algoritmo: Recursion de cola
% Recorrido: int
getStartFlowIDByInitialChatbots([Chatbot|_], InitialChatbotID, _, InitialFlowID) :-
    isInitialChatbot(Chatbot, InitialChatbotID, InitialFlowID), !.
getStartFlowIDByInitialChatbots([_|Resto], InitialChatbotID, _, InitialFlowID) :-
    getStartFlowIDByInitialChatbots(Resto, InitialChatbotID, _, InitialFlowID), !.
getStartFlowIDByInitialChatbots(_, _, CurrentFlowID, CurrentFlowID).

% Dominio: List(Chatbot) X int X Chatbot
% Descripcion: Obtiene un chatbot dado su ID y una lista de chatbots
% Tipo de algoritmo: Recursion de cola
% Recorrido: Chatbot
getChatbotByID([], _, []).
getChatbotByID([Chatbot|_], ChatbotID, Chatbot) :-
    getChatbotID(Chatbot, ChatbotID), !.
getChatbotByID([_|Resto], ChatbotID, Resultado) :-
    getChatbotByID(Resto, ChatbotID, Resultado).
    
% ------------------------------ Pertenencias ----------------------------------

% Dominio: List(Chatbot)
% Descripcion: Verifica si hay un Chatbot repetido en una lista de Chatbots
% Tipo de algoritmo: N/A
% Recorrido: boolean
uniqueChatbots(Chatbots) :-
    getChatbotsIDs(Chatbots, ChatbotsIDs),
    chatbotIdExist(ChatbotsIDs).

% Dominio: List(int)
% Descripcion: Verifica si hay un ID repetido en una lista de IDs
% Tipo de algoritmo: N/A
% Recorrido: boolean
chatbotIdExist([]).
chatbotIdExist([Id|Resto]) :-
    not(member(Id, Resto)),
    chatbotIdExist(Resto).

% Dominio: List(Chatbot) X Chatbot
% Descripcion: Verifica si un Chatbot existe en una lista de Chatbots
% Tipo de algoritmo: N/A
% Recorrido: boolean
chatbotExist(Chatbots, NewChatbot) :-
    getChatbotsIDs(Chatbots, ChatbotsIDs),
    getChatbotID(NewChatbot, NewChatbotID),
    not(member(NewChatbotID, ChatbotsIDs)).

% ------------------------------ Modificadores ---------------------------------

% Dominio: Chatbot X List(Flow) X Chatbot
% Descripcion: Modifica la lista de Flows de un Chatbot
% Tipo de algoritmo: N/A
% Recorrido: Chatbot
setChatbotFlows(Chatbot, NewFlows, NewChatbot) :-
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, _, Chatbot),
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, NewFlows, NewChatbot).

% ------------------------------ Otros predicados ------------------------------

% Dominio: List(Flow) X Flow X List(Flow)
% Descripcion: Agrega un Flow a una lista de Flows
% Tipo de algoritmo: Recursion de cola
% Recorrido: List(Flow)
addFlowToFlows([], Flow, [Flow]).
addFlowToFlows([FlowCabeza|Resto], Flow, [FlowCabeza|Resultado]) :-
    addFlowToFlows(Resto, Flow, Resultado).

% Dominio: Chatbot X int X int
% Descripcion: Verifica si un Chatbot corresponde al Chatbot asociado a el InitialChatbotCodeLink
% Tipo de algoritmo: N/A
% Recorrido: int
isInitialChatbot(Chatbot, InitialChatbotCodeLink, InitialFlowID) :-
    getChatbotID(Chatbot, ChatbotID),
    ChatbotID == InitialChatbotCodeLink,
    getChatbotStartFlowID(Chatbot, InitialFlowID).