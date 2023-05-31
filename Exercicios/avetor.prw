#include 'protheus.ch'

user function avetor()
    
    //Arrays: são coleções de valores, semelhantes a uma lista
    //Cada item em um arrau é referencia pela indicação de sua posiçao numerica

    Local dData := Date()
    Local aValores := {"Protheus",dData,100}

    Alert(aValores[1]) //Exibe a posição 1 do array
    Alert(aValores[2]) //Exibe a posição 2 do array
    Alert(aValores[3]) //Exibe a posição 3 do array
return 
