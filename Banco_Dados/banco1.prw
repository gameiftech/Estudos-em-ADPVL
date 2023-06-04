#include 'protheus.ch'
#include 'totvs.ch'

user function BANCO1()
    Local aArea := SB1->(GetArea())
    //Local cMsg := ""

    DbSelectArea("SB1")
    SB1->(DBSETORDER(1)) //Posiciona no indice 1
    SB1->(DbGoTop())
    
        //Posiciona o produto de código de código 00002
        If SB1->(dbSeek(FWXFilial("SB1")+ "00001"))
        Alert(SB1->B1_DESC)
    EndIf

    RestArea(aArea)
return

