#include "Totvs.ch"

//Revisão sobre a função TDialog

User Function ztteste()
    Local aArea := GetArea()
    Local nJanAltu := 600
    Local nJanLarg := 800
    Local cJanTitulo := "Cadastro"
    Local lDimPixel := .T.
    Local lCentral := .T.
 


    Local cCod := Space(10)
    Local cNome := Space(180)
    Local cCnpj := Space(14)

    Local oJanela 

    

    oJanela := TDialog():New(0, 0, nJanAltu, nJanLarg, cJanTitulo,/*uPar6*/, /*uPar7*/ ,/*uPar8*/ , /*uPar9*/, /*nCorTexto*/, /*nCorFundo*/, /*uPar12*/, /*oJanelaMae*/, lDimPixel,/*uPar15*/,/*uPar16*/,/*uPar17*/,/*nLarguraJanelaMae*/,/*nAlturaJanelaMae*/,/*lTransparente*/)
    oCodigo :=TGet():New( 10,10,{|u|if(PCount()>=0,cCod,cCod:=u)},oJanela,030,008,"@!",/*bBlocoCodigo*/,0,/*nCorFundo*/,/*oTFont*/,/*uPar12*/,/*uPar13*/,.T.,/*uPar15*/,/*uPar16*/,/*bBlocoIni*/,/*uPar18*/,/*uPar19*/,/*bBlocoAlter*/,/*lReadOnly*/,/*lSenha*/,/*uPar23*/,cCod,/*uPar25*/,/*uPar26*/,/*uPar27*/,.T.,/*lOcultF3*/,/*uPar30*/,"Código ",2,/*oTFontLabel*/,/*nLabelColor*/,/*cTextoFundo*/,/*lPicture*/,.T. )
    oNome :=TGet():New( 10,70,{|u|if(PCount()>=0,cNome,cNome:=u)},oJanela,180,008,"@!",/*bBlocoCodigo*/,0,/*nCorFundo*/,/*oTFont*/,/*uPar12*/,/*uPar13*/,.T.,/*uPar15*/,/*uPar16*/,/*bBlocoIni*/,/*uPar18*/,/*uPar19*/,/*bBlocoAlter*/,/*lReadOnly*/,/*lSenha*/,/*uPar23*/,cNome,/*uPar25*/,/*uPar26*/,/*uPar27*/,.T.,/*lOcultF3*/,/*uPar30*/,"Nome ",2,/*oTFontLabel*/,/*nLabelColor*/,/*cTextoFundo*/,/*lPicture*/,.T. )
    oCnpj :=TGet():New( 25,70,{|u|if(PCount()>=0,cCnpj,cCnpj:=u)},oJanela,180,008,"@!",/*bBlocoCodigo*/,0,/*nCorFundo*/,/*oTFont*/,/*uPar12*/,/*uPar13*/,.T.,/*uPar15*/,/*uPar16*/,/*bBlocoIni*/,/*uPar18*/,/*uPar19*/,/*bBlocoAlter*/,/*lReadOnly*/,/*lSenha*/,/*uPar23*/,cCnpj,/*uPar25*/,/*uPar26*/,/*uPar27*/,.T.,/*lOcultF3*/,/*uPar30*/,"CNPJ ",2,/*oTFontLabel*/,/*nLabelColor*/,/*cTextoFundo*/,/*lPicture*/,.T. )


    oJanela:ACTIVATE( /*uParam1*/ , /*uParam2*/, /*uParam3*/, lCentral, /*bBlocoCodigo*/, /*uParam6*/, /*bBlocoIni*/, /*uParam8*/, /*uParam9*/)

    
  
    RestArea(aArea)
 
Return 


/*/{Protheus.doc} Function Name
@Description 
@Type		 
@Author 	 
@Since  	 11/09/2023
/*/
/*Static Function  Tela02()
    
    Local nJanAltu := 400
    Local nJanLarg := 600
    Local cJanTitulo := "tela teste 002"
    Local lDimPixel := .T.
    Local lCentral := .T.
    Local oJanela 

    oJanela  := TDialog():New(0, 0, nJanAltu, nJanLarg, cJanTitulo, , , , , , , , , lDimPixel)

    oJanela :ACTIVATE(, , , lCentral, , , , , ,)
    
Return*/
