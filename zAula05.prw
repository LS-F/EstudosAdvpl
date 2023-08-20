#include "TOTVS.CH"

/*/{Protheus.doc} zAula05
@Description Estudos
@Type		 Estudos
@Author 	Luis SIlva 
@Since  	 20/08/2023
/*/
User Function zAula05()
    // Estrutura de condição IF, ELSE e ENDIF    
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
        Alert("Nome não é igual a Rato Borrachudo.")
    ElseIf Upper(cNome) == "Dracarius"
        Alert("Nome não é igual a Dracarius.")
    Else
       Alert("O nome não consta na lista")
    EndIf    

    //Estrutura de Condição Do Case
    cNome:="Ratazana"

    Do Case
        Case cNome == "João"
            nTipo := 1

        Case cNome == "Mingau"
            nTipo := 2

        Otherwise
            nTipo := 3        
    EndCase    

    Alert("Tipo = " + cValToChar(nTipo))

    //Estrutura de Condição IIF
    cMsg := IIF(nMesAtu == nMesAniv, "Aniversariante","Ainda não")
    Alert(cMsg)
    
    //Estrutura repetição FOR
    For nAtual := 1 To 10

        if nAtual % 2 == 0
            cPares +=cValToChar(nAtual) + ", "
        endIf
    Next

    MsgInfo("Pares: " + cPares)

    RestArea(aArea)
    
Return 
