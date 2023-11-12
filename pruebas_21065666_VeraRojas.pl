:-include(main_21065666_VeraRojas).



% En el archivo leeme.txt se deja un comentario sobre los RF12 y RF13
% Los requerimientos NO implementados se dejaran comentados en las consultas.


% ------------------------------ Script de Pruebas Numero 1 --------------------
/*

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
flow(1, "flujo1", [OP1], F10),
flowAddOption(F10, OP2, F11),
% flowAddOption(F10, OP1, F12), %si esto se descomenta, debe dar false, porque es opción con id duplicada.
chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), %solo añade una ocurrencia de F11
%Chatbot1
option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3),
option(2, "2) París, Francia", 1, 1, ["Paris", "Eiffel"], OP4),
option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5),
option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6),
%Opciones segundo flujo Chatbot1
option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7),
option(2, "2) Museos", 1, 2, ["Museo"], OP8),
option(3, "3) Ningún otro atractivo", 1, 3, ["Museo"], OP9),
option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10),
option(1, "1) Solo", 1, 3, ["Solo"], OP11),
option(2, "2) En pareja", 1, 3, ["Pareja"], OP12),
option(3, "3) En familia", 1, 3, ["Familia"], OP13),
option(4, "4) Agregar más atractivos", 1, 2, ["Volver", "Atractivos"], OP14),
option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15),
flow(1, "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?", [OP3, OP4, OP5, OP6], F20),
flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [OP7, OP8, OP9, OP10], F21),
flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [OP11, OP12, OP13, OP14, OP15], F22),
chatbot(1, "Agencia Viajes",  "Bienvenido\n¿Dónde quieres viajar?", 1, [F20, F21, F22], CB1),
%Chatbot2
option(1, "1) Carrera Técnica", 2, 1, ["Técnica"], OP16),
option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17),
option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18),
flow(1, "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?", [OP16, OP17, OP18], F30),
chatbot(2, "Orientador Académico",  "Bienvenido\n¿Qué te gustaría estudiar?", 1, [F30], CB2),
system("Chatbots Paradigmas", 0, [CB0], S0),
% systemAddChatbot(S0, CB0, S1), %si esto se descomenta, debe dar false, porque es chatbot id duplicado.
systemAddChatbot(S0, CB1, S01),
systemAddChatbot(S01, CB2, S02),
systemAddUser(S02, "user1", S2),
systemAddUser(S2, "user2", S3),
% systemAddUser(S3, "user2", S4), %si esto se descomenta, debe dar false, porque es username duplicado
systemAddUser(S3, "user3", S5),
% systemLogin(S5, "user8", S6), %si esto se descomenta, debe dar false ;user8 no existe.
systemLogin(S5, "user1", S7),
% systemLogin(S7, "user2", S8), %si esto se descomenta, debe dar false, ya hay usuario con login
systemLogout(S7, S9),
systemLogin(S9, "user2", S10),
systemTalkRec(S10, "hola", S11),
systemTalkRec(S11, "1", S12),
systemTalkRec(S12, "1", S13),
systemTalkRec(S13, "Museo", S14),
systemTalkRec(S14, "1", S15),
systemTalkRec(S15, "3", S16),
systemTalkRec(S16, "5", S17),
systemSynthesis(S17, "user2", Str1),
% systemSimulate(S02, 5, 32131, S99), %Se deja comentado debido a que no se realizo el requerimiento
write(Str1).

*/

% ------------------------------ Ejemplos Propios ------------------------------

% ------------------------------ RF2 option ------------------------------------
/*
% Deberia encontrar respuesta

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3).

*/

% ------------------------------ RF3 flow --------------------------------------
/*
% Deberia encontrar respuesta

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3).

% Deberia ser False
% Se agrega una Option repetida (OP1F2CB3) a un Flow (flow 1 respectivamente)

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3, OP1F2CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3).

*/

% ------------------------------ RF4 flowAddOption -----------------------------
/*
% Deberia encontrar respuesta

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [], F3CB30), flowAddOption(F3CB30, OP1F3CB3, F3CB31), flowAddOption(F3CB31, OP2F3CB3, F3CB32), flowAddOption(F3CB32, OP3F3CB3, F3CB33).

% Deberia ser False
% Se agrega una Option ya existente (OP1F3CB3) en un Flow (F3CB31 respectivamente)

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [], F3CB30), flowAddOption(F3CB30, OP1F3CB3, F3CB31), flowAddOption(F3CB31, OP1F3CB3, F3CB32). 

*/

% ------------------------------ RF5 chatbot -----------------------------------
/*
% Deberia encontrar respuesta

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [], CB30), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3], CB31), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB32).

% Deberia ser False 
% Se intenta agregar un Flow repetido (F2CB3) en CB30

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3, F2CB3], CB30).

*/

% ------------------------------ RF6 chatbotAddFlow ----------------------------
/*
% Deberia encontrar respuesta

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [], CB30), chatbotAddFlow(CB30, F1CB3, CB31), chatbotAddFlow(CB31, F2CB3, CB32), chatbotAddFlow(CB32, F3CB3, CB33).

% Deberia ser False 
% Se intenta agregar un Flow repetido (F1CB3) a un Chatbot (CB31 respectivamente)

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [], CB30), chatbotAddFlow(CB30, F1CB3, CB31), chatbotAddFlow(CB31, F1CB3, CB32).

*/

% ------------------------------ RF7 system ------------------------------------
/*
% Deberia encontrar respuesta

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB30), system("Chatbot de Prueba", 0, [], S0), system("Chatbot de Prueba", 0, [CB30], S01).

% Deberia ser False 
% Se intenta agregar un Chatbot repetido (CB30) a un System (S0 respectivamente)

option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB30), system("Chatbot de Prueba", 0, [CB30, CB30], S0).

*/

% ------------------------------ RF8 systemAddChatbot --------------------------
/*
% Deberia encontrar respuesta

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), flow(1, "flujo1", [OP1], F10), flowAddOption(F10, OP2, F11), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB30), system("Chatbot de Prueba", 0, [], S0), systemAddChatbot(S0, CB0, S1), systemAddChatbot(S1, CB30, S2).

% Deberia ser False 
% Se intenta agregar un Chatbot repetido (CB0) a un System (S1 respectivamente)

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), flow(1, "flujo1", [OP1], F10), flowAddOption(F10, OP2, F11), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB30), system("Chatbot de Prueba", 0, [], S0), systemAddChatbot(S0, CB0, S1), systemAddChatbot(S1, CB0, S2).

*/

% ------------------------------ RF9 systemAddUser -----------------------------
/*
% Deberia encontrar respuesta

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), flow(1, "flujo1", [OP1], F10), flowAddOption(F10, OP2, F11), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB30), system("Chatbot de Prueba", 0, [CB0, CB30], S0), systemAddUser(S0, "Gareth Bale", S1), systemAddUser(S1, "Leo Messi", S2), systemAddUser(S2, "Aaron Paul", S3).

% Deberia ser False 
% Se intenta agregar un User repetido (Lionel Messi) a un System (S3 respectivamente) (Case insensitive)

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), flow(1, "flujo1", [OP1], F10), flowAddOption(F10, OP2, F11), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB30), system("Chatbot de Prueba", 0, [CB0, CB30], S0), systemAddUser(S0, "Gareth Bale", S1), systemAddUser(S1, "Lionel Messi", S2), systemAddUser(S2, "Aaron Paul", S3), systemAddUser(S3, "LIONEL MESSI", S4).

*/

% ------------------------------ RF10 systemLogin ------------------------------
/*
% Deberia encontrar respuesta

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), flow(1, "flujo1", [OP1], F10), flowAddOption(F10, OP2, F11), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB30), system("Chatbot de Prueba", 0, [CB0, CB30], S0), systemAddUser(S0, "Gareth Bale", S1), systemAddUser(S1, "Lionel Messi", S2), systemAddUser(S2, "Aaron Paul", S3), systemLogin(S3, "AARON Paul", S4).

% Deberia ser False 
% Se intenta iniciar un User (Lionel Messi) cuando un User ya esta iniciado (Aaron Paul)

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), flow(1, "flujo1", [OP1], F10), flowAddOption(F10, OP2, F11), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB30), system("Chatbot de Prueba", 0, [CB0, CB30], S0), systemAddUser(S0, "Gareth Bale", S1), systemAddUser(S1, "Lionel Messi", S2), systemAddUser(S2, "Aaron Paul", S3), systemLogin(S3, "AARON Paul", S4), systemLogin(S4, "Lionel Messi", S5).

*/

% ------------------------------ RF11 systemLogout -----------------------------
/*
% Deberia encontrar respuesta

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), flow(1, "flujo1", [OP1], F10), flowAddOption(F10, OP2, F11), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB30), system("Chatbot de Prueba", 0, [CB0, CB30], S0), systemAddUser(S0, "Gareth Bale", S1), systemAddUser(S1, "Lionel Messi", S2), systemAddUser(S2, "Aaron Paul", S3), systemLogin(S3, "AARON Paul", S4), systemLogout(S4, S5).

% Deberia ser False 
% Se intenta cerrar la sesion de un usuario iniciado pero no hay ningun usuario iniciado en el sistema (S3)

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), flow(1, "flujo1", [OP1], F10), flowAddOption(F10, OP2, F11), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB30), system("Chatbot de Prueba", 0, [CB0, CB30], S0), systemAddUser(S0, "Gareth Bale", S1), systemAddUser(S1, "Lionel Messi", S2), systemAddUser(S2, "Aaron Paul", S3), systemLogout(S3, S4).

*/

% De aqui en adeltante las consultas vienen en varias lineas, osea, una consulta esta en varias lineas. 

%---------- RF12 systemTalkRec y RF13 systemSynthesis---------------------------
/*
% Deberia encontrar respuesta

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), flow(1, "flujo1", [OP1, OP2, OP3F1CB0], F10), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F10], CB0), 
%Chatbot1
option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3), option(2, "2) París, Francia", 1, 1, ["Paris", "Eiffel"], OP4), option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5), option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6), 
%Opciones segundo flujo Chatbot1
option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7), option(2, "2) Museos", 1, 2, ["Museo"], OP8), option(3, "3) Ningún otro atractivo", 1, 3, ["Museo"], OP9), option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10), option(1, "1) Solo", 1, 3, ["Solo"], OP11), option(2, "2) En pareja", 1, 3, ["Pareja"], OP12), option(3, "3) En familia", 1, 3, ["Familia"], OP13), option(4, "4) Agregar más atractivos", 1, 2, ["Volver", "Atractivos"], OP14), option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15), flow(1, "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?", [OP3, OP4, OP5, OP6], F20), flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [OP7, OP8, OP9, OP10], F21), flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [OP11, OP12, OP13, OP14, OP15], F22), chatbot(1, "Agencia Viajes",  "Bienvenido\n¿Dónde quieres viajar?", 1, [F20, F21, F22], CB1), 
%Chatbot2
option(1, "1) Carrera Técnica", 2, 1, ["Técnica"], OP16), option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17), option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18), flow(1, "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?", [OP16, OP17, OP18], F30), chatbot(2, "Orientador Académico",  "Bienvenido\n¿Qué te gustaría estudiar?", 1, [F30], CB2), 
%Chatbot 3
option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB3), 
%System
system("Chatbots Paradigmas", 0, [CB0, CB1, CB2, CB3], S0), systemAddUser(S0, "Gareth Bale", S1), systemAddUser(S1, "Lionel Messi", S2), systemAddUser(S2, "Aaron Paul", S3), systemLogin(S3, "Lionel Messi", S4), systemTalkRec(S4, "Buenos días", S5), systemTalkRec(S5, "Diversion", S6), systemTalkRec(S6, "2", S7), systemTalkRec(S7, "2", S8), systemTalkRec(S8, "3", S9), systemSynthesis(S9, "Lionel Messi", HistorialMessi), write(HistorialMessi).

% Deberia encontrar respuesta
% Se reduce la consulta anterior y sigue funcionando

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), flow(1, "flujo1", [OP1, OP2, OP3F1CB0], F10), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F10], CB0), 
%Chatbot 3
option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB3),
%System
system("Chatbots Paradigmas", 0, [CB0, CB3], S0), systemAddUser(S0, "Lionel Messi", S1), systemLogin(S1, "Lionel Messi", S2), systemTalkRec(S2, "Buenos días", S3), systemTalkRec(S3, "Diversion", S4), systemTalkRec(S4, "2", S5), systemTalkRec(S5, "2", S6), systemTalkRec(S6, "3", S7), systemSynthesis(S7, "Lionel Messi", HistorialMessi), write(HistorialMessi).

% Deberia ser False 
% Se realizan interacciones sin ningun usuario iniciado en el sistema (S0)

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), flow(1, "flujo1", [OP1, OP2, OP3F1CB0], F10), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F10], CB0), 
%Chatbot 3
option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB3),
%System
system("Chatbots Paradigmas", 0, [CB0, CB3], S0), systemAddUser(S0, "Lionel Messi", S1), systemTalkRec(S1, "Buenos días", S2), systemTalkRec(S2, "Diversion", S3), systemTalkRec(S3, "2", S4), systemTalkRec(S4, "2", S5), systemTalkRec(S5, "3", S6), systemSynthesis(S6, "Lionel Messi", HistorialMessi), write(HistorialMessi).

% Deberia ser False 
% Se busca la Synthesis de un usuario no existente

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1), option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2), option(3, "3) Entretenerme", 3, 1, ["Diversion", "entretencion"], OP3F1CB0), flow(1, "flujo1", [OP1, OP2, OP3F1CB0], F10), chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F10], CB0), 
%Chatbot 3
option(1, "1) Peliculas", 3, 2, ["pelicula"], OP1F1CB3), option(2, "2) Futbol", 3, 3, ["Futbol", "football"], OP2F1CB3), option(1, "1) Avengers: Endgame", 3, 2, ["marvel"], OP1F2CB3), option(2, "2) Meet Joe Black", 3, 2, ["Brad Pitt", "Claire Forlani"], OP2F2CB3), option(1, "1) Manchester City vs Inter de Milan", 3, 3, ["Champions", "Europa"], OP1F3CB3), option(2, "2) Universidad de Chile vs Liga de Quito", 3, 3, ["Sudamericana"], OP2F3CB3), option(3, "3) Deseo ver otra cosa", 3, 1, [], OP3F3CB3), flow(1, "Flujo 1 Chatbot 3\n¿Qué te gustaría ver?", [OP1F1CB3, OP2F1CB3], F1CB3), flow(2, "Flujo 2 Chatbot 3\n¿Qué película te gustaría ver?", [OP1F2CB3, OP2F2CB3], F2CB3), flow(3, "Flujo 3 Chatbot 3\n¿Qué partido te gustaría ver?", [OP1F3CB3, OP2F3CB3, OP3F3CB3], F3CB3), chatbot(3, "Agencia de Entretencion", "Bienvenido\n¿Qué te gustaría ver?", 1, [F1CB3, F2CB3, F3CB3], CB3),
%System
system("Chatbots Paradigmas", 0, [CB0, CB3], S0), systemAddUser(S0, "Lionel Messi", S1), systemLogin(S1, "Lionel Messi", S2), systemTalkRec(S2, "Buenos días", S3), systemTalkRec(S3, "Diversion", S4), systemTalkRec(S4, "2", S5), systemTalkRec(S5, "2", S6), systemTalkRec(S6, "3", S7), systemSynthesis(S7, "Cristiano Ronaldo", HistorialRonaldo), write(HistorialRonaldo).

*/