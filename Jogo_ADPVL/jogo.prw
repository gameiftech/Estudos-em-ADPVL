#include 'protheus.ch'

User Function adivinha()
    Local nNum := RANDOMIZE(1, 100)
    Local nChute := 0
    Local nTent := 0
  
    While nChute != nNum 
    nChute := Val(FWInputBox("Escolha um número de [1 - 100]", ""))
        If nChute == nNum
        MsgInfo("Você Acertou - <b>"+ cValToChar(nChute)+"</b><br>Você errou: "+cValToChar(nTent), "Fim de jogo")
        ElseIf nChute > nNum
            MsgAlert("Valor maior","Tente Novamente")
            nTent +=1
       Else
            MsgAlert("Valor Baixo","Tente Novamente")
            nTent +=1
    EndIf
    End
return 
