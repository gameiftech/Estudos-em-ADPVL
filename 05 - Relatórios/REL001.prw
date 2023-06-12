#Include "Totvs.ch"
#Include "Protheus.ch"

User Function REL001()
	Local aArea := FWGetArea()
	Local oReport
	Local aPergs   := {}
	Local xPar0 := Date()
	Local xPar1 := Date()
	
	//Adicionando os parametros do ParamBox
	aAdd(aPergs, {1, "Data inicial", xPar0,  "", ".T.", "", ".T.", 80,  .F.})
	aAdd(aPergs, {1, "Data Final", xPar1,  "", ".T.", "", ".T.", 80,  .T.})
	
	//Se a pergunta for confirma, cria as definicoes do relatorio
	If ParamBox(aPergs, "Informe os parametros")
		oReport := fReportDef()
		oReport:PrintDialog()
	EndIf
	
	FWRestArea(aArea)
Return

Static Function fReportDef()
	Local oReport
	Local oSection := Nil
	
	//Criacao do componente de impressao
	oReport := TReport():New( "RelMes",;
		"Relatório de periodo",;
		,;
		{|oReport| fRepPrint(oReport),};
		)
	oReport:SetTotalInLine(.F.)
	oReport:lParamPage := .F.
	oReport:oPage:SetPaperSize(9)
	
	//Orientacao do Relatorio
	oReport:SetPortrait()
	
	//Criando a secao de dados
	oSection := TRSection():New( oReport,;
		"Dados",;
		{"QRY_REP"})
	oSection:SetTotalInLine(.F.)
	
	//Colunas do relatorio
	TRCell():New(oSection, "B2_COD", "QRY_REP", "CODIGO", "@!", 20, /*lPixel*/, /*{|| code-block de impressao }*/, "LEFT", /*lLineBreak*/, "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/, /*nClrBack*/, /*nClrFore*/, .F.)
	TRCell():New(oSection, "B1_DESC", "QRY_REP", "DESCRIÇÃO", "@!", 40, /*lPixel*/, /*{|| code-block de impressao }*/, "LEFT", /*lLineBreak*/, "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/, /*nClrBack*/, /*nClrFore*/, .F.)
	TRCell():New(oSection, "B2_LOCAL", "QRY_REP", "LOCAL", "@!", 20, /*lPixel*/, /*{|| code-block de impressao }*/, "LEFT", /*lLineBreak*/, "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/, /*nClrBack*/, /*nClrFore*/, .F.)
	TRCell():New(oSection, "B2_LOCALIZ", "QRY_REP", "ENDEREÇO", "@!", 20, /*lPixel*/, /*{|| code-block de impressao }*/, "LEFT", /*lLineBreak*/, "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/, /*nClrBack*/, /*nClrFore*/, .F.)
	TRCell():New(oSection, "B2_QATU", "QRY_REP", "QUANTIDADE", "@!", 10, /*lPixel*/, /*{|| code-block de impressao }*/, "LEFT", /*lLineBreak*/, "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/, /*nClrBack*/, /*nClrFore*/, .F.)
	
Return oReport

Static Function fRepPrint(oReport)
	Local aArea    := FWGetArea()
	Local cQryReport  := ""
	Local oSectDad := Nil
	Local nAtual   := 0
	Local nTotal   := 0
	
	
	//Pegando as secoes do relatorio
	oSectDad := oReport:Section(1)
	
	//Montando consulta de dados
	cQryReport += " SELECT TOP 100 * FROM " + RETSQLNAME("SB2")+ " SB2 "		+ CRLF
	cQryReport += " INNER JOIN " + RETSQLNAME("SB1") + " SB1 ON B1_COD = B2_COD AND B1_FILIAL = B2_FILIAL" + CRLF
	cQryReport += " WHERE SB2.D_E_L_E_T_ = ' ' AND "	
	cQryReport += " SB1.D_E_L_E_T_ = ' ' AND "
	cQryReport += " B1_FILIAL = '" + xFilial("SB1") +  "' AND " 	+ CRLF
	cQryReport += " B2_FILIAL = '" + Xfilial("SB2") + "'"	+ CRLF
	cQryReport += " ORDER BY B2_COD,B2_DESC, B2_LOCAL, B2_LOCALIZ, B2_QATU "		+ CRLF

	//Executando consulta e setando o total da regua	
	PlsQuery(cQryReport, "QRY_REP")
	DbSelectArea("QRY_REP")
	Count to nTotal
	oReport:SetMeter(nTotal)
	
	//Enquanto houver dados
	oSectDad:Init()
	QRY_REP->(DbGoTop())
	While ! QRY_REP->(Eof())
	
		//Incrementando a regua
		nAtual++
		oReport:SetMsgPrint("Imprimindo registro " + cValToChar(nAtual) + " de " + cValToChar(nTotal) + "...")
		oReport:IncMeter()
		
		//Imprimindo a linha atual
		oSectDad:PrintLine()
		
		QRY_REP->(DbSkip())
	EndDo
	oSectDad:Finish()
	QRY_REP->(DbCloseArea())
	
	FWRestArea(aArea)
Return
