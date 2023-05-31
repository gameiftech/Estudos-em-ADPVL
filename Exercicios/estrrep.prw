#include 'protheus.ch'

user function estrrep()
    
 //   Local nCount
  //  Local nNum := 0

  //  For nCount := 0 to 10 step 2

    //    nNum += nCount

  //  Next
   // Alert("Valor: "+ CVALTOCHAR(nNum))


    //Exemplo do comando while enddo
   // Local nNum1 := 0
   // Local nNum2 := 10

  //  While nNum1 < nNum2     
   //     nNum1++     
  //  EndDo
  //  Alert(nNum1 + nNum2)

//Exemplo do coamando while enddo Composto
    Local nNum1 := 1
    Local cNome := "Game"

    While nNum1 != 10 .AND. cNome != "Protheus"
        nNum1++
        if nNum1 == 5
            cNome := "Protheus"
            EndIf
    EndDo
    Alert("Numero: "+CVALTOCHAR(nNum1))
    Alert("Nome: "+ CVALTOCHAR(cNome))
return 
