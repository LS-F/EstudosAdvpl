#include "Totvs.ch"

/*/{Protheus.doc} zAula07
@Description Estudos SQL em Advpl
@Type		 
@Author 	Luis 
@Since  	 31/08/2023
/*/
User Function zAula07()
    Local aArea := GetArea()
    Local aAreaSB1 := SB1->(GetArea())
    Local nAtual := 0

    //Construindo consulta
   BeginSql Alias "QRY_SA2"
	SELECT
		A2_COD,
		A2_NOME
	FROM
		%table:SA2% SA2
	WHERE
	    A2_FILIAL = %xFilial:SA2%
	    AND A2_MSBLQL != '1'
	    AND SA2.%NOTdEL%
    EndSql

    //Enquanto houver dados na query
    While ! QRY_SA2->(EoF()) // EoF = Enquanto n�o for fim do arquivo
        nAtual++

          //La�o de repeti��o em outra tabela.
        SE2->(DbSeek(xFilial("SE2")))      
            While ! SE2->(EoF()) .And. SE2->E2_FORNECE == QRY_SA2->A2_COD
                Alert("Deu certo!")
                SE2->(DbSkip())
            
            EndDo

        QRY_SA2->(DbSkip())
    EndDo
    QRY_SA2->(DbCloseArea())

    MsgInfo(cValToChar(nAtual) + " fornecedor(es) encontrado(s)!", "Aten��o")

    BeginSql Alias "QRY_SB1"
        SELECT 
            B1_COD,
            B1_DESC
        FROM
            %table:SB1% SB1
        WHERE
            B1_FILIAL = %xFilial:SB1%
            AND B1_TIPO = 'MP'
            AND SB1.%NOTdEL%
    EndSql

    While ! QRY_SB1->(EoF())
        nAtual++
        QRY_SB1->(DbSkip())
    EndDO
    QRY_SB1->(DbCloseArea())

    MsgInfo(cValToChar(nAtual) + " produto(s) encontrado(s)!", "ATEN��O")


    RestArea(aAreaSB1)
    RestArea(aArea)
    
Return
