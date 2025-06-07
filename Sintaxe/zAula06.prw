#include "Totvs.ch"
#INCLUDE 'TOPCONN.CH'
#include "Protheus.ch"
/*/{Protheus.doc} zAula06
Estudos Sql em Advpl - Terminal da Informação
@Type		 
@Author 	 Luis Silva
@Since  	 25/08/2023
/*/
User Function zAula06()
    Local aArea := GetArea()
	Local cQrySA2 := ""
    Local nAtual := 0
	
	//Selecionando os fornecedores via query diretamente no banco de dados
	cQrySA2 := " SELECT " + CRLF
    cQrySA2 += " A2_COD, " + CRLF
    cQrySA2 += " A2_NOME " + CRLF
	cQrySA2 +="FROM " + CRLF//RetSQLName("SA2 ") + "SA2" + CRLF
	cQrySA2 += "  " + RetSQLName('SA2') + " SA2 " + CRLF // Exibindo erro aqui
	cQrySA2 += " WHERE " + CRLF
	cQrySA2 += " D_E_L_E_T_ ='' " + CRLF

	//Executando a query
	PLSQuery(cQrySA2,"QRY_SA2")

    //Equanto houver dados na Query
    While !QRY_SA2->(EoF())
        nAtual++
        QRY_SA2->(DbSkip())
    EndDo
    QRY_SA2->(DbCloseArea())

    MsgInfo(cValToChar(nAtual) + " fornecedor(es) encontrado(s)!", "Atenção")

        
    RestArea(aArea)
    
Return
