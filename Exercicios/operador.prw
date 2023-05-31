#include 'protheus.ch'

user function operador ()

    Local nNum1 := 10
    Local nNum2 := 20

    //Operadores matématicos
    //Alert (nNum1 + nNum2)
    //Alert (nNum2 - nNum1)
    //Alert (nNum1 * nNum2)
    //Alert (nNum2 / nNum1)
    //Alert (nNum2 % nNum1)

    //Operador Relacionais
    Alert (nNum1 < nNum2)  //Comparação menor    
    Alert (nNum1 > nNum2)  //Comparação maior
    Alert (nNum1 = nNum2)  //Comparação igual
    Alert (nNum1 == nNum2) //Exatamente igual
    Alert (nNum1 <= nNum2) //Menor ou igual
    Alert (nNum1 >= nNum2) //Maior ou igual
    Alert (nNum1 != nNum2) //Diferente

    //Operadores de Atribuição
    nNum1 := 10    //Atribuição simples
    nNum1 += nNum2  //nNum1 = nNum1 + nNum2
    nNum2 -= nNum1  //nNum2 = nNum2 - nNum1
    nNum1 *= nNum2  //nNum1 = nNum1 * nNum2
    nNum2 /= nNum1  //nNum2 = nNum2 / nNum1
    nNum2 %= nNum1  //nNum2 = nNum2 % nNum1

return
