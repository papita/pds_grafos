clc
clear
format long g;
%parpool(4)
tic;
tam = 1000; percentagem_conhecida = .5; percentagem_treino = .1;
tam_con = tam * percentagem_conhecida;
tam_treino = tam * percentagem_treino;
sinal_grafo = carregar_grafo(tam);
S_con = zeros(1,tam); % Conhecidos
S_tre = zeros(1,tam); % Treino
%w.mostra_grafo

valores = zeros(1,tam);
for i=1:tam
    valores(i) = sinal_grafo.nos{i}.imagemAsociada.valorFrobenius;
    %S_conhecidas = 
end

e = 1; p = 1;% Elementos de treino
num_clas = tam/10; tam_classe_con = tam_con/10; tam_class_tre = tam_treino/10;
pos_conhecidas = zeros(1,tam_classe_con);
pos_treino = zeros(1,tam_class_tre);
for i=1:1
    pos_conhecidas(p : p + tam_classe_con - 1) = e : e + tam_classe_con - 1;
    pos_treino(p : p + tam_class_tre - 1) = e + tam_classe_con : e + tam_classe_con + tam_class_tre - 1;
    e = e + num_clas;
    %p = p + tam_classe_con;
end

% Etiquetas para os n�s conhecidos
for i=pos_conhecidas
    S_con(i) = 1;
end

% Etiquetas para os n�s de treino
for i=pos_treino
    S_tre(i) = -1;
end

filtro = Filtro(sinal_grafo.matrizAdjacencia, 15, S_con, S_tre');

%MSR = sqrt(sum((condicao - ones(tam,1)).^2));
% w.mostra_grafo
filtro.coeficientes;

toc;
%delete(gcp)
