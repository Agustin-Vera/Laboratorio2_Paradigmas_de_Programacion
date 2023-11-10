:-include(main_21065666_VeraRojas).


/*
set_prolog_flag(answer_write_options,[max_depth(0)]),
option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], O1), 
option(2, "2) Estudiar", 2, 1, ["aprender", "perfeccionarme"], O2), 
flow(1, "Flujo Principal Chatbot 1\nBienvenido\n¿Qué te gustaría hacer?", [O1], F10),
flowAddOption(F10, O2, F11),
chatbot(0, "Asistente", "Bienvenido\n¿Que te gustaria hacer?", 1, [], CB0),
chatbotAddFlow(CB0, F11, CB01),
system("Chatbots Paradigmas", 0, [], S0),
systemAddChatbot(S0, CB01, S1),
systemAddUser(S1, "User1", S2),
systemLogin(S2, "USER1", S3),
systemLogout(S3, S4),
systemLogin(S4, "USER1", S5),
systemTalkRec(S5, "Hola", S6).
*/


% ------------------------------ Script de Pruebas Numero 1 --------------------

option(1, "1) Viajar", 2, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
option(3, "3) Comer", 2, 1, ["comer", "aprender"], OP3),
flow(1, "flujo1", [OP1, OP2], F10),
flowAddOption(F10, OP3, F11),
% flowAddOption(F10, OP2, F12), %si esto se descomenta, debe dar false, porque es opción con id duplicada.
chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), %solo añade una ocurrencia de F11
system("Chatbots Paradigmas", 0, [CB0], S0),
% systemAddChatbot(S0, CB0, S1), %si esto se descomenta, debe dar false, porque es chatbot id duplicado.
systemAddUser(S0, "user1", S2),
systemAddUser(S2, "user2", S3),
% systemAddUser(S3, "user2", S4), %si esto se descomenta, debe dar false, porque es username duplicado
systemAddUser(S3, "user3", S5),
% systemLogin(S5, "user8", S6), %si esto se descomenta, debe dar false ;user8 no existe.
systemLogin(S5, "user1", S7),
% systemLogin(S7, "user2", S8), %si esto se descomenta, debe dar false, ya hay usuario con login
systemLogout(S7, S9),
systemLogin(S9, "user2", S10).
