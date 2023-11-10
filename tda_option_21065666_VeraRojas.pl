%#################################################################
%             TDA Option
%#################################################################
% Representacion: Code X Message X ChatbotCodeLink X InitialFlowCodeLink X Keywords
/*
Predicados:
    getOptionCode(Option, Code) (aridad = 2)
    getOptionsCodes(OptionList, CodeList) (aridad = 2)
    codeExist(CodeList) (aridad = 1)
    uniqueOptions(Options) (aridad = 1)
    optionExist(Options, NewOption) (aridad = 2)
    keywordsToLowerKeywords(KeywordList, LowerKeywordList)  (aridad = 2)

Metas primarias:
    
Metas secuandarias:
    
*/

% Constructor
%El constructor queda definido en el archivo main

% ------------------------------ Selectores ------------------------------------

% Dominio: Option X int
% Descripcion: Obtiene el Code de la Option
% Tipo de algoritmo:
% Recorrido: int
getOptionCode([Code, _, _, _, _], Code).


getOptionKeyword([_, _, _, _, Keyword], Keyword).
getOptionChatbotCodeLink([_, _, ChatbotCodeLink, _, _], ChatbotCodeLink).
getOptionInitialFlowCodeLink([_, _, _, InitialFlowCodeLink, _], InitialFlowCodeLink).
getOptionMessage([_, Message, _, _, _], Message).

getChatbotAndFlowIDsByOption(Option, ChatbotID, FlowID) :-
    getOptionChatbotCodeLink(Option, ChatbotID),
    getOptionInitialFlowCodeLink(Option, FlowID).

% Dominio: OptionList X CodeList
% Descripcion: Obtiene todos los Codes de una lista de Options
% Tipo de algoritmo: Rercusion de cola
% Recorrido: list
getOptionsCodes([], []).
getOptionsCodes([Option|Resto], [Code|Resultado]) :-
    getOptionCode(Option, Code),
    getOptionsCodes(Resto, Resultado), !.

% Obtiene una option dada una lista de options y un Message que puede ser un numero o una keyword
% Da false si no encuentra un ID o una keyword en toda la lista
getOptionByMessage([Option|_], Message, Option) :-
    number_string(ID, Message),
    getOptionCode(Option, ID), !.
    %member(ID, Option), !.
getOptionByMessage([Option|_], Message, Option) :-
    getOptionKeyword(Option, Keywords),
    string_lower(Message, LowerMessage),
    member(LowerMessage, Keywords), !.
getOptionByMessage([_|Resto], Message, Resultado) :-
    getOptionByMessage(Resto, Message, Resultado).

getChatbotAndFlowCodeLinksByMessage(Options, Message, _, _, NewCurrentFlowID, NewCurrentChatbotID) :-
    getOptionByMessage(Options, Message, Option),
    getChatbotAndFlowIDsByOption(Option, NewCurrentChatbotID, NewCurrentFlowID).
getChatbotAndFlowCodeLinksByMessage(_, _, CurrentFlowID, CurrentChatbotID, CurrentFlowID, CurrentChatbotID).

getOptionsMessages([], []).
getOptionsMessages([Option|Resto], [Message|Resultado]) :-
    getOptionMessage(Option, Message),
    getOptionsMessages(Resto, Resultado).

% ------------------------------ Pertenencias ----------------------------------

% Dominio: CodeList
% Descripcion: Verifica que los codes dentro de una lista sean unicos
% Tipo de algoritmo: Recursion de cola
% Recorrido: boolean
codeExist([]).
codeExist([Code|Resto]) :-
    not(member(Code, Resto)),
    codeExist(Resto).

% Dominio: OptionList
% Descripcion: Verifica que todas las Options de una lista sean distintas
% Tipo de algoritmo: N/A
% Recorrido: boolean
uniqueOptions(Options) :-
    getOptionsCodes(Options, OptionsCodes),
    codeExist(OptionsCodes).

% Dominio: OptionList X Option
% Descripcion: Verifica si una Option existe en una lista
% Tipo de algoritmo: N/A
% Recorrido: boolean
optionExist(Options, NewOption) :-
    getOptionsCodes(Options, OptionsCodes),
    getOptionCode(NewOption, NewOptionCode),
    not(member(NewOptionCode, OptionsCodes)).

% ------------------------------ Otros predicados ------------------------------

% Dominio: KeywordList X LowerKeywordList
% Descripcion: Transforma todas las Keywords a minusculas
% Tipo de algoritmo: Recursion de cola
% Recorrido: list
keywordsToLowerKeywords([], []).
keywordsToLowerKeywords([Keyword|Resto], [LowerKeyword|Resultado]) :-
    string_lower(Keyword, LowerKeyword),
    keywordsToLowerKeywords(Resto, Resultado).

optionToString([], "").
optionToString([Message|Resto], FinalMessage) :-
    optionToString(Resto, Final),
    string_concat(Message, "\n", MessageIntermedio),
    string_concat(MessageIntermedio, Final, FinalMessage).

% optionsToString(FlowOptions, OptionsString),
optionsToString(FlowOptions, OptionsStrings) :-
    getOptionsMessages(FlowOptions, OptionsMessages),
    optionToString(OptionsMessages, OptionsStrings).