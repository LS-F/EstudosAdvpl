#include "TOTVS.CH"

/*/{Protheus.doc} zAula05
@Description Estudos
@Type		 Estudos
@Author 	Luis SIlva 
@Since  	 20/08/2023
/*/
User Function zAula05()
    // Estrutura de condi��o IF, ELSE e ENDIF    
    Local aArea := GetArea()
    Local cNome := ""
    Local nTipo := 0
    Local nMesAtu := Month(Date())
    Local nMesAniv := 12
    Local cMsg := ""
    Local nAtual := 0
    Local cPares :=""
    
    //Definindo o nome
    cNome := "Pato Crackudo"

    If Upper(cNome) == "Rato Borrachudo"
        Alert("Nome n�o � igual a Rato Borrachudo.")
    ElseIf Upper(cNome) == "Dracarius"
        Alert("Nome n�o � igual a Dracarius.")
    Else
       Alert("O nome n�o consta na lista")
    EndIf    

    //Estrutura de Condi��o Do Case
    cNome:="Ratazana"

    Do Case
        Case cNome == "Jo�o"
            nTipo := 1

        Case cNome == "Mingau"
            nTipo := 2

        Otherwise
            nTipo := 3        
    EndCase    

    Alert("Tipo = " + cValToChar(nTipo))

    //Estrutura de Condi��o IIF
    cMsg := IIF(nMesAtu == nMesAniv, "Aniversariante","Ainda n�o")
    Alert(cMsg)
    
    //Estrutura repeti��o FOR
    For nAtual := 1 To 10

        if nAtual % 2 == 0
            cPares +=cValToChar(nAtual) + ", "
        endIf
    Next

    MsgInfo("Pares: " + cPares)

    RestArea(aArea)
    
Return 
