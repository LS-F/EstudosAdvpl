#INCLUDE "Protheus.ch"
#include "Totvs.ch"
#include "Topconn.ch"

/*/{Protheus.doc} SDBAUT
@Description Cria saldo por endereço conforme parametros preenchidos
@Type		 
@Author 	 Luis.Silva
@Since  	 31/08/2025
/*/
User Function SDBAUT()
    Local aPergs   := {}
	Local cCodProd := Space(TAMSX3("B1_COD")[1])
	Local cArmaz   := Space(TAMSX3("NNR_CODIGO")[1])
    Local lRet     := .T.

    FWAlertWarning("Para executar essa rotina, o produto deve estar com o controle de endereço habilitado no sistema!","Atenção!")
    While lRet
        aadd(aPergs, {1, "Produto"                , cCodProd  , "@!"         , "", "SB1", "", 100, .F.})
        aadd(aPergs, {1, "No armazém"             ,  cArmaz   , "@!"         , "", "NNR", "", 40, .F.})
        
        if ParamBox(aPergs,"Criar saldo por endereço em massa ")
            cCodProd := MV_PAR01
            cArmaz   := MV_PAR02
            Processa({|| fGeraSDB(cCodProd,cArmaz)}, "Executando rotina...")
            
        endif
        if FWAlertYesNo("Executar rotina novamente?", "Confirma?")
            lRet := .T.
            aPergs := {}
        else
            lRet := .F.
        endif
    Enddo
Return

/*/{Protheus.doc} fGeraSDB
@Description Gera registro na SDB
@Type		 
@Author 	 Luis.Silva
@Since  	 31/08/2025
/*/
Static Function fGeraSDB(cCodProd,cArmaz)
    Local cQuery   := ""
    Local cAlias   := GetNextAlias()
    Local nTamanho := TAMSX3("DB_ITEM")[1]
    Local nAtual   := 0
    Local nTotal   := 0
    Local lRet     := .F.

    NNR->(DbSetOrder(1))
    SBE->(DbSetOrder(1))
    SBF->(DbSetOrder(2))
    SDB->(DbSetOrder(1))

    cQuery += " SELECT COUNT(B1_COD) AS QTDITENS FROM " +RetSqlName("SB1")+" SB1 ," +RetSqlName("SB2")+" SB2 (NOLOCK) "
    cQuery += " WHERE SB2.D_E_L_E_T_ ='' "
    cQuery += " AND SB1.D_E_L_E_T_ = '' "
    cQuery += " AND SB1.B1_FILIAL = '"+xFilial("SB1")+"'"
    cQuery += " AND B1_LOCALIZ ='S' "
    cQuery += " AND B1_RASTRO IN ('N','') "
    //cQuery += " AND B1_TIPO ='BN'"
    if !Empty(cCodProd) 
        cQuery += " AND B1_COD = '"+cCodProd+"'"
    endif
    cQuery += " AND SB2.B2_FILIAL = '"+xFilial("SB2")+"'"
    cQuery += " AND B2_COD = B1_COD "
    cQuery += " AND B2_QATU > 0 "
    if !Empty(cArmaz)
        cQuery += " AND B2_LOCAL = '"+cArmaz+"'"
    endif
    cQuery:= ChangeQuery(cQuery)
    cAlias:= MPSysOpenQuery(cQuery)
    
    if !(cAlias)->(Eof()) .and. (cAlias)->QTDITENS > 0
        nTotal := (cAlias)->QTDITENS
        ProcRegua(nTotal)
    else
        FWAlertWarning("Não foram encontrados registros para os dados informados nos parâmetros!","Atenção!")
        Return
    endIf

   If FWAlertYesNo("Foram encontrados "+cValToChar(nTotal)+" registros."+CRLF+"Deseja continuar?","Atenção!")
        cQuery := " SELECT B1_COD,B1_RASTRO, B1_LOCALIZ,B2_LOCAL, B2_QATU FROM " +RetSqlName("SB1")+" SB1 ," +RetSqlName("SB2")+" SB2 (NOLOCK) "
        cQuery += " WHERE SB2.D_E_L_E_T_ ='' "
        cQuery += " AND SB1.D_E_L_E_T_ = '' "
        cQuery += " AND SB1.B1_FILIAL = '"+xFilial("SB1")+"'"
        cQuery += " AND B1_LOCALIZ ='S' "
        cQuery += " AND B1_RASTRO IN ('N','') "
        //cQuery += " AND B1_TIPO ='BN'"
        if !Empty(cCodProd) 
            cQuery += " AND B1_COD = '"+cCodProd+"'"
        endif
        cQuery += " AND SB2.B2_FILIAL = '"+xFilial("SB2")+"'"
        cQuery += " AND B2_COD = B1_COD "
        cQuery += " AND B2_QATU > 0 "
        if !Empty(cArmaz)
            cQuery += " AND B2_LOCAL = '"+cArmaz+"'"
        endif
        cQuery += " ORDER BY SB2.B2_LOCAL, SB1.B1_COD 

        cQuery:= ChangeQuery(cQuery)
        cAlias:= MPSysOpenQuery(cQuery)

            While !(cAlias)->(Eof()) 
                lRet := .T.
                nAtual++
                IncProc("Processando registro " + cValToChar(nAtual) + " de " + cValToChar(nTotal) + "...")

                if NNR->(DbSeek(xFilial("NNR")+(cAlias)->B2_LOCAL)) 
                    if !SBE->(DbSeek(xFilial("SBE")+(cAlias)->B2_LOCAL+"REALOCAR"))
                        RecLock("SBE",.T.)
                            SBE->BE_FILIAL      := xFilial("SBE")
                            SBE->BE_LOCAL   := (cAlias)->B2_LOCAL
                            SBE->BE_LOCALIZ := "REALOCAR"
                            SBE->BE_DESCRIC := "SALDO A SER REALOCADO NO ARMZ"
                            SBE->BE_DATGER  := Date()
                        MsUnlock()
                    endif
                else
                    FWAlertWarning("O armazém: "+(cAlias)->B2_LOCAL+" informado para o produto: "+(cAlias)->B2_COD+", não possui cadastro na rotina de Armazéns","Atenção!")
                    (cAlias)->(DbSkip())
                    loop
                endif
                    

                if SBF->(DbSeek(xFilial("SBF")+(cAlias)->B1_COD+(cAlias)->B2_LOCAL))
                    (cAlias)->(DbSkip())
                    loop
                else
                    RecLock('SDB',.T.)
                        SDB->DB_FILIAL    := xFilial("SDB")
                        SDB->DB_ITEM      := PadL(nAtual, nTamanho, '0')
                        SDB->DB_PRODUTO   := (cAlias)->B1_COD 
                        SDB->DB_LOCAL     := (cAlias)->B2_LOCAL
                        SDB->DB_LOCALIZ   := "REALOCAR" 
                        SDB->DB_DOC       := "SDBAUT001" 
                        SDB->DB_TM        := "499"
                        SDB->DB_ORIGEM    := "ACE"
                        SDB->DB_QUANT     := (cAlias)->B2_QATU
                        SDB->DB_DATA      := Date()
                        SDB->DB_NUMSEQ    := "SDBAUT"
                        SDB->DB_TIPO      := "M"
                        SDB->DB_SERVIC    := "499"
                        SDB->DB_ATIVID       := "ZZZ" 
                        SDB->DB_HRINI        := Time() 
                        SDB->DB_ATUEST    := "S" 
                        SDB->DB_STATUS    := "M"

                    MsUnlock()
                    (cAlias)->(DbSkip())
                endIf
            EndDo
        (cAlias)->(DbCloseArea())

        if lRet
            FWAlertSuccess("Saldos criados nos endereços, necessário executar a rotina padrão 'Refaz Saldos'", "Atenção!")
        endif
    else
            FWAlertWarning("Operação cancelada pelo usuário.","Atenção!")
    endif

Return 
