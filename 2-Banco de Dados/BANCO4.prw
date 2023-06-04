#include 'protheus.ch'
#include 'totvs.ch'
#include 'TopConn.ch'

//CONSULTA DO BANCO DE DADOS
user function BANCO4()  
   
   Local aArea := SB1->(GetArea())

   DBSELECTAREA('SB1')
   SB1->(DBSETORDER(1))
   SB1->(DBGOTOP())

   //Inciar a transa��o.
   Begin Transaction 

        MSGINFO("A descri��o do produto ser� alterada!", "Aten��o")

        If SB1->(DbSeek(FWxFilial('SB1') + '00003'))
            RecLock('SB1', .F.) //Trava resgistro para altera��o
        Replace B1_DESC With "MONITOR DELL 42 POLEGADAS" 

            SB1->(MSUNLOCK())
        EndIf
        Alert("Altera��o efetuada com sucesso!", "Aten��o")

        End Transaction
        RestArea(aArea)

return
