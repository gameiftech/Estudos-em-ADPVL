#include 'protheus.ch'
#include 'totvs.ch'
#include 'TopConn.ch'

//CONSULTA DO BANCO DE DADOS
user function BANCO3()  
    Local aArea := SB1->(GetArea())
    Local cQuery := ""
    Local aDados := {}

    cQuery := " SELECT "
    cQuery += " B1_COD AS CODIGO, "
    cQuery += " B1_DESC AS DESCRICAO "
    cQuery += " FROM "
    cQuery += " "+ RetSQLName("SB1")+ " SB1 "
    cQuery += " WHERE "
    cQuery += " B1_MSBLQL != '1' "

    //Execultando a consulta acima
    TCQuery cQuery New Alias "TMP"

    While ! TMP->(EoF())
        AADD(aDados, TMP->CODIGO)
        AADD(aDados, TMP->DESCRICAO)
        TMP->(DBSKIP())
    ENDDO

    Alert(Len(aDados))

        For nCount := 1 To Len(aDados)
            MsgInfo(aDados[nCount])
        Next nCount

        TMP->(DBCLOSEAREA())
        RestArea(aArea)

return
