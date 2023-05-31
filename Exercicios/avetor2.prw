#include 'protheus.ch'

user function avetor2()
    
    Local aVetor := {10,20,30}

    //AADD - Permite a inser��o de um item em um array ja existente
    AADD(aVetor, 40)
    Alert(Len(aVetor))

    //AINS - Permite a inser��o de um elemento em qualquer posi��o do array
    AINS(aVetor, 2)
    aVetor[2] := 200
    Alert(aVetor[2])
    Alert(Len(aVetor))

    //ACLONE - Realiza a c�pia de um Array para outro
    aVetor2 := AClone(aVetor)
       //For nCount := 1 To Len (aVetor2)
           Alert(aVetor2[nCount])
        //next nCount

        //Permite a exclus�o de um elemento do Array, tornando o ultimo valor NULL
        Adel(aVetor, 2)
        Alert(aVetor[3])
        Alert(Len(aVetor))

        //ASIZE - Redefine a estrutura de um Array pr�-existente, adicionando ou removendo itens
        Asize(aVetor, 2)
        Alert(Len(aVetor))
        aVetor := AClone(aVetor)
         //For nCount := 1 To Len(aVetor)
           Alert(aVetor[nCount])
      // next nCount

       //Len = Retorna a quantidade de elementos de um Array
return 
