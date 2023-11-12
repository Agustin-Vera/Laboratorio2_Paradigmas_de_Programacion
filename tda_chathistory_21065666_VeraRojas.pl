%#################################################################
%             TDA Chathistory
%#################################################################
% Representacion: Username(String) X History(String)
/*
Predicados:
    chatHistory(Username, History, [UsernameLower, History]) (aridad = 3)
    getChathistoryUser([Username, _], Username) (aridad = 2)
    getChathistoryHistory([_, History], History) (aridad = 2)
    getHistoryByUsername([ChatHistory|_], Username, ChatHistory)  (aridad = 3)
    updateChatHistory(Chathistory, NewMessage, UpdatedChathistory)  (aridad = 3)
    changeChathistorys([Chathistory|Resto], User, NewMessage, [UpdatedChathistory|Resto]) (aridad = 4)

Metas primarias:
    chatHistory, updateChatHistory, changeChathistorys
    
Metas secuandarias:
    getChathistoryUser, getChathistoryHistory, getHistoryByUsername, 
*/
% ------------------------------ Constructor -----------------------------------

% Dominio: String X String X Chathistory
% Descripcion: Crea un Chathistory
% Tipo de algoritmo: N/A
% Recorrido: Chathistory
chatHistory(Username, History, [UsernameLower, History]) :-
    string_lower(Username, UsernameLower).

% ------------------------------ Selectores ------------------------------------

% Dominio: Chathistory X String
% Descripcion: Obtiene el Username del Chathistory
% Tipo de algoritmo: N/A
% Recorrido: String
getChathistoryUser([Username, _], Username).

% Dominio: Chathistory X String
% Descripcion: Obtiene el Historial del Chathistory
% Tipo de algoritmo: N/A
% Recorrido: String
getChathistoryHistory([_, History], History).

% Dominio: List(Chathistory) X String X Chathistory
% Descripcion: Obtiene un Chathistory dado un Username y una lista de Chathistorys
% Tipo de algoritmo: Recursion de cola
% Recorrido: Chathistory
getHistoryByUsername([], _, []).
getHistoryByUsername([ChatHistory|_], Username, ChatHistory) :-
    string_lower(Username, LowerUsername),
    getChathistoryUser(ChatHistory, LowerUsername), !.
getHistoryByUsername([_|Resto], Username, Resultado) :-
    getHistoryByUsername(Resto, Username, Resultado).

% ------------------------------ Modificadores ---------------------------------

% Dominio: Chathistory X String X Chathistory
% Descripcion: Actualiza un Chathistory cambiando el Historial del Chathistory
% Tipo de algoritmo: N/A
% Recorrido: Chathistory
updateChatHistory(Chathistory, NewMessage, UpdatedChathistory) :-
    getChathistoryUser(Chathistory, Username),
    getChathistoryHistory(Chathistory, History),
    string_concat(History, NewMessage, NewHistory),
    chatHistory(Username, NewHistory, UpdatedChathistory).

% Dominio: List(Chathistory) X User X String X List(Chathistory)
% Descripcion: Actualiza el Chathistory asociado a un User (Username) con el contenido Message
% Tipo de algoritmo: Recursion de cola
% Recorrido: List(Chathistory)
changeChathistorys([], _, _, []).
changeChathistorys([Chathistory|Resto], User, NewMessage, [UpdatedChathistory|Resto]) :-
    getUserName(User, Username),
    member(Username, Chathistory),
    updateChatHistory(Chathistory, NewMessage, UpdatedChathistory), !.
changeChathistorys([Chathistory|Resto], User, NewMessage, [Chathistory|Resultado]) :-
    changeChathistorys(Resto, User, NewMessage, Resultado).