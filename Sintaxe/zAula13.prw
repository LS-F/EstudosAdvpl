#INCLUDE "totvs.ch"

/*/{Protheus.doc} Function Name
@Description 
@Type		 
@Author 	 
@Since  	 09/09/2023
/*/
User Function zAula13()
    
    Local nJanAltu := 200
    Local nJanLarg := 400
    Local lDimPixels := .T.
    Local lCentraliz := .T.
    Local bBlocoOk := {|| lOk := .T., oDlgAux:End()}
    Local bBlocoCan := {|| lOk := .F., oDlgAux:End()}
    Local aOutrasAc := { { "BMP", {||Alert("Cliquei no 1")}, "Botão 1"}, {"BMP", {|| Tela02()}, "Tela 2"}}
    Local bBlocoIni := {|| EnchoiceBar(oDlgAux,bBlocoOk,bBlocoCan,,aOutrasAc)}
    Local cJanTitulo := "Tela de Teste"
    Private oDlgAux
    Private lOk := .F.

    //Criando a Dialog
    oDlgAux := TDialog():New(0, 0, nJanAltu, nJanLarg, cJanTitulo, , , , , , /*nCorFundo*/, , , lDimPixels)   

    //Ativa e exibe a Janela
    oDlgAux:ACTIVATE(, , , lCentraliz, , , bBlocoIni)

    //Se o retorno for positivo, foi clicado no botão confirmar ao invés de cancelar
    if lOk
        FWAlertSucess("Foi clicado no botão confirmar!", "Top")
        MSGINFO( "Criou a janela", "Deu certo")
    EndIf
    
Return




/*/{Protheus.doc} Function Name
@Description 
@Type		 
@Author 	 
@Since  	 09/09/2023
/*/
Static Function Tela02()
    Local nJanAltu := 100
    Local nJanLarg := 200
    Local lDimPixels := .T.
    Local lCentraliz := .T.
    Local cJanTitulo := "Tela de Teste 2"
    Local bBlocoIni := {||}
    Local oDlgAux
    

       //Criando a Dialog
    oDlgAux := TDialog():New(0, 0, nJanAltu, nJanLarg, cJanTitulo, , , , , , /*nCorFundo*/, , , lDimPixels)   

    //Ativa e exibe a Janela
    oDlgAux:ACTIVATE(, , , lCentraliz, , , bBlocoIni)
Return
