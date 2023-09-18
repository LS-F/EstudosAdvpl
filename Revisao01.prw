#include "Totvs.ch"

//Revisão sobre a função TDialog

User Function ztteste()
    Local aArea := GetArea()
    Local nJanAltu := 400
    Local nJanLarg := 600
    Local cJanTitulo := "tela NOVA"
    Local lDimPixel := .T.
    //Local lCentral := .T.
    Local oJanela 

    oJanela  := TWindow():New(10, 10, nJanAltu, nJanLarg, cJanTitulo,NIL, NIL, NIL, NIL, NIL, NIL, NIL,;
            NIL, NIL, NIL, NIL, NIL, NIL, NIL, NIL, lDimPixel )

    oJanela :ACTIVATE('MAXIMIZED')


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
