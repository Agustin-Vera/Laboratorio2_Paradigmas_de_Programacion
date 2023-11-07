%#################################################################
%             TDA User
%#################################################################

% Constructor
user(Name, Status, [Username, Status]) :-
    string_lower(Name, Username).

% Selectores

getUserName([Name,_], Name).
getUserStatus([_, Status], Status).

getUsersIDs([], []).
getUsersIDs([User|Resto], [Name|Resultado]) :-
    getUserName(User, Name),
    getUsersIDs(Resto, Resultado), !.

% Pertenecias

% verifica si un user existe en una lista de users
userExist(Users, Username) :-
    getUsersIDs(Users, UserNames),
    string_lower(Username, NewUsername),
    member(NewUsername, UserNames).