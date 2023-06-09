#include 'protheus.ch'
#include 'totvs.ch'

/**
	TIPO DE DADOS

NUMÉRICO: 3 / 21.000 / 0.4 / 200000
LÓGICO: .T. / .F.
CARACTERE: "D" / 'C'
DATA: DATE()
ARRAY: {"VALO1", "VALOR2", "VALOR3"}
BLOCO DE CÓDIGO: {||VALOR := 1,MsgAlert("Valor é igual a "+cValToChar(VALOR))}

**/

user function VARIAVEL()
	Local nNum := 66
	Local lLogic := .T.
	Local cCarac := "String"
	Local dData := DATE()
	Local aArray := {"Joao", "Maria","Jose"}
	Local bBloco := {|| nValor := 2, MsgAlert("O numero é: "+ cValToChar(nValor))}
	
	Alert(nNum)
	Alert(lLogic)
	Alert(cValToChar(cCarac))
	Alert(dData)
	Alert(aArray[1])
	Eval(bBloco)
	
	
return
