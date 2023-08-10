// Bibliotecas
#Include "TOTVS.ch"
#Include "Protheus.ch"


/*/{Protheus.doc} User Function nomeFunction
   Função de Teste no VSCode
    @type  Function
    @author Luis
    @since 12/04/2023
    @version version

    /*/
User Function zVS01()
    Local aArea := GetArea()
    Local cQUERY := ""

    cQuery += "SELECT" + CRLF
    cQuery += "    A2_COD," + CRLF
    cQuery += "    A2_LOJA," + CRLF
    cQuery += "    A2_NOME" + CRLF
    cQuery += "FROM" + CRLF
    cQuery += "    SA2990 SA2" + CRLF
    cQuery += "WHERE " + CRLF
    cQuery += "    A2_FILIAL = ''" + CRLF
    cQuery += "    AND A2_MSBLQL != '1'" + CRLF
    cQuery += "    AND SA2.D_E_L_E_T_ =' '" + CRLF
    cQuery += "ORDER BY " + CRLF
    cQuery += "    A2_NOME" + CRLF

    MsgInfo("Mensagem", "T�tulo")
   // Alert("VSCODE")
    
    RestArea(aArea)
Return 
