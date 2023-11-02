
%#################################################################
%             TDA Option
%#################################################################
% Code X Message X ChatbotCodeLink X InitialFlowCodeLink X Keyword*

% Constructor
%El constructor queda definido en el archivo main


% Selectores
getOptionCode([Code, _, _, _, _], Code).


% dada una lista de options obtiene todos los CODES
getOptionsCodes([], []).
getOptionsCodes([Option|Resto], [Code|Resultado]) :-
    getOptionCode(Option, Code),
    getOptionsCodes(Resto, Resultado), !.


% Pertenencias

% verifica que dada una lista de optionCODES, no se repita el CODE de ninguna
codeExist([]).
codeExist([Code|Resto]) :-
    not(member(Code, Resto)),   % Code no está en el resto de la lista
    codeExist(Resto).

% Verifica si hay un code repetido en una lista de codes
uniqueOptions(Options) :-
    getOptionsCodes(Options, OptionsCodes),
    codeExist(OptionsCodes).

% Verifica si una option existe en una lista de options
optionExist(Options, NewOption) :-
    getOptionsCodes(Options, OptionsCodes),
    getOptionCode(NewOption, NewOptionCode),
    not(member(NewOptionCode, OptionsCodes)).

% Otros predicados

% keywordsToLowerKeywords(Keywords, NewKeywords)
keywordsToLowerKeywords([], []).
keywordsToLowerKeywords([Keyword|Resto], [LowerKeyword|Resultado]) :-
    string_lower(Keyword, LowerKeyword),
    keywordsToLowerKeywords(Resto, Resultado).
