#include 'protheus.ch'
#include 'totvs.ch'

user function A010TOK()
    Local lExecuta := .T.
    Local cTipo := ALLTRIM(M->B1_TIPO)
    Local cConta := ALLTRIM(M->B1_CONTA)

        If (cTipo = "PA" .AND. cConta = "001")
            Alert("A conta <b> "+ cConta + "<b> não pode estar "+ "associada a um produto do tipo <b>" + cTipo)

            lExecuta := .F.
            EndIf

RETURN(lExecuta)
