%#################################################################
%             TDA Chathistory
%#################################################################
% Representacion: Username X History
/*
Predicados:
    chatHistory(Username, History, [UsernameLower, History]) (aridad = 3)

Metas primarias:

Metas secuandarias:
    
*/
% ------------------------------ Constructor -----------------------------------

% Dominio: String X String X Chathistory
% Descripcion: Crea un Chathistory
% Tipo de algoritmo: N/A
% Recorrido: Chathistory
chatHistory(Username, History, [UsernameLower, History]) :-
    string_lower(Username, UsernameLower).

% Selectores
getChathistoryUser([Username, _], Username).
getChathistoryHistory([_, History], History).

% Modificadores

% changeChathistorys(SystemChatHistorys, User, NewInteraction, NewSystemChatHistorys)
updateChatHistory(Chathistory, NewMessage, UpdatedChathistory) :-
    getChathistoryUser(Chathistory, Username),
    getChathistoryHistory(Chathistory, History),
    string_concat(History, NewMessage, NewHistory),
    chatHistory(Username, NewHistory, UpdatedChathistory).

changeChathistorys([], _, _, []).
changeChathistorys([Chathistory|Resto], User, NewMessage, [UpdatedChathistory|Resto]) :-
    getUserName(User, Username),
    member(Username, Chathistory),
    updateChatHistory(Chathistory, NewMessage, UpdatedChathistory), !.
changeChathistorys([Chathistory|Resto], User, NewMessage, [Chathistory|Resultado]) :-
    changeChathistorys(Resto, User, NewMessage, Resultado).