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
    Função BInclui - Inclusão
--------------------------------------*/
user Function BInclui(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxInclui(cAlias,nReg,nOpc)
        If nOpcao == 1
        MSGINFO("Inclusão efetuada com sucesso!")
        else
            MSGALERT("Inclusão Cancelada!")
        ENDIF
Return
/*--------------------------------------
    Função BAltera - Alteração
--------------------------------------*/
user Function BAltera(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxAltera(cAlias,nReg,nOpc)
        If nOpcao == 1
        MSGINFO("Alteração efetuada com sucesso!")
        else
            MSGALERT("Alteração Cancelada!")
        ENDIF
Return
/*--------------------------------------
    Função BDeleta - Exclusão
--------------------------------------*/
user Function BDeleta(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxDeleta(cAlias,nReg,nOpc)
        If nOpcao == 1
        MSGINFO("Exclusão Cancelada!")
        else
            MSGALERT("Exclusão efetuada com sucesso!")
        ENDIF
Return NIL
/*--------------------------------------
    Função BLegenda - Legenda
--------------------------------------*/
user function BLegenda()
    Local aLegenda := {}

    AADD(aLegenda,{"BR_VERDE"   ,"Pessoa Física"})
    AADD(aLegenda,{"BR_AMARELO" ,"Pessoa Jurídica"})
    AADD(aLegenda,{"BR_LARANJA" ,"Exportação"})
    AADD(aLegenda,{"BR_MARROM"  ,"Fornecedor Rural"})
    AADD(aLegenda,{"BR_PRETO"   ,"Não classificado"})

    BrwLegenda(cCadastro, "Legenda",aLegenda)

return
