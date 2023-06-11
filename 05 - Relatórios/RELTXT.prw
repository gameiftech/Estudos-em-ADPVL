#include 'protheus.ch'
#include 'totvs.ch'

user function RELTXT()
	
    If MsgYesNo("Esta fun��o tem como objetivo gerar um arquivo TXT")
        GeraArq()
    else
        Alert("Cancelada pelo usu�rio")
    EndIf
return

/**Fun��o que gera o arquivo TXT**/
Static function GeraArq()

    Local cDir := "C:\TOTVS\Protheus\protheus_data\Treport\"
    Local cArq := "Arquivo1.txt"
    Local nHandle := FCreate(cDir+cArq)

    If nHandle < 0
        MsgAlert("Erro ao criar o arquivo", "ERRO")
    else
        For nLinha := 1 to 200
            FWrite(nHandle,"Gravando a linha " + StrZero(nLinha,3)+ CRLF)
        Next nLinha

        FClose(nHandle)
    EndIf        

    If FILE("C:\TOTVS\Protheus\protheus_data\Treport\Arquivo1.txt")
        MsgInfo("Arquivo gerado com sucesso!")
    Else
        MsgAlert("N�o foi possivel criar o arquivo", "ALERTA")
    EndIf
RETURN



