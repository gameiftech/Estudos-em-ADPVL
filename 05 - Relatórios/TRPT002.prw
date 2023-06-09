#include 'protheus.ch'
#include 'totvs.ch'
#include 'TopConn.ch'

user function TRPT002()

	Local oReport := Nil
	Local cPerg := Padr("TRPT002",10)

	Pergunte(cPerg,.F.) //SX1
return

Static function RPTPrint(oReport)

	Local oSection1 := oReport:Section(1)
	Local oSection2 := oReport:Section(2)
	Local cQuery    := ""
	Local cNumCod   := ""

	cQuery := " SELECT A1_COD,A1_NOME,C5_NUM,C6_QTDVEN,C6_PRCVEN,B1_DESC "
	cQuery += " FROM SA1990 SA1, SC5990 SC5, SC6990 SC6, SB1990 SB1990 "
	cQuery += " WHERE SA1.D_E_L_E_T_ = '' AND C5_FILIAL = '' "
	cQuery += " AND SC5.D_E_L_E_T_ = ''"+MV_PAR01+ " AND C5_CLIENTE = A1_COD AND "
	cQuery += " C6_FILIAL = '' "+MV_PAR01+ " AND SC6.D_E_L_E_T_ = '' AND C5_NUM = C5_NUM AND "
	cQuery += " B1_FILIAL = '' "+MV_PAR01+ " AND SB1.D_E_L_E_T_ = '' AND B1_COD = C6_PRODUTO "
	cQuery += " ORDER BY A1_FILIAL, A1_COD,C5_FILIAL,C5_NUM,C6_FILIAL,C6_ITEM "

    //Verifica se a tabela ja esta aberta.
        If Select("TEMP") <> 0
            DbSelectArea("TEMP")
            DbCloseArea()
        ENDIF

        TCQUERY cQuery NEW Alias "TEMP"

        DbSelectArea("TEMP")
        TEMP->(DbGoTop())

        oReport:SetMeter(TEMP->(LastRec()))

        While !EOF()
            If oReport:Cancel()
            EXIT
        ENDIF
        oSection:Init()
        oReport:uncMeter()
            
        cNumCod := TEMP->A1_COD
        IncProc("Imprimindo Cliente "+ ALLTRIM(TEMP->A1_COD))

        //Imprimindo primeira seção 
        oSection1:cell("A1_COD"):SetValue(TEMP->A1_COD)
        oSection1:cell("A1_NOME"):SetValue(TEMP->A1_NOME)
        oSection1:Printline()

         //Imprimindo segunda seção 
        EndDO 

return
