#include 'protheus.ch'

user function variavel()

	Local nNum := 66
	Local lLogic := .T.
	Local cCarac := "String"
	Local dData := date ()
	Local aArray := {"Totvs","Protheus", "Games"}
	//Local dBloco := {|| nValor :=2, MsgAlert("O número é: "+ cValToChar(nValor))}

	Alert (nNum)
	Alert (lLogic)
	Alert (CVALTOCHAR(cCarac))
	Alert (dData)
	Alert (aArray[1])
	Eval (dBloco)

return
