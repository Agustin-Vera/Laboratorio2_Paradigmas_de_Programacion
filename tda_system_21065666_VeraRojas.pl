%#################################################################
%             TDA System
%#################################################################

/*
Predicados:
    system(Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, [Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date] (aridad = 9)
    getSystemChatbots([_, _, Chatbots, _, _, _, _, _], Chatbots) (aridad = 2)
    getSystemUsers([_, _, _, Users, _, _, _, _], Users) (aridad = 2)
    getSystemChatHistorys([_, _, _, _, ChatHistorys, _, _, _], ChatHistorys) (aridad = 2)
    getSystemCurrentChatbotID([_, _, _, _, _, CurrentChatbotID, _, _], CurrentChatbotID) (aridad = 2)
    getSystemCurrentFlowID([_, _, _, _, _, _, CurrentFlowID, _], CurrentFlowID) (aridad = 2)
    getSystemInitialChatbotCodeLink([_, InitialChatbotCodeLink, _, _, _, _, _, _], InitialChatbotCodeLink) (aridad = 2)
    setSystemStartFlowID(System, StartFlowID, NewSystem) (aridad = 3)
    setSystemChatbots(System, NewChatbots, NewSystem) (aridad = 3)
    addChatbotToChatbots(SystemChatbots, Chatbot, NewSystemChatbots) (aridad = 3)

Metas primarias:


Metas secuandarias:
    
*/

% ------------------------------ Constructor -----------------------------------

% Dominio: string - int - ChatbotList - UserList - ChatHistoryList - int - int - int - System
% Descripcion: Crea un System
% Tipo de algoritmo: N/A
% Recorrido: System
system(Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, [Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date]).

% ------------------------------ Selectores ------------------------------------

% Dominio: System - ChatbotList
% Descripcion: Obtiene la lista de Chatbots del System
% Tipo de algoritmo: N/A
% Recorrido: list
getSystemChatbots([_, _, Chatbots, _, _, _, _, _], Chatbots).

% Dominio: System - UserList
% Descripcion: Obtiene la lista de Users del System
% Tipo de algoritmo: N/A
% Recorrido: list
getSystemUsers([_, _, _, Users, _, _, _, _], Users).

% Dominio: System - ChatHistoryList
% Descripcion: Obtiene la lista de ChatHistorys del System
% Tipo de algoritmo: N/A
% Recorrido: list
getSystemChatHistorys([_, _, _, _, ChatHistorys, _, _, _], ChatHistorys).

% Dominio: System - int
% Descripcion: Obtiene el CurrentChatbotID del System
% Tipo de algoritmo: N/A
% Recorrido: int
getSystemCurrentChatbotID([_, _, _, _, _, CurrentChatbotID, _, _], CurrentChatbotID).

% Dominio: System - int
% Descripcion: Obtiene el CurrentFlowID del System
% Tipo de algoritmo: N/A
% Recorrido: int
getSystemCurrentFlowID([_, _, _, _, _, _, CurrentFlowID, _], CurrentFlowID).

% Dominio: System - int
% Descripcion: Obtiene el InitialChatbotCodeLink del System
% Tipo de algoritmo: N/A
% Recorrido: int
getSystemInitialChatbotCodeLink([_, InitialChatbotCodeLink, _, _, _, _, _, _], InitialChatbotCodeLink).

% ------------------------------ Modificadores ---------------------------------

% Dominio: System - int - System
% Descripcion: Modifica el StartFlowID del System
% Tipo de algoritmo: N/A
% Recorrido: System
setSystemStartFlowID(System, StartFlowID, NewSystem) :-
    system(Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, _, Date, System),
    system(Name, InitialChatbotCodeLink, Chatbots, Users, ChatHistorys, CurrentChatbotID, StartFlowID, Date, NewSystem).

% Dominio: System - ChatbotList - System
% Descripcion: Modifica los Chtabots del System
% Tipo de algoritmo: N/A
% Recorrido: System
setSystemChatbots(System, NewChatbots, NewSystem) :-
    system(Name, InitialChatbotCodeLink, _, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, System),
    system(Name, InitialChatbotCodeLink, NewChatbots, Users, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, NewSystem).

setSystemUsers(System, NewUsers, NewSystem) :-
    system(Name, InitialChatbotCodeLink, Chatbots, _, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, System),
    system(Name, InitialChatbotCodeLink, Chatbots, NewUsers, ChatHistorys, CurrentChatbotID, CurrentFlowID, Date, NewSystem).

setSystemChatHistorys(System, NewChatHistorys, NewSystem) :-
    system(Name, InitialChatbotCodeLink, Chatbots, Users, _, CurrentChatbotID, CurrentFlowID, Date, System),
    system(Name, InitialChatbotCodeLink, Chatbots, Users, NewChatHistorys, CurrentChatbotID, CurrentFlowID, Date, NewSystem).

% ------------------------------ Otros predicados ------------------------------

% Dominio: ChatbotList - Chatbot - ChatbotList
% Descripcion: Agrega un Chatbot a una lista de Chatbots
% Tipo de algoritmo: N/A
% Recorrido: lits
addChatbotToChatbots(SystemChatbots, Chatbot, NewSystemChatbots) :-
    append(SystemChatbots, [Chatbot], NewSystemChatbots).

addUserToUsers(SystemUsers, User, NewSystemUsers) :-
    append(SystemUsers, [User], NewSystemUsers).

addChatHistoryToChatHistorys(SystemChatHistorys, ChatHistory, NewSystemChatHistorys) :-
    append(SystemChatHistorys, [ChatHistory], NewSystemChatHistorys).