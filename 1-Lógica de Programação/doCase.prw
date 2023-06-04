#include 'protheus.ch'

user function docase()
    
    Local cData := "15/12/2023"

    Do Case 
    Case cData == "20/12/2023"
    Alert("Não é Natal "+ cData)

    Case cData == "25/12/2023"
    Alert("É Natal!!")

    OtherWise
    Alert("Não sei qual dia é hoje !")
    EndCase

return 
