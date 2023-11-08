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

getUsersStatus([],[]).
getUsersStatus([User|Resto], [Status|Resultado]) :-
    getUserStatus(User, Status),
    getUsersStatus(Resto, Resultado), !.

getUserLogged([], []).
getUserLogged([User|_], User) :-
    member(1, User), !.
getUserLogged([_|Resto], Resultado) :-
    getUserLogged(Resto, Resultado).

% Pertenecias

% verifica si un user existe en una lista de users
userExist(Users, Username) :-
    getUsersIDs(Users, UserNames),
    string_lower(Username, NewUsername),
    member(NewUsername, UserNames).

% verifica si hay usuarios iniciados
usersLogged(Users) :-
    getUsersStatus(Users, UsersStatus),
    member(1, UsersStatus).


% Modificadores

changeUserStatus(User, Status, UpdatedUser) :-
    getUserName(User, Name),
    user(Name, Status, UpdatedUser).

changeUsersStatus([], _, _, []).
changeUsersStatus([User|Resto], Username, Status, [UserLogged|Resto]) :-
    string_lower(Username, UsernameLower),
    member(UsernameLower, User),
    changeUserStatus(User, Status, UserLogged), !.
changeUsersStatus([User|Resto], Username, Status, [User|Resultado]) :-
    changeUsersStatus(Resto, Username, Status, Resultado).