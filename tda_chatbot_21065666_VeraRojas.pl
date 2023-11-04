%#################################################################
%             TDA Chatbot
%#################################################################

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
    getStartFlowIDByInitialChatbots(ChatbotList, InitialChatbotID, InitialFlowID) (aridad  = 3)

Metas primarias:

Metas secuandarias:
    
*/

% El constructor queda definido en el main

%#################################################################
%             Selectores
%#################################################################

% Dominio: Chatbot - int
% Descripcion: Obtiene el Id del Chatbot
% Tipo de algoritmo: N/A
getChatbotID([Id, _, _, _, _], Id).

% Dominio: Chabot - String
% Descripcion: Obtiene el Name del Chatbot
% Tipo de algoritmo: N/A
getChatbotName([_, Name, _, _, _], Name).

% Dominio: Chatbot - FlowList
% Descripcion: Obtiene los Flows del Chatbot
% Tipo de algoritmo: N/A
getChatbotFlows([_, _, _, _, Flows], Flows).

% Dominio: Chatbot - int
% Descripcion: Obtiene el StartFlowID del Chatbot
% Tipo de algoritmo: N/A
getChatbotStartFlowID([_, _, _, StartFlowID, _], StartFlowID).

% Dominio: ChatbotList - IdList
% Descripcion: Obtiene todos los ID de los Chatbots dentro de una lista de Chatbots
% Tipo de algoritmo: 
getChatbotsIDs([], []).
getChatbotsIDs([Chatbot|Resto], [Id|Resultado]) :-
    getChatbotID(Chatbot, Id),
    getChatbotsIDs(Resto, Resultado), !.

% Dominio: Chatbot - int - int
% Descripcion: Verifica si un Chatbot corresponde al Chatbot asociado a el InitialChatbotCodeLink
% Tipo de algoritmo: N/A
isInitialChatbot(Chatbot, InitialChatbotCodeLink, InitialFlowID) :-
    getChatbotID(Chatbot, ChatbotID),
    ChatbotID == InitialChatbotCodeLink,
    getChatbotStartFlowID(Chatbot, InitialFlowID).

% getStartFlowIDByInitialChatbot(Chatbots, ChatbotID, InitialFlowID) :-
% Dominio: ChatbotList - int - int
% Descripcion: Obtiene el IntialFlowID dada una lista de Chatbots y un InitialChatbotID
% Tipo de algoritmo:
getStartFlowIDByInitialChatbots([], _, []).
getStartFlowIDByInitialChatbots([Chatbot|_], InitialChatbotID, InitialFlowID) :-
    isInitialChatbot(Chatbot, InitialChatbotID, InitialFlowID), !.
getStartFlowIDByInitialChatbots([_|Resto], InitialChatbotID, InitialFlowID) :-
    getStartFlowIDByInitialChatbots(Resto, InitialChatbotID, InitialFlowID).

%#################################################################
%             Pertenencias
%#################################################################

% Verifica si hay un ID repetido en una lista de chatbots
% Dominio: ChatbotList
% Descripcion: Verifica si hay un Chatbot repetido en una lista de Chatbots
% Tipo de algoritmo: N/A
uniqueChatbots(Chatbots) :-
    getChatbotsIDs(Chatbots, ChatbotsIDs),
    chatbotIdExist(ChatbotsIDs).

% Dominio: IdList
% Descripcion: Verifica si hay un ID repetido en una lista de IDs
% Tipo de algoritmo:
chatbotIdExist([]).
chatbotIdExist([Id|Resto]) :-
    not(member(Id, Resto)),
    chatbotIdExist(Resto).
%#################################################################
%             Modificadores
%#################################################################

% Dominio: Chatbot - FlowList - Chatbot
% Descripcion: Modifica la lista de Flows de un Chatbot
% Tipo de algoritmo: N/A
setChatbotFlows(Chatbot, NewFlows, NewChatbot) :-
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, _, Chatbot),
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, NewFlows, NewChatbot).

%#################################################################
%             Otros predicados
%#################################################################

% Dominio: FlowList - Flow - FlowList
% Descripcion: Agrega un Flow a una lista de Flows
% Tipo de algoritmo: Recursion de cola
addFlowToFlows([], Flow, [Flow]).
addFlowToFlows([FlowCabeza|Resto], Flow, [FlowCabeza|Resultado]) :-
    addFlowToFlows(Resto, Flow, Resultado).