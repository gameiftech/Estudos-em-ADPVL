#include 'protheus.ch'

user function docase()
    
    Local cData := "15/12/2023"

    Do Case 
    Case cData == "20/12/2023"
    Alert("N�o � Natal "+ cData)

    Case cData == "25/12/2023"
    Alert("� Natal!!")

    OtherWise
    Alert("N�o sei qual dia � hoje !")
    EndCase

return 
