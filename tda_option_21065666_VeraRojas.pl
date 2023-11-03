%#################################################################
%             TDA Option
%#################################################################
% Code X Message X ChatbotCodeLink X InitialFlowCodeLink X Keyword*

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


%#################################################################
%             Selectores
%#################################################################

% Dominio: Option - int
% Descripcion: Obtiene el Code de la Option
% Tipo de algoritmo:
getOptionCode([Code, _, _, _, _], Code).

% Dominio: OptionList - CodeList
% Descripcion: Obtiene todos los Codes de una lista de Options
% Tipo de algoritmo:
getOptionsCodes([], []).
getOptionsCodes([Option|Resto], [Code|Resultado]) :-
    getOptionCode(Option, Code),
    getOptionsCodes(Resto, Resultado), !.

%#################################################################
%             Pertenencias
%#################################################################

% Dominio: CodeList
% Descripcion: Verifica que los codes dentro de una lista sean unicos
% Tipo de algoritmo:
codeExist([]).
codeExist([Code|Resto]) :-
    not(member(Code, Resto)),
    codeExist(Resto).

% Dominio: OptionList
% Descripcion: Verifica que todas las Options de una lista sean distintas
% Tipo de algoritmo:
uniqueOptions(Options) :-
    getOptionsCodes(Options, OptionsCodes),
    codeExist(OptionsCodes).

% Dominio: OptionList - Option
% Descripcion: Verifica si una Option existe en una lista
% Tipo de algoritmo:
optionExist(Options, NewOption) :-
    getOptionsCodes(Options, OptionsCodes),
    getOptionCode(NewOption, NewOptionCode),
    not(member(NewOptionCode, OptionsCodes)).

%#################################################################
%             Otros Predicados
%#################################################################

% Dominio: KeywordList - LowerKeywordList
% Descripcion: Transforma todas las Keywords a minusculas
% Tipo de algoritmo:
keywordsToLowerKeywords([], []).
keywordsToLowerKeywords([Keyword|Resto], [LowerKeyword|Resultado]) :-
    string_lower(Keyword, LowerKeyword),
    keywordsToLowerKeywords(Resto, Resultado).