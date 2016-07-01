classdef ImgGraf < handle   
    properties        
        valorFrobenius
        matriz
    end
    
    properties (Constant = true)
        VALOR_MAX = 255; % Valor m�ximo de cor de um pixel
    end
    
    methods
        % matriz: ja deve de estar normalizada
        function im = ImgGraf(matriz)
            im.matriz = matriz;
            im.valorFrobenius = im.frobenius;
        end
    end
    methods (Hidden = true, Access = private)        
        function saida = frobenius(im)
            saida = trace(im.matriz ^ 2) ^ .5;
        end
    end
end

