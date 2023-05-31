#include 'protheus.ch'

user function bloco()
    
   // Local bBloco := {|| Alert("Olá, Mundo!")}
   //  EVAL(bBloco)

    //Passagem por parâmetros - bloco de códigos
    Local bBloco := {|cMsg| Alert(cMsg) }
        Eval(bBloco, "Olá, Mundo!")
return 
