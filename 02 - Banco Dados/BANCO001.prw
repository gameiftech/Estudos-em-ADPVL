#include 'protheus.ch'
#include 'totvs.ch'

user function BANCO001()
	Local aArea := SB1->(GetArea())
	
	DbSelectArea("SB1")
	SB1->(DbSetOrder(1)) //Posiciona no indice 1
	SB1->(DbGoTop())
	
	// posiciona o produto de c�digo 000002
	If SB1->(dbSeek(FWXFilial("SB1")+ "00001"))
	 Alert(SB1->B1_DESC)
	
	EndIf
	
	RestArea(aArea)
	
return
