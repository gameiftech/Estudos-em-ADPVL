#include 'protheus.ch'
#include 'totvs.ch'

user function BANCO002()
	Local aArea := SB1->(GetArea())
	Local cMsg := ''
	
	dbSelectArea("SB1")
	SB1->(dbSetOrder(1))
	SB1->(dbGoTop())
	
	cMsg := Posicione(	'SB1',;
						1,;
						FWXfilial('SB1')+ '00002',;
						'B1_DESC')
						
	Alert("Descri��o Produto: " +cMsg, "AVISO")
	
	RestArea(aArea)
return
