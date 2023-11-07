%#################################################################
%             TDA Chathistory
%#################################################################

% Constructor

chatHistory(Username, History, [UsernameLower, History]) :-
    string_lower(Username, UsernameLower).
