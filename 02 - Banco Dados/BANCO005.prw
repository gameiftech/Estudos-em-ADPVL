#include 'protheus.ch'
#include 'parmtype.ch'

user function BANCO005()
	
	Local aArea := GetArea()
	Local aDados := {}
	Private lMSErroAuto := .F.
	
	// Adionando dados no vetor para teste de inclusão na tabela SB1
	aDados := {;
			   	{"B1_COD",	"00006",				 Nil},;
			   	{"B1_DESC",	"CONTROLE XBOX 360",     Nil},;
			   	{"B1_TIPO",	"PA", 					 Nil},;
			   	{"B1_UM", "PC", 					 Nil},;
			   	{"B1_LOCPAD", 	"04", 				 Nil},;
			   	{"B1_PICM", 	0, 					 Nil},;
			   	{"B1_IPI", 0, 						 Nil},;
			   	{"B1_CONTRAT", "N", 				 Nil},;
			   	{"B1_LOCALIZ", "S", 				 Nil};
			   }
	
	//inicio do controle de transação
	Begin Transaction
		//chama cadastro de produto
	MSExecAuto({|x,y|Mata010(x,y)},aDados,3)
	
	//Caso ocorra algum erro
		If lMSErroAuto
			Alert("Ocorreram erros durante a operação!")
			MostraErro()
			
			DisarmTransaction()
		Else
			MsgInfo("Operação finalizada!", "Aviso")
		EndIf
		End Transaction
		
		RestArea(aArea)
	
return
