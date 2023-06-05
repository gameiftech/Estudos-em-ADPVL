#include 'Totvs.ch'
#include 'Protheus.ch'

user function MBRSA2()

    Local cAlias        := "SA2"
    Local aCores        := {}
    Local cFiltra       := "A2_FILIAL == '"+xFILIAL('SA2')+"' .AND. A2_EST == 'SP'"
    Private cCadastro   := "Cadastro de Fornecedor MBROWSE"
    Private aRotina     := {}
    Private aIndexSA2   := {}
    Private bFiltraBrw  := {|| FilBrowse(cAlias,@aIndexSA2,@cFiltra)}

    AADD(aRotina,{"Pesquisa"   ,"AxPesqui"     ,0,1})
    AADD(aRotina,{"Visualizar" ,"AxVisual"     ,0,2})
    AADD(aRotina,{"Incluir"    ,"U_BInclui"    ,0,3})
    AADD(aRotina,{"Alterar"    ,"U_BAltera"    ,0,4})
    AADD(aRotina,{"Excluir"    ,"U_BDeleta"    ,0,5})
    AADD(aRotina,{"Legenda"    ,"U_BLegenda"   ,0,6})

    //aCores - Legenda
    AADD(aCores,{"A2_TIPO == 'F'" ,"BR_VERDE"     })
    AADD(aCores,{"A2_TIPO == 'J'" ,"BR_AMARELO"   })
    AADD(aCores,{"A2_TIPO == 'X'" ,"BR_LARANJA"   })
    AADD(aCores,{"A2_TIPO == 'R'" ,"BR_MARROM"    })
    AADD(aCores,{"EMPTY(A2_TIPO)" ,"BR_PRETO"     })

    DBSELECTAREA(cAlias)
    DBSETORDER(1)

    Eval(bFiltraBrw)
    DBGOTOP()
    MBROWSE(6,1,22,75,cAlias,,,,,,aCores)
    
    EndFilBRW(cAlias,aIndexSA2)

return 
/*--------------------------------------
    Fun��o BInclui - Inclus�o
--------------------------------------*/
user Function BInclui(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxInclui(cAlias,nReg,nOpc)
        If nOpcao == 1
        MSGINFO("Inclus�o efetuada com sucesso!")
        else
            MSGALERT("Inclus�o Cancelada!")
        ENDIF
Return
/*--------------------------------------
    Fun��o BAltera - Altera��o
--------------------------------------*/
user Function BAltera(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxAltera(cAlias,nReg,nOpc)
        If nOpcao == 1
        MSGINFO("Altera��o efetuada com sucesso!")
        else
            MSGALERT("Altera��o Cancelada!")
        ENDIF
Return
/*--------------------------------------
    Fun��o BDeleta - Exclus�o
--------------------------------------*/
user Function BDeleta(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxDeleta(cAlias,nReg,nOpc)
        If nOpcao == 1
        MSGINFO("Exclus�o Cancelada!")
        else
            MSGALERT("Exclus�o efetuada com sucesso!")
        ENDIF
Return NIL
/*--------------------------------------
    Fun��o BLegenda - Legenda
--------------------------------------*/
user function BLegenda()
    Local aLegenda := {}

    AADD(aLegenda,{"BR_VERDE"   ,"Pessoa F�sica"})
    AADD(aLegenda,{"BR_AMARELO" ,"Pessoa Jur�dica"})
    AADD(aLegenda,{"BR_LARANJA" ,"Exporta��o"})
    AADD(aLegenda,{"BR_MARROM"  ,"Fornecedor Rural"})
    AADD(aLegenda,{"BR_PRETO"   ,"N�o classificado"})

    BrwLegenda(cCadastro, "Legenda",aLegenda)

return
