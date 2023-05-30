#include 'protheus.ch'

user function variavel()
	local nNum := 66
	local lLogic := .T.
	local cCarac := "String"
	Local dData := date ()
	Local aArray := {"João","Maria", "José"}
	Local bBloco := {|| nValor :=2, MSGALERT("O número é: "+ CVALTOCHAR(nValor))}

	Alert (nNum)
	Alert (lLogic)
	Alert (CVALTOCHAR(cCarac))
	Alert (dData)
	Alert (aArray[1])
	Eval (bBloco)
return
