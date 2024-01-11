:-include(tda_option).
:-include(tda_flow).
:-include(tda_chatbot).
:-include(tda_system).
:-include(tda_user).
:-include(tda_chathistory).

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
    systemAddUser(System, User, NewSystem) (aridad = 3)
    systemLogin(System, User, NewSystem) (aridad = 3)
    systemLogout(System, NewSystem) (aridad = 2)
    systemTalkRec(System, Message, NewSystem) (aridad = 3)

Metas primarias:
    option, flow, flowAddOption, chatbot, chatbotAddFlow, system, systemAddChatbot, systemAddUser, systemLogin, systemLogout,systemTalkRec, systemSynthesis

Metas secuandarias:
    keywordsToLowerKeywords, uniqueOptions, getFlowOptions, optionExist, addOptionToOptions, setFlowOptions, uniqueFlows, getChatbotFlows, flowExist,
    addFlowToFlows, setChatbotFlows, uniqueChatbots, getStartFlowIDByInitialChatbots, getSystemChatbots, chatbotExist, getSystemInitialChatbotCodeLink,
    addChatbotToChatbots, setSystemStartFlowID, setSystemChatbots, getSystemUsers, userExist, user, getSystemChatHistorys, chatHistory, addUserToUsers,
    addChatHistoryToChatHistorys, setSystemUsers, setSystemChatHistorys, usersLogged, changeUsersStatus, getUserLogged, getUserName, getSystemCurrentFlowID,
    getSystemCurrentChatbotID, getChatbotByID, getFlowByID, getChatbotAndFlowCodeLinksByMessage, makeNewInteraction, makeNewInteraction, changeChathistorys,
    setSystemChathistorysAndCurrentFlowAndChatbotIDs, getHistoryByUsername, getChathistoryHistory
*/

% RF 2 - TDA Option - Constructor
% Dominio: int X string X int X int X List(String) X Option
% Descripcion: Crea una Option
% Tipo de algoritmo: N/A
% Recorrido: Option
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, LowerKeywords]) :-
    keywordsToLowerKeywords(Keyword, LowerKeywords).

% RF 3 - TDA Flow - Constructor
% Dominio: int X string X List(Option) X Flow
% Descripcion: Crea un Flow
% Tipo de algoritmo: N/A
% Recorrido: Flow
flow(Id, NameMsg, Option, [Id, NameMsg, Option]) :-
    uniqueOptions(Option).

% RF 4 - TDA Flow - Modificador
% Dominio: Flow X Option X Flow
% Descripcion: Agrega una Option a un Flow
% Tipo de algoritmo: N/A
% Recorrido: Flow
flowAddOption(Flow, Option, NewFlow) :-
    getFlowOptions(Flow, FlowOptions),
    optionExist(FlowOptions, Option),
    addOptionToOptions(FlowOptions, Option, NewFlowOptions),
    setFlowOptions(Flow, NewFlowOptions, NewFlow), !.

% RF 5 - TDA Chatbot - Constructor
% Dominio: int X string X string X int X List(Flow) X Chatbot
% Descripcion: Crea un Chatbot
% Tipo de algoritmo: N/A
% Recorrido: Chatbot
chatbot(ChatbotID, Name, WelcomeMessage, StartFlowID, Flows, [ChatbotID, Name, WelcomeMessage, StartFlowID, Flows]) :-
    uniqueFlows(Flows).

% RF 6 - TDA Chatbot - Modificador
% Dominio: Chatbot X Flow X Chatbot
% Descripcion: Agrega un Flow a un Chatbot
% Tipo de algoritmo: Recursion de cola
% Recorrido: Chatbot
chatbotAddFlow(Chatbot, Flow, NewChatbot) :-
    getChatbotFlows(Chatbot, ChatbotFlows),
    flowExist(ChatbotFlows, Flow),
    addFlowToFlows(ChatbotFlows, Flow, NewChatbotFlows),
    setChatbotFlows(Chatbot, NewChatbotFlows, NewChatbot), !.

% RF 7 - TDA System - Constructor
% Dominio: String X int X List(Chatbot) X System
% Descripcion: Crea un System
% Tipo de algoritmo: N/A
% Recorrido: System
system(Name, InitialChatbotCodeLink, Chatbots, [Name, InitialChatbotCodeLink, Chatbots, [], [], InitialChatbotCodeLink, InitialFlowID, Time]) :-
    uniqueChatbots(Chatbots),
    getStartFlowIDByInitialChatbots(Chatbots, InitialChatbotCodeLink, [], InitialFlowID),
    get_time(TimeStamp),
    number_string(TimeStamp, Time).

% RF 8 - TDA System - Modificador
% Dominio: System X Chatbot X System
% Descripcion: Agrega un Chatbot a un System
% Tipo de algoritmo: N/A
% Recorrido: System
systemAddChatbot(System, Chatbot, NewSystem) :-
    getSystemChatbots(System, SystemChatbots),
    chatbotExist(SystemChatbots, Chatbot),
    getSystemInitialChatbotCodeLink(System, InitialChatbotCodeLink),
    getSystemCurrentFlowID(System, CurrentFlowID),
    getStartFlowIDByInitialChatbots([Chatbot], InitialChatbotCodeLink, CurrentFlowID, InitialFlowID),
    addChatbotToChatbots(SystemChatbots, Chatbot, NewSystemChatbots),
    setSystemStartFlowID(System, InitialFlowID, NewSystemWithStartFlowID),
    setSystemChatbots(NewSystemWithStartFlowID, NewSystemChatbots, NewSystem), !.

% RF 9 - TDA System - Modificador
% Dominio: System X String X System
% Descripcion: Agrega un User a un System
% Tipo de algoritmo: N/A
% Recorrido: System
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

% RF 10 - TDA System
% Dominio: System X String X System
% Descripcion: Inicia la sesion de un User dentro de un System
% Tipo de algoritmo: N/A
% Recorrido: System
systemLogin(System, User, NewSystem) :-
    getSystemUsers(System, SystemUsers),
    userExist(SystemUsers, User),
    not(usersLogged(SystemUsers)),
    changeUsersStatus(SystemUsers, User, 1, NewSystemUsers),
    setSystemUsers(System, NewSystemUsers, NewSystem), !.

%RF 11 - TDA System
% Dominio: System X System
% Descripcion: Cierra la sesion de un User dentro de un System
% Tipo de algoritmo: N/A
% Recorrido: System
systemLogout(System, NewSystem) :-
    getSystemUsers(System, SystemUsers),
    usersLogged(SystemUsers),
    getUserLogged(SystemUsers, LoggedUser),
    getUserName(LoggedUser, LoggedUsername),
    changeUsersStatus(SystemUsers, LoggedUsername, 0, NewSystemUsers),
    setSystemUsers(System, NewSystemUsers, NewSystem), !.

% RF 12 - TDA System
% Dominio: System X Message X System
% Descripcion: Permite al User interactuar con un Chatbot
% Tipo de algoritmo: N/A
% Recorrido: System
systemTalkRec(System, Message, NewSystem) :-
    getSystemUsers(System, SystemUsers),
    usersLogged(SystemUsers),
    getSystemCurrentFlowID(System, CurrentFlowID),
    getSystemCurrentChatbotID(System, CurrentChatbotID),
    getSystemChatbots(System, SystemChatbots),
    getChatbotByID(SystemChatbots, CurrentChatbotID, CurrentChatbot),
    getChatbotFlows(CurrentChatbot, CurrentChatbotFlows),
    getFlowByID(CurrentChatbotFlows, CurrentFlowID, CurrentFlow),
    getUserLogged(SystemUsers, User),
    getFlowOptions(CurrentFlow, CurrentFlowOptions),
    getChatbotAndFlowCodeLinksByMessage(CurrentFlowOptions, Message, CurrentFlowID, CurrentChatbotID, NewCurrentFlowID, NewCurrentChatbotID),
    getChatbotByID(SystemChatbots, NewCurrentChatbotID, NewCurrentChatbot),
    getChatbotFlows(NewCurrentChatbot, NewCurrentChatbotFlows),
    getFlowByID(NewCurrentChatbotFlows, NewCurrentFlowID, NewCurrentFlow),
    makeNewInteraction(NewCurrentChatbot, NewCurrentFlow, User, Message, NewInteraction),
    getSystemChatHistorys(System, SystemChatHistorys),
    changeChathistorys(SystemChatHistorys, User, NewInteraction, NewSystemChatHistorys),
    setSystemChathistorysAndCurrentFlowAndChatbotIDs(System, NewCurrentFlowID, NewCurrentChatbotID, NewSystemChatHistorys, NewSystem), !.

% RF 13 - TDA System 
% Dominio: System X User X String
% Descripcion: Obtiene el Historial de interacciones de un usuario y el sistema
% Tipo de algoritmo: N/A
% Recorrido: String
systemSynthesis(System, User, History) :-
    getSystemChatHistorys(System, SystemChatHistorys),
    getHistoryByUsername(SystemChatHistorys, User, ChatHistory),
    getChathistoryHistory(ChatHistory, History).