#include 'protheus.ch'

user function bloco()
    
   // Local bBloco := {|| Alert("Ol�, Mundo!")}
   //  EVAL(bBloco)

    //Passagem por par�metros - bloco de c�digos
    Local bBloco := {|cMsg| Alert(cMsg) }
        Eval(bBloco, "Ol�, Mundo!")
return 
