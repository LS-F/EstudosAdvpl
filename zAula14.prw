#INCLUDE "totvs.ch"

/*/{Protheus.doc} Function Name
@Description 
@Type		 
@Author 	 
@Since  	 09/09/2023
/*/
User Function zAula14()
    //Variáveis Janela
    Local aArea := getArea()
    Local nJanAltu := 600
    Local nJanLarg := 800
    Local lDimPixels := .T.
    Local lCentraliz := .T.
    Local bBlocoOk := {|| lOk := .T.,zSalvaB1()}
    Local bBlocoCan := {|| lOk := .F., oJanela:End()}
    Local aOutrasAc := { { "BMP", {||Alert("Cliquei no 1")}, "Botão 1"}, {"BMP", {|| Tela02()}, "Tela 2"}}
    Local bBlocoIni := {|| EnchoiceBar(oJanela,bBlocoOk,bBlocoCan,,aOutrasAc)}
    Local cJanTitulo := "Cadastro de Produtos"

    //Variável Janela
    Local oJanela

    //Variáveis Campos
    Local cProdCod := Space(TamSx3("B1_COD")[1])
    Local cDescProd := Space(TamSx3("B1_DESC")[1])
    Local cTipoProd := Space(TamSx3("B1_TIPO")[1])
    Local cUndProd := Space(TamSx3("B1_UM")[1])
    Local cArmPad  := Space(TamSx3("B1_LOCPAD")[1])


    //Local nLinha := 40
    //Local nColuna := 10

    
    

    //Criando a Dialog
    oJanela := TDialog():New(0, 0, nJanAltu, nJanLarg, cJanTitulo, , , , , , /*nCorFundo*/, , , lDimPixels)   

      //Exibindo campos na tela
        oProdCod := TGet():New( 40,10,{|u|if(PCount()>0,cProdCod:=u,cProdCod)},oJanela,080,010,"@!",/*blocoDeValidacao*/,0,/*nCorFundoTexto*/,/*tFont*/,.F.,/*parametro13*/,.T.,/*parametro15*/,.F.,/*blocoDeCodigo*/,.F.,.F.,/*blocoDeCodigo*/,.F.,.F.,/*parametro23*/,cProdCod,/*parametro24*/,/*parametro26*/,/*parametro27*/,.T.,.F.,/*parametro30*/,"Codigo",1, )
        oDescProd := TGet():New( 40,120,{|u|if(PCount()>0,cDescProd:=u,cDescProd)},oJanela,160,010,"@!",/*blocoDeValidacao*/,0,/*nCorFundoTexto*/,/*tFont*/,.F.,/*parametro13*/,.T.,/*parametro15*/,.F.,/*blocoDeCodigo*/,.F.,.F.,/*blocoDeCodigo*/,.F.,.F.,/*parametro23*/,cDescProd,/*parametro24*/,/*parametro26*/,/*parametro27*/,.T.,.F.,/*parametro30*/,"Descricao",1, )
        oTipoProd := TGet():New( 40,310,{|u|if(PCount()>0,cTipoProd:=u,cTipoProd)},oJanela,020,010,"@!",/*blocoDeValidacao*/,0,/*nCorFundoTexto*/,/*tFont*/,.F.,/*parametro13*/,.T.,/*parametro15*/,.F.,/*blocoDeCodigo*/,.F.,.F.,/*blocoDeCodigo*/,.F.,.F.,/*parametro23*/,cTipoProd,/*parametro24*/,/*parametro26*/,/*parametro27*/,.T.,.F.,/*parametro30*/,"Tipo",1, )
        oTipoProd:cF3 :="02"//Consulta padrão para Tipo de Produtos
        oUndProd := TGet():New( 65,10,{|u|if(PCount()>0,cUndProd:=u,cUndProd)},oJanela,015,010,"@!",/*blocoDeValidacao*/,0,/*nCorFundoTexto*/,/*tFont*/,.F.,/*parametro13*/,.T.,/*parametro15*/,.F.,/*blocoDeCodigo*/,.F.,.F.,/*blocoDeCodigo*/,.F.,.F.,/*parametro23*/,cUndProd,/*parametro24*/,/*parametro26*/,/*parametro27*/,.T.,.F.,/*parametro30*/,"Unidade",1, )
        oUndProd:cF3 :="SAH"//Consulta padrão para Unidade de Medida
        oArmPad := TGet():New( 65,60,{|u|if(PCount()>0,cArmPad:=u,cArmPad)},oJanela,015,010,"@!",/*blocoDeValidacao*/,0,/*nCorFundoTexto*/,/*tFont*/,.F.,/*parametro13*/,.T.,/*parametro15*/,.F.,/*blocoDeCodigo*/,.F.,.F.,/*blocoDeCodigo*/,.F.,.F.,/*parametro23*/,cArmPad,/*parametro24*/,/*parametro26*/,/*parametro27*/,.T.,.F.,/*parametro30*/,"Armazem Pad.",1, )
        oArmPad:cF3 :="NNR"//Consulta padrão para Locais de estoque
        
    
    //Ativa e exibe a Janela
    oJanela:ACTIVATE(, , , lCentraliz, , , bBlocoIni)


 
    
   


   



    restArea(aArea)
    
Return


Static Function zSalvaB1(cProdCod,cDescProd,cTipoProd,cUndProd,cArmPad) 


 DBSELECTAREA( "SB1" )
        SB1->(DbSetOrder(1))
          SB1->(DbSeek(xFilial("SB1")))
            RecLock('SB1',.T.)
              SB1->B1_FILIAL := xFilial("SB1")
              SB1->B1_COD := cProdCod
              SB1->B1_DESC := cDescProd
              SB1->B1_TIPO := cTipoProd
              SB1->B1_UM := cUndProd            
            MsUnlock()

  DBCloseArea()
  
  
Return
