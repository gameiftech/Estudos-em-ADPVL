#include 'protheus.ch'

Static cStatic :=''
user function escopo1()

    //Varíaveis Locais
    Local nVar0 := 1
    Local nVar1 := 20

    //Varíaveis private
    Private cPri := 'private'

    //Varíaveis Public
    public _cPublic := 'RCTI'

    TestEscop(nVar0, @nVar1)

return 
//--------------função static-------------//

    Static Function TestEscop(nValor1, nValor2)

    Local _cPublic := 'Alterei'
    DEFAULT nValor1 := 0
    //alterando conteudo da variavel
    nValor2 := 10
    //Mostrar conteudo da variavel private
    Alert ("Private: "+ cPri)
    //Alterar valor da variavel public
    Alert ("Publica: "+ _cPublic)

    MSGALERT(nValor2)
    Alert ("Variavel Static: "+ cStatic)

    Return 
   
        

