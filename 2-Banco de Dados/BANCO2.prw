#include 'protheus.ch'
#include 'totvs.ch'

user function BANCO2()
    Local aArea := SB1->(GetArea())
    Local cMsg := ''

    DBSELECTAREA("SB1")
    SB1->(DBSETORDER(1))
    SB1->(DBGOTOP())

    cMsg := Posicione('SB1',;
                        1,;
                         FWXFilial('SB1')+ '00002',; 
                         'B1_DESC')

    Alert("Descrição do Produto: " +cMsg, "AVISO")

    RestArea(aArea)

return
