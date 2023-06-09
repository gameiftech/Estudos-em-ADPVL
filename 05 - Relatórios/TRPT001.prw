#include 'protheus.ch'
#include 'totvs.ch'
#include 'TopConn.ch'

user function TRPT001()

	Local oReport
	Local cAlias := getNextAlias()

	oReport := RptStruc(cAlias)
	oReport:printDialog() //Tela de impressão

return

Static function RPrint(oReport, cAlias)

	Local oSecao1:= oReport:Section(1)

	BeginSQL Alias cAlias

            SELECT
            B1_FILIAL FILIAL, B1_COD CODIGO, B1_DESC DESCRICAO, B1_TIPO TIPO, B1_ATIVO B1_ATIVO
                FROM %Table:SB1% SB1
                WHERE B1_FILIAL = '' AND B1_MSBLQL <> '1' AND D_E_L_E_T_ = ''
            GROUP BY B1_FILIAL, B1_COD, B1_DESC, B1_TIPO, B1_ATIVO

	EndSQL

	oSecao1:EndQuery()
	oReport:SetMeter((cAlias)->(RecCount()))
	oSecao1:Print()
return

Static function RptStruc(cAlias)

	Local cTitulo   := "Produtos Ativos"
	Local cHelp     := "Permite imprimir relatório de produtos"
	Local oReport
	Local oSection1

	//Instanciando a classe TReport
	oReport := TReport():New('TRPT001', cTitulo,/**/,{|oReport|RPrint(oReport,cAlias)},cHelp)

	//Seção
	oSection1 := TRSection():New(oReport, "Produtos", {"SB1"})

	TRCell():New(oSection1, "FILIAL","SB1","Filial")
	TRCell():New(oSection1, "CODIGO","SB1","Codigo")
	TRCell():New(oSection1, "DESCRICAO","SB1","Descricao")
	TRCell():New(oSection1, "TIPO","SB1","Tipo")
	TRCell():New(oSection1, "ATIVO","SB1","Ativo")

return(oReport)
