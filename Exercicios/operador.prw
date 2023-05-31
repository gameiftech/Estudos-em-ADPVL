#include 'protheus.ch'

user function operador ()

    Local nNum1 := 10
    Local nNum2 := 20

    //Operadores mat�maticos
    //Alert (nNum1 + nNum2)
    //Alert (nNum2 - nNum1)
    //Alert (nNum1 * nNum2)
    //Alert (nNum2 / nNum1)
    //Alert (nNum2 % nNum1)

    //Operador Relacionais
    Alert (nNum1 < nNum2)  //Compara��o menor    
    Alert (nNum1 > nNum2)  //Compara��o maior
    Alert (nNum1 = nNum2)  //Compara��o igual
    Alert (nNum1 == nNum2) //Exatamente igual
    Alert (nNum1 <= nNum2) //Menor ou igual
    Alert (nNum1 >= nNum2) //Maior ou igual
    Alert (nNum1 != nNum2) //Diferente

    //Operadores de Atribui��o
    nNum1 := 10    //Atribui��o simples
    nNum1 += nNum2  //nNum1 = nNum1 + nNum2
    nNum2 -= nNum1  //nNum2 = nNum2 - nNum1
    nNum1 *= nNum2  //nNum1 = nNum1 * nNum2
    nNum2 /= nNum1  //nNum2 = nNum2 / nNum1
    nNum2 %= nNum1  //nNum2 = nNum2 % nNum1

return
