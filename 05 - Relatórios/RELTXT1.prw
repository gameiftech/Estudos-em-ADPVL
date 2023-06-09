#include 'protheus.ch'
#include 'totvs.ch'

user function RELTXT1()
	
    If MsgYesNo("Esta função tem como objetivo gerar um arquivo TXT")
        Processa({||MntQry() },,"Processando...")
        MsAguarde({ || GeraArq()},,"O arquivo TXT está sendo gerado...")
    else
        Alert("Cancelada pelo usuário")
    EndIf

return Nil

//**Montar a query**//
Static function MntQry()

    Local cQuery := ""

    cQuery := " SELECT B1_FILIAL AS FILIAL, B1_COD AS CODIGO, "
    cQuery += " B1_DESC AS DESCRICAO "
    cQuery += " FROM SB1990 WHERE D_E_L_E_T_ = ''"

    cQuery := ChangeQuery(cQuery)
        DbUseArea(.T.,"TOPCONN", TCGENQRY(,,cQuery), 'TMP',.F.,.T.)

Return Nil

/**Função que gera o arquivo TXT**/
Static function GeraArq()

    Local cDir := "C:\TOTVS\Protheus\protheus_data\Treport\"
    Local cArq := "Arquivo2.txt"
    Local nHandle := FCreate(cDir+cArq)

    If nHandle < 0
        MsgAlert("Erro ao criar o arquivo", "ERRO")
    Else
        While TMP->(!EOF())

        FWrite(nHandle, TMP->(FILIAL) + " | " + TMP->(CODIGO) + " | " + TMP->(DESCRICAO) + CRLF)
        TMP->(DbSkip())

        EndDo
        
        FClose(nHandle)
    EndIf        

    If FILE("C:\TOTVS\Protheus\protheus_data\Treport\Arquivo2.txt")
        MsgInfo("Arquivo gerado com sucesso!")
    Else
        MsgAlert("Não foi possivel criar o arquivo", "ALERTA")
    EndIf
RETURN
