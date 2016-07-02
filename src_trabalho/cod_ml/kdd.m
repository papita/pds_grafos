function saida = kdd(matriz_com_imagens)
    NUMERO_CLASSES = 10;
    PIXEIS = 28;
    [~, num_elem] = size(matriz_com_imagens);
    conjunto_nos = cell(1, num_elem);
    for i=1:num_elem
        % Reagrupando as matrizes
        matriz_re = reshape(matriz_com_imagens(1:end, i), PIXEIS, PIXEIS);
        conjunto_nos{i} = Nos(matriz_re, floor((i-1)/NUMERO_CLASSES));
    end
    saida = conjunto_nos;
end