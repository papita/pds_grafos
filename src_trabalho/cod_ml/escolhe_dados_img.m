function img_ordenada_por_digito = escolhe_dados_img(num_amostras)
    % Carregando as imagens e as etiquetas
    imagens = loadMNISTImages('train-images.idx3-ubyte');
    etiquetas = loadMNISTLabels('train-labels.idx1-ubyte');    
    tamanho_dados = length(etiquetas);
    posicoes = zeros(1,tamanho_dados);
    cont_pos = 1;
    for digitos = 0:9
        for i = 1:tamanho_dados
            if etiquetas(i) == digitos
                posicoes(cont_pos) = i;
                cont_pos = cont_pos + 1;
            end
        end
    end

    % Retornando as imagens ordenadas por digitos
    img_ordenada_por_digito = zeros(size(imagens));
    cont_pos = 1;
    for posicao = posicoes
        img_ordenada_por_digito(1:end, cont_pos) = imagens(1:end, posicao);
        cont_pos = cont_pos + 1;
    end
    
    % Imagens por numero de amostra
    [qnt_amostras, ~] = hist(etiquetas,unique(etiquetas));
    pos_selec = zeros(1, num_amostras);
    NUMERO_CLASSES = 10;
    num_clas = num_amostras / NUMERO_CLASSES;
    inicio = 1;
    e = 1; % elemento para encontrar a posi��o
    for i = 1:NUMERO_CLASSES
       pos_selec(e : e + num_clas - 1) = inicio : inicio + num_clas - 1;
       inicio = inicio + qnt_amostras(i);
       e = e + num_clas;
    end
    img_ordenada_por_digito = img_ordenada_por_digito(1:end, pos_selec);
end