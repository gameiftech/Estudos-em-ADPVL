#include 'protheus.ch'
#include 'totvs.ch'

user function BANCO5()  
   
    Local aArea := GetArea()
    Local aDados := {}
    Private lMErroAuto := .F.

    //Adicionando dados no vetor para teste de inclusão na tabela SB1
    aDados := {;
                {"B1_COD", "00005",          Nil},;
                {"B1_DESC", "NOTEBOOK HP",   Nil},;
                {"B1_TIPO", "PA",            Nil},;
                {"B1_UM", "PC",              Nil},;
                {"B1_LOCPAD", "01",          Nil},;
                {"B1_PICM", "0",             Nil},;
                {"B1_IPI", "0",              Nil},;
                {"B1_CONTRAT", "N",          Nil},;
                {"B1_LOCALIZ", "N",          Nil};
                }

    //Inicio do controle de transação             
    Begin Transaction
        //Chama cadastro de produto
    MSExecAuto({|x,y|MATA010(x,y)},aDados,3)

    //Caso ocorra algum erro
    If lMErroAuto
        Alert("Ocorreram erros durante a operação")
    MostraErro()

    DisarmTransaction()
    else
        MsgInfo("Operação Finalizada!", "Aviso")
    ENDIF
    End Transaction

    RestArea(aArea)

return
