#include 'protheus.ch'
#include 'totvs.ch'

user function DoCase()
	
	Local cData := "25/12/2017"
	
	Do Case
	
	Case cData == "20/12/2017"
	Alert("N�o � Natal " + cData)
	
	Case cData == "25/12/2017"
	Alert("� NATAL!!")
	
	OtherWise
	MsgAlert("N�o sei qual dia � hoje !")
	
	EndCase
	
return
