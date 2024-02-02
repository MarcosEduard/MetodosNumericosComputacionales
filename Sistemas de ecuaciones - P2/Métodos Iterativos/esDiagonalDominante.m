function esDiagonalDominante = esDiagonalDominante(matriz)
    [filasA, columnasA] = size(matriz);
    
    esDiagonalDominante = true;
    
    for i = 1:filasA
        sumaNoDiagonal = sum(abs(matriz(i,:))) - abs(matriz(i,i));
        if abs(matriz(i,i)) <= sumaNoDiagonal
            esDiagonalDominante = false;
            break;
        end
    end
end