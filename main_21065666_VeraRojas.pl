:-include(tda_option_21065666_VeraRojas).
:-include(tda_flow_21065666_VeraRojas).
:-include(tda_chatbot_21065666_VeraRojas).

%#################################################################
%             Main
%#################################################################

/*
Predicados:
    option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, LowerKeywords]) (aridad = 6)
    flow(Id, NameMsg, Option, [Id, NameMsg, Option]) (aridad = 4)
    flowAddOption(Flow, Option, NewFlow) (aridad = 3)
    flowAddOption(Flow, Option, NewFlow) (aridad = 3)
    chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, Flows, [ChatbotID, Name, WelcomeMessage, StartFlowID, Flows]) (aridad = 6)
    chatbotAddFlow(Chatbot, Flow, NewChatbot) (aridad = 3)

Metas primarias:
    option, flow, flowAddOption, chatbot, chatbotAddFlow
Metas secuandarias:
    keywordsToLowerKeywords, uniqueOptions, getFlowOptions, optionExist, addOptionToOptions, setFlowOptions, uniqueFlows, getChatbotFlows, flowExist
    addFlowToFlows, setChatbotFlows
*/

% Dominio:
% Descripcion:
% Tipo de algoritmo:

% RF 2 - TDA Option - Constructor
% Dominio: int - string - int - int- list - Option
% Descripcion: Crea una Option
% Tipo de algoritmo: N/A
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, LowerKeywords]) :-
    keywordsToLowerKeywords(Keyword, LowerKeywords).


% RF 3 - TDA Flow - Constructor
% Dominio: int - string - OptionList - Flow
% Descripcion: Crea un Flow
% Tipo de algoritmo: N/A
flow(Id, NameMsg, Option, [Id, NameMsg, Option]) :-
    uniqueOptions(Option).


% RF 4 - TDA Flow - Modificador
% Dominio: Flow - Option - Flow
% Descripcion: Agrega una Option a un Flow
% Tipo de algoritmo: N/A
flowAddOption(Flow, Option, NewFlow) :-
    getFlowOptions(Flow, FlowOptions),
    optionExist(FlowOptions, Option),
    addOptionToOptions(FlowOptions, Option, NewFlowOptions),
    setFlowOptions(Flow, NewFlowOptions, NewFlow), !.
flowAddOption(Flow,_, Flow).


% RF 5 - TDA Chatbot - Constructor
% Dominio: int - string - string - int - FlowList - Chatbot
% Descripcion: Crea un Chatbot
% Tipo de algoritmo: N/A
chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, Flows, [ChatbotID, Name, WelcomeMessage, StartFlowID, Flows]) :-
    uniqueFlows(Flows).


% RF 6 - TDA Chatbot - Modificador
% Dominio: Chatbot - Flow - Chatbot
% Descripcion: Agrega un Flow a un Chatbot
% Tipo de algoritmo: Recursion de cola
chatbotAddFlow(Chatbot, Flow, NewChatbot) :-
    getChatbotFlows(Chatbot, ChatbotFlows),
    flowExist(ChatbotFlows, Flow),
    addFlowToFlows(ChatbotFlows, Flow, NewChatbotFlows),
    setChatbotFlows(Chatbot, NewChatbotFlows, NewChatbot), !.
chatbotAddFlow(Chatbot, _, Chatbot).

/*
set_prolog_flag(answer_write_options,[max_depth(0)]).
option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], O1), 
option(2, "2) Estudiar", 2, 1, ["aprender", "perfeccionarme"], O2), 
flow(1, "Flujo Principal Chatbot 1\nBienvenido\n¿Qué te gustaría hacer?", [O1], F10),
flowAddOption(F10, O2, F11),
chatbot(0, "Asistente", "Bienvenido\n¿Que te gustaria hacer?", 1, [], CB0),
chatbotAddFlow(CB0, F11, CB01).
*/
