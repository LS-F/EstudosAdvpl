#INCLUDE "Totvs.ch"

/*/{Protheus.doc} User Function zAula03
    (long_description)
    @type  Function
    @author Luis
    @since 09/07/2023
   
    /*/
User Function zAula03()

    //Variáveis do tipo Caracter
    //Local aArea := GetArea()
    Local cNome :="Luis" + CRLF + "Silva"

    //Variáveis do tipo Numérico
    Local nIdade := 10
    Local nMedia := 2.5
    
    //Variáveis do tipo Lógico
    Local iLogco := .T.
    Local iLogico := .F.

    //Variáveis do tipo Data
    Local dData1 := sTod("24/07/2023")
    Local dData2 := Date()
    Local dData3 := dDataBase

    //Bloco de código
    bAoQuadrado := { |nValor | nQuadrado := nValor * nValor, Alert("Valor ao quadrado: " + cValToChar(nQuadrado))}
    Eval(bAoQuadrado, 5)
    Eval(bAoQuadrado, 7)

    //Array Simples
    Local aNome :={}
    Local aSobrenome := Array(3)

    aAdd(aNome, "Luis")
    aAdd(aNome, "Manito")

    aSobrenome[1] := "Silva"
    aSobrenome[2] := "Pato"

    //Array Multidimensional
    Local aPessoa := {}
    Local nAtual

    aAdd(aPessoa,{"Luis", sTod("24/07/2023"), "Madagascar"})
    aAdd(aPessoa, {"Joana vendeu no dia ", sTod("31-05-2023"), "Passagens para Madagascar"})
    aAdd(aPessoa, {"Kleber quer fazer uma exposição", sTod("30-02-2023"), "Em Madagascar"})

    For nAtual :=1 To Len(aPessoa)
        Alert(aPessoa[nAtual][1] + dToS(aPessoa[nAtual][2]) + aPessoa[nAtual][3])
    Next

    
    msgInfo(cNome)
    msgInfo(cValToChar(nIdade + nMedia)) 
    msgInfo(cValToChar( iLogco ) + CRLF+ cValToChar(iLogico)) 
    msgInfo(cValToChar(dData1) + CRLF+ cValToChar(dData2) + CRLF+ cValToChar(dData3) )
    Alert(aNome[1] + " " + aSobrenome[1])
    msgInfo("Yakisoba")

   



    //RestAarea(aArea)
Return
