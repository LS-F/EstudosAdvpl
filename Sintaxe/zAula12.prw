//Bibliotecas
#include "Totvs.ch"

/*/{Protheus.doc} zAula12
@Description Exibir total de fornecedore ativos e bloqueados
@Type		 Consulta
@Author 	 Luis
@Since  	 04/09/2023
/*/
User Function zAula12()
    Local aArea := GetArea()
    //Local cQuerySA2 := ""
    Local nTotal :=0
    Local nBloqueados :=0

    BeginSql Alias "QRY_SA2"
        Select
            A2_COD,
            A2_NOME,
            A2_MSBLQL
        From
            %table:SA2% SA2
        Where
            A2_FILIAL = %xFilial:SA2%
            And SA2.%NOTdEL%
        /*ORDER BY
             A2_COD ASC*/
    EndSql
    
    While ! QRY_SA2->(EoF())
        nTotal++

        If QRY_SA2->A2_MSBLQL =='1'
            nBloqueados++
        EndIf    

    EndDo
    
    MsgInfo("Total de Fornecedores Cadastrados: " + cValToChar(nTotal) + CRLF + "; Total de Fornecedores Bloqueados: " + cValToChar(nBloqueados),"Atenção")

    RestArea(aArea)
    
Return
