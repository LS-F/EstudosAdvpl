#include "Totvs.ch"

/*/{Protheus.doc} zAula07
@Description Estudos SQL em Advpl
@Type		 
@Author 	Luis 
@Since  	 31/08/2023
/*/
User Function zAula07()
    Local aArea := GetArea()
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
	    AND SA.2%NOTdEL%
    EndSql

    //Enquanto houver dados na query
    While ! QRY_SA2->(EoF()) // EoF = Enquanto n�o for fim do arquivo
        nAtual++

        QRY_SA2->(DbSkip())
    EndDo
    QRY_SA2->(DbCloseArea())

    MsgInfo(cValToChar(nAtual) + "fornecedor(es) encontrado(s)!", "Aten��o")

    RestArea(aArea)
    
Return
