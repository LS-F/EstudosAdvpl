#INCLUDE "totvs.ch"

/*/{Protheus.doc} User Function zAulao4
    Tipos de operandos
    @type  Function
    @author Luis Silva
    @since 15/08/2023
    @version version
    
    /*/
User Function zAula04()
    //Nova forma de declarar a tipagem da Variável, usando AS
    Local cNome AS Character
    Local cCidade

    cNome := "Luis"
   

    Alert(cNome, "Atencao")

    //Operadores Advpl
    cNome := cNome + " Silva" // Operador de Atribuição ( := )
    cCidade := "Manaus" +; //Operador de "continuidade" ( ; )
        ", Amazonas"

    msgAlert(cNome + " " +cCidade, "Resultado")
    
    //Operador @
    cNome1 :=""
    cNome2 := ""
    fFunction(cNome1, @cNome2)
    Alert("cNome1: " + cNome1 + CRLF + "cNome2: " + cNome2)

    //Operador $

    If "L" $ "Luis"
        Alert("A letra 'L' está contida no nome 'LUIS'")
    endIf

    //Operador & (macro substituição ? https://terminaldeinformacao.com/knowledgebase/macro-substituicao/ )
    cExpressao := "7 +8 - 3"
    nValor := &(cExpressao)
    Alert("Resultado da expressão: " + cValToChar(nValor))

    //Operador ==
    if "Luis" == "luis"
        Alert("Igual")
    else
        Alert("Diferente")
    endIf

    //Operadores ** ou ^
    nNum1 := 5 ** 3
    nNum2 := 6 ^ 2
    Alert("5³ = " + cValToChar(nNum1) + CRLF + "6² = " + cValToChar(nNum2))

    //Operadores * e *=

    nNum3 = 2 * 5
    Alert("Valor Num3, com o operador *: " + cValToChar(nNum3))
    nNum3 *= 3
    Alert("Valor Num3, com o operador *= : " + CValToChar(nNum3))
    /*
        A lógica acima funciona também para os demais operadores matemáticos:
        - e -=
        + e +=
        / e /=
    */
    //Operador %
    nNum := 10 % 2
    Alert("O resto da divisão (10/2) é: " + cValToChar(nNum))
    nNum := 9 % 2
    Alert("O resto da divisão (9/2) é: " + cValToChar(nNum))

    //Operadores < e <=
    If 10 < 100
        msgInfo("10 é menor que 100", "Atenção")
    endIf
    If "aaa" <= "zzz"
        msgInfo("aaa menor ou igual a zzz", "Atencio malparido")
    endIf    
    /*
        A lógica acima funciona também para os demais operadores matemáticos:
        > e >=
        <> e !=
      
    */

    //Operador ! ou .NOT.
    If !1 == 1
        Alert("Caiu no IF")
    else
        Alert("Caiu no Else")
    endIf

    //Operador .AND.
    If 1 == 1 .AND. "D" == "Z"
        Alert("OK")
    else
        Alert("Não OK")
    EndIf

    //Operador .OR.
    If 1 == 1 .OR. "D" == "Z"
        Alert("OK")
    else
        Alert("Não OK")
    EndIf 

    //Operador Default
    fFuncao()


    
    
Return 


Static Function fFunction(cVar1, cVar2)
    Default cVar1 := "teste"
    Default cVar2 := "teste02"


    Alert("CVar1: " + cVar1 + CRLF + "cVar2: " + cVar2)   
    cVar1 := "Variável 01"
    cVar2 := "Variável 02"
        
Return 
