:-include(tda_option_21065666_VeraRojas).
:-include(tda_flow_21065666_VeraRojas).
:-include(tda_chatbot_21065666_VeraRojas).
:-include(tda_system_21065666_VeraRojas).
:-include(tda_user_21065666_VeraRojas).
:-include(tda_chathistory_21065666_VeraRojas).

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
    system(Name, InitialChatbotCodeLink, Chatbots, [Name, InitialChatbotCodeLink, Chatbots, [], [], InitialChatbotCodeLink, InitialFlowID, Time]) (aridad = 4)
    systemAddChatbot(System, Chatbot, NewSystem) (aridad = 3)

Metas primarias:
    option, flow, flowAddOption, chatbot, chatbotAddFlow, system, systemAddChatbot
Metas secuandarias:
    keywordsToLowerKeywords, uniqueOptions, getFlowOptions, optionExist, addOptionToOptions, setFlowOptions, uniqueFlows, getChatbotFlows, flowExist,
    addFlowToFlows, setChatbotFlows, uniqueChatbots, getStartFlowIDByInitialChatbots, getSystemChatbots, chatbotExist, getSystemInitialChatbotCodeLink,
    addChatbotToChatbots, setSystemStartFlowID, setSystemChatbots
*/

% Dominio:
% Descripcion:
% Tipo de algoritmo:
% Recorrido: 

% RF 2 - TDA Option - Constructor
% Dominio: int - string - int - int- list - Option
% Descripcion: Crea una Option
% Tipo de algoritmo: N/A
% Recorrido: Option
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, LowerKeywords]) :-
    keywordsToLowerKeywords(Keyword, LowerKeywords).

% RF 3 - TDA Flow - Constructor
% Dominio: int - string - OptionList - Flow
% Descripcion: Crea un Flow
% Tipo de algoritmo: N/A
% Recorrido: Flow
flow(Id, NameMsg, Option, [Id, NameMsg, Option]) :-
    uniqueOptions(Option).

% RF 4 - TDA Flow - Modificador
% Dominio: Flow - Option - Flow
% Descripcion: Agrega una Option a un Flow
% Tipo de algoritmo: N/A
% Recorrido: Flow
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
% Recorrido: Chatbot
chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, Flows, [ChatbotID, Name, WelcomeMessage, StartFlowID, Flows]) :-
    uniqueFlows(Flows).

% RF 6 - TDA Chatbot - Modificador
% Dominio: Chatbot - Flow - Chatbot
% Descripcion: Agrega un Flow a un Chatbot
% Tipo de algoritmo: Recursion de cola
% Recorrido: Chatbot
chatbotAddFlow(Chatbot, Flow, NewChatbot) :-
    getChatbotFlows(Chatbot, ChatbotFlows),
    flowExist(ChatbotFlows, Flow),
    addFlowToFlows(ChatbotFlows, Flow, NewChatbotFlows),
    setChatbotFlows(Chatbot, NewChatbotFlows, NewChatbot), !.
chatbotAddFlow(Chatbot, _, Chatbot).

% RF 7 - TDA System - Constructor
% Dominio: String - int - ChatbotList - System
% Descripcion: Crea un System
% Tipo de algoritmo: N/A
% Recorrido: System
system(Name, InitialChatbotCodeLink, Chatbots, [Name, InitialChatbotCodeLink, Chatbots, [], [], InitialChatbotCodeLink, InitialFlowID, Time]) :-
    uniqueChatbots(Chatbots),
    getStartFlowIDByInitialChatbots(Chatbots, InitialChatbotCodeLink, InitialFlowID),
    get_time(TimeStamp),
    number_string(TimeStamp, Time).

% RF 8 - TDA System - Modificador
% Dominio: System - Chatbot - System
% Descripcion: Agrega un Chatbot a un System
% Tipo de algoritmo: N/A
% Recorrido: System
systemAddChatbot(System, Chatbot, NewSystem) :-
    getSystemChatbots(System, SystemChatbots),
    chatbotExist(SystemChatbots, Chatbot),
    getSystemInitialChatbotCodeLink(System, InitialChatbotCodeLink),
    getStartFlowIDByInitialChatbots([Chatbot], InitialChatbotCodeLink, InitialFlowID),
    addChatbotToChatbots(SystemChatbots, Chatbot, NewSystemChatbots),
    setSystemStartFlowID(System, InitialFlowID, NewSystemWithStartFlowID),
    setSystemChatbots(NewSystemWithStartFlowID, NewSystemChatbots, NewSystem), !.
systemAddChatbot(System, _, System).


% RF 9 - TDA System - Modificador
systemAddUser(System, User, NewSystem) :-
    getSystemUsers(System, SystemUsers),
    not(userExist(SystemUsers, User)),
    user(User, 0, NewUser),
    getSystemChatHistorys(System, SystemChatHistorys),
    chatHistory(User, "", NewChatHistory),
    addUserToUsers(SystemUsers, NewUser, NewUsers),
    addChatHistoryToChatHistorys(SystemChatHistorys, NewChatHistory, NewChatHistorys),
    setSystemUsers(System, NewUsers, NewSystemUsers),
    setSystemChatHistorys(NewSystemUsers, NewChatHistorys, NewSystem), !.
systemAddUser(System, _, System).

% RF 10 - TDA System
systemLogin(System, User, NewSystem) :-
    getSystemUsers(System, SystemUsers),
    userExist(SystemUsers, User),
    not(usersLogged(SystemUsers)),
    changeUsersStatus(SystemUsers, User, 1, NewSystemUsers),
    setSystemUsers(System, NewSystemUsers, NewSystem), !.
systemLogin(System, _, System).
