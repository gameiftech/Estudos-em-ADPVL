#include 'protheus.ch'
#include 'totvs.ch'

user function BANCO004()
	
	Local aArea := SB1->(GetArea())
	
	DbSelectArea('SB1')
	Sb1->(DbSetOrder(1))
	Sb1->(DbGoTop())
	
	// Iniciar a transação.
	Begin Transaction
	
		MsgInfo("A descrição do produto será alterada!", "Atenção")
		
	If SB1->(DbSeek(FWxFilial('SB1') + '00003'))
		RecLock('SB1', .F.) //Trava registro para alteração
	Replace B1_DESC With "MONITOR LG 32 POLEGADAS"
	
		SB1->(MsUnlock())
	EndIf
		MsgAlert("Alteração efetuada!", "Atenção")
	//	DisarmTransaction()
	End Transaction
	RestArea(aArea)
	
return
