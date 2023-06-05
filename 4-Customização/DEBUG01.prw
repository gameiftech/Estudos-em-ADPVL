#include 'protheus.ch'
#include 'totvs.ch'

user function DEBUG01()
    Local aArea := GetArea()
    Local aProduto := {}
    Local nCount := 0

        //Seleciona a tabela de produtos
       DBSELECTAREA("SB1")
       SB1->(DBSETORDER(1))
       SB1->(DBGOTOP())

       While ! SB1->(EoF) //Enquanto for final do arquivo
            AADD(aProduto, { SB1->B1_COD,;
                             SB1->B1_DESC})

        nCount++
        SB1->(DBSKIP())

        ENDDO

        MSGALERT("Quantidade de Produtos encontrada: <b>" + CVALTOCHAR(nCount))
        nCount := 0  //Zerando o valor da variavel nCount
        RestArea(aArea)
RETURN
