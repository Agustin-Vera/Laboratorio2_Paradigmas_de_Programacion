%#################################################################
%             TDA Option
%#################################################################
% Representacion: Code(int) X Message(String) X ChatbotCodeLink(int) X InitialFlowCodeLink(int) X Keyword
/*
Predicados:
    getOptionCode(Option, Code) (aridad = 2)
    getOptionKeyword([_, _, _, _, Keyword], Keyword) (aridad = 2)
    getOptionChatbotCodeLink([_, _, ChatbotCodeLink, _, _], ChatbotCodeLink) (aridad = 2)
    getOptionInitialFlowCodeLink([_, _, _, InitialFlowCodeLink, _], InitialFlowCodeLink) (arridad = 2)
    getOptionMessage([_, Message, _, _, _], Message) (aridad = 2)
    getOptionsCodes(OptionList, CodeList) (aridad = 2)
    getOptionByMessage([Option|_], Message, Option) (aridad = 3)
    getChatbotAndFlowCodeLinksByMessage(Options, Message, _, _, NewCurrentFlowID, NewCurrentChatbotID) (aridad = 6)
    getOptionsMessages([Option|Resto], [Message|Resultado]) (aridad = 3)
    codeExist([Code|Resto]) (aridad = 2)
    uniqueOptions(Options) (aridad = 1)
    optionExist(Options, NewOption) (aridad = 2)
    keywordsToLowerKeywords([Keyword|Resto], [LowerKeyword|Resultado]) (aridad = 2)
    optionToString([Message|Resto], FinalMessage) (aridad = 2)
    optionsToString(Options, OptionsStrings) (aridad = 2)

Metas primarias:
    getChatbotAndFlowIDsByOption, getOptionByMessage, getChatbotAndFlowCodeLinksByMessage, codeExist, uniqueOptions, optionExist, optionsToString

Metas secuandarias:
    getOptionCode, getOptionKeyword, getOptionChatbotCodeLink, getOptionInitialFlowCodeLink, getOptionMessage, getOptionsCodes, getOptionsMessages,
    keywordsToLowerKeywords
*/

% ------------------------------ Selectores ------------------------------------

% Dominio: Option X int
% Descripcion: Obtiene el Code de la Option
% Tipo de algoritmo:
% Recorrido: int
getOptionCode([Code, _, _, _, _], Code).

% Dominio: Option X List(String)
% Descripcion: Obtiene las Keywords de la Option
% Tipo de algoritmo: N/A
% Recorrido: List(String)
getOptionKeyword([_, _, _, _, Keyword], Keyword).

% Dominio: Option X int
% Descripcion: Obtiene el ChatbotCodeLink de la Option
% Tipo de algoritmo: N/A
% Recorrido: int
getOptionChatbotCodeLink([_, _, ChatbotCodeLink, _, _], ChatbotCodeLink).

% Dominio: Option X int
% Descripcion: Obtiene el InitialFlowCodeLink de la Option
% Tipo de algoritmo: N/A
% Recorrido: int
getOptionInitialFlowCodeLink([_, _, _, InitialFlowCodeLink, _], InitialFlowCodeLink).

% Dominio: Option X String
% Descripcion: Obtiene el Message de la Option
% Tipo de algoritmo: N/A
% Recorrido: String
getOptionMessage([_, Message, _, _, _], Message).

% Dominio: Option X int X int
% Descripcion: Obtiene el ChatbotID y FlowID de la Option
% Tipo de algoritmo: N/A
% Recorrido: ints
getChatbotAndFlowIDsByOption(Option, ChatbotID, FlowID) :-
    getOptionChatbotCodeLink(Option, ChatbotID),
    getOptionInitialFlowCodeLink(Option, FlowID).

% Dominio: OptionList X List(int)
% Descripcion: Obtiene todos los Codes de una lista de Options
% Tipo de algoritmo: Rercusion de cola
% Recorrido: List(int)
getOptionsCodes([], []).
getOptionsCodes([Option|Resto], [Code|Resultado]) :-
    getOptionCode(Option, Code),
    getOptionsCodes(Resto, Resultado), !.

% Dominio: List(Option) X String X Option
% Descripcion: Obtiene una option dada una lista de options y un Message que puede ser un numero o una keyword
% Tipo de algoritmo: Recursion cola
% Recorrido: Option
getOptionByMessage([Option|_], Message, Option) :-
    number_string(ID, Message),
    getOptionCode(Option, ID), !.
getOptionByMessage([Option|_], Message, Option) :-
    getOptionKeyword(Option, Keywords),
    string_lower(Message, LowerMessage),
    member(LowerMessage, Keywords), !.
getOptionByMessage([_|Resto], Message, Resultado) :-
    getOptionByMessage(Resto, Message, Resultado).

% Dominio: List(Option) X String X int X int X int X int
% Descripcion: Obtiene el ChatbotCodeLink y InitialFlowCodeLink de una Option filtrada por un Message (Ingresado por el usuario)
% Tipo de algoritmo: N/A
% Recorrido: ints
getChatbotAndFlowCodeLinksByMessage(Options, Message, _, _, NewCurrentFlowID, NewCurrentChatbotID) :-
    getOptionByMessage(Options, Message, Option),
    getChatbotAndFlowIDsByOption(Option, NewCurrentChatbotID, NewCurrentFlowID).
getChatbotAndFlowCodeLinksByMessage(_, _, CurrentFlowID, CurrentChatbotID, CurrentFlowID, CurrentChatbotID).

% Dominio: List(Option) X List(String)
% Descripcion: Dada una lista de Options obtiene todos los Messages de estas
% Tipo de algoritmo: Recursion de cola
% Recorrido: List(String)
getOptionsMessages([], []).
getOptionsMessages([Option|Resto], [Message|Resultado]) :-
    getOptionMessage(Option, Message),
    getOptionsMessages(Resto, Resultado).

% ------------------------------ Pertenencias ----------------------------------

% Dominio: List(int)
% Descripcion: Verifica que los codes dentro de una lista sean unicos
% Tipo de algoritmo: Recursion de cola
% Recorrido: boolean
codeExist([]).
codeExist([Code|Resto]) :-
    not(member(Code, Resto)),
    codeExist(Resto).

% Dominio: List(Option)
% Descripcion: Verifica que todas las Options de una lista sean distintas
% Tipo de algoritmo: N/A
% Recorrido: boolean
uniqueOptions(Options) :-
    getOptionsCodes(Options, OptionsCodes),
    codeExist(OptionsCodes).

% Dominio: List(Option) X Option
% Descripcion: Verifica si una Option existe en una lista
% Tipo de algoritmo: N/A
% Recorrido: boolean
optionExist(Options, NewOption) :-
    getOptionsCodes(Options, OptionsCodes),
    getOptionCode(NewOption, NewOptionCode),
    not(member(NewOptionCode, OptionsCodes)).

% ------------------------------ Otros predicados ------------------------------

% Dominio: List(String) X List(String)
% Descripcion: Transforma todas las Keywords a minusculas
% Tipo de algoritmo: Recursion de cola
% Recorrido: List(String)
keywordsToLowerKeywords([], []).
keywordsToLowerKeywords([Keyword|Resto], [LowerKeyword|Resultado]) :-
    string_lower(Keyword, LowerKeyword),
    keywordsToLowerKeywords(Resto, Resultado).

% Dominio: List(String) X String
% Descripcion: Transforma una lista de Strings (Messages de Option) a un String con un formato
% Tipo de algoritmo: Recursion de cola
% Recorrido: String
optionToString([], "").
optionToString([Message|Resto], FinalMessage) :-
    optionToString(Resto, Final),
    string_concat(Message, "\n", MessageIntermedio),
    string_concat(MessageIntermedio, Final, FinalMessage).

% Dominio: List(Option) X String
% Descripcion: Transforma una lista de Options a un String con un formato
% Tipo de algoritmo: N/A
% Recorrido: String
optionsToString(Options, OptionsStrings) :-
    getOptionsMessages(Options, OptionsMessages),
    optionToString(OptionsMessages, OptionsStrings).