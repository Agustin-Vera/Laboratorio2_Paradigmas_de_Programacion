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