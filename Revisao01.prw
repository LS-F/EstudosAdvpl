#include "Totvs.ch"

//Revisão sobre a função TDialog

User Function zAula14()
    Local aArea := GetArea()
    Local nJanAltu := 400
    Local nJanLarg := 600
    Local cJanTitulo := "tela teste 002"
    Local lDimPixel := .T.
    Local lCentral := .T.
    Local oDlg 

    oDlg := TDialog():New(0, 0, nJanAltu, nJanLarg, cJanTitulo, , , , , , , , , lDimPixel)

    oDlg:ACTIVATE(, , , lCentral, , , , , ,)


    RestArea(aArea)
 
Return
