:-include(tda_option_21065666_VeraRojas).


%#################################################################
%             Main
%#################################################################


% RF 2 - TDA Option - Constructor
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, LowerKeywords]) :-
    keywordsToLowerKeywords(Keyword, LowerKeywords).


% RF 3 - TDA Flow - Constructor
flow(Id, NameMsg, Option, [Id, NameMsg, Option]) :-
    uniqueOptions(Option).

/*
option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], O1), 
option(2, "2) Estudiar", 2, 1, ["aprender", "perfeccionarme"], O2), 
flow(1, "Flujo Principal Chatbot 1\nBienvenido\n¿Qué te gustaría hacer?", [O1, O2], F10). 
*/
