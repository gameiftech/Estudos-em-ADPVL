#include 'protheus.ch'
#include 'totvs.ch'
#include 'TopConn.ch'

//CONSULTA DO BANCO DE DADOS
user function BANCO4()  
   
   Local aArea := SB1->(GetArea())

   DBSELECTAREA('SB1')
   SB1->(DBSETORDER(1))
   SB1->(DBGOTOP())

   //Inciar a transação.
   Begin Transaction 

        MSGINFO("A descrição do produto será alterada!", "Atenção")

        If SB1->(DbSeek(FWxFilial('SB1') + '00003'))
            RecLock('SB1', .F.) //Trava resgistro para alteração
        Replace B1_DESC With "MONITOR DELL 42 POLEGADAS" 

            SB1->(MSUNLOCK())
        EndIf
        Alert("Alteração efetuada com sucesso!", "Atenção")

        End Transaction
        RestArea(aArea)

return
