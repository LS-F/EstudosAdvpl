#INCLUDE "totvs.ch"

/*/{Protheus.doc} Function Name
@Description 
@Type		 
@Author 	 
@Since  	 09/09/2023
/*/
User Function zAula14()
    //Variáveis Janela
    Local nJanAltu := 600
    Local nJanLarg := 800
    Local lDimPixels := .T.
    Local lCentraliz := .T.
    Local bBlocoOk := {|| lOk := .T., oJanela:End()}
    Local bBlocoCan := {|| lOk := .F., oJanela:End()}
    Local aOutrasAc := { { "BMP", {||Alert("Cliquei no 1")}, "Botão 1"}, {"BMP", {|| Tela02()}, "Tela 2"}}
    Local bBlocoIni := {|| EnchoiceBar(oJanela,bBlocoOk,bBlocoCan,,aOutrasAc)}
    Local cJanTitulo := "Tela de Teste"

    //Variáveis Campos
    Local cCampo1 := "Campo 01"
    Local nLinha := 10
    Local nColuna := 3

    //Variável Janela
    Local oJanela
    

    //Criando a Dialog
    oJanela := TDialog():New(0, 0, nJanAltu, nJanLarg, cJanTitulo, , , , , , /*nCorFundo*/, , , lDimPixels)   

      //Exibindo campo na tela
        oJanela := TGet():New( nLinha,nColuna,{|u|if(PCount()>0,cCampo1,cCampo1:=u)},oJanela,060,040,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cCampo1,,,, )


    //Ativa e exibe a Janela
    oJanela:ACTIVATE(, , , lCentraliz, , , bBlocoIni,.T.)

   


    



    
    
Return
