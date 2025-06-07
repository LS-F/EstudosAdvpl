#Include "PROTHEUS.CH"
#Include "TOTVS.CH"
#Include "TOPCONN.CH"
//--------------------------------------------------------------
/*/{Protheus.doc} Janela2
Description

@param xParam Parameter Description
@return xRet Return Description
@author  -
@since 23/07/2023
/*/
//--------------------------------------------------------------
User Function zJanela2()                        
Private cCodigo :=Space(3)
Private cEndereco := Space(100)
Private cNome := Space(60)
Local oButton1
Local oCodigo
//Local cCodigo := "Define variable value"
Local oEndereco
//Local cEndereco := "Define variable value"
Local oNome
//Local cNome := "Define variable value"
Static oJanela1

  DEFINE MSDIALOG oJanela1 TITLE "Cadastro cliente" FROM 000, 000  TO 500, 500 COLORS 0, 16777215 PIXEL

    @ 010, 012 SAY cCodigo PROMPT "Codigo" SIZE 042, 011 OF oJanela1 COLORS 0, 16777215 PIXEL
    @ 022, 012 MSGET oCodigo VAR cCodigo SIZE 060, 010 OF oJanela1 COLORS 0, 16777215 PIXEL
    @ 010, 092 SAY cNome PROMPT "Nome" SIZE 041, 011 OF oJanela1 COLORS 0, 16777215 PIXEL
    @ 021, 091 MSGET oNome VAR cNome SIZE 057, 010 OF oJanela1 COLORS 0, 16777215 PIXEL
    @ 049, 011 SAY cEndereco PROMPT "Endereço" SIZE 049, 011 OF oJanela1 COLORS 0, 16777215 PIXEL
    @ 058, 011 MSGET oEndereco VAR cEndereco SIZE 061, 010 OF oJanela1 COLORS 0, 16777215 PIXEL
    @ 076, 013 BUTTON oButton1 PROMPT "Cadastrar" SIZE 031, 014 OF oJanela1 PIXEL

  ACTIVATE MSDIALOG oJanela1 CENTERED

Return
