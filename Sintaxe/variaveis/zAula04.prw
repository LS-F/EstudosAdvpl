#INCLUDE "totvs.ch"

/*/{Protheus.doc} User Function zAulao4
    Tipos de operandos
    @type  Function
    @author Luis Silva
    @since 15/08/2023
    @version version
    
    /*/
User Function zAula04()
    //Nova forma de declarar a tipagem da Vari�vel, usando AS
    Local cNome AS Character
    Local cCidade

    cNome := "Luis"
   

    Alert(cNome, "Atencao")

    //Operadores Advpl
    cNome := cNome + " Silva" // Operador de Atribui��o ( := )
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
        Alert("A letra 'L' est� contida no nome 'LUIS'")
    endIf

    //Operador & (macro substitui��o ? https://terminaldeinformacao.com/knowledgebase/macro-substituicao/ )
    cExpressao := "7 +8 - 3"
    nValor := &(cExpressao)
    Alert("Resultado da express�o: " + cValToChar(nValor))

    //Operador ==
    if "Luis" == "luis"
        Alert("Igual")
    else
        Alert("Diferente")
    endIf

    //Operadores ** ou ^
    nNum1 := 5 ** 3
    nNum2 := 6 ^ 2
    Alert("5� = " + cValToChar(nNum1) + CRLF + "6� = " + cValToChar(nNum2))

    //Operadores * e *=

    nNum3 = 2 * 5
    Alert("Valor Num3, com o operador *: " + cValToChar(nNum3))
    nNum3 *= 3
    Alert("Valor Num3, com o operador *= : " + CValToChar(nNum3))
    /*
        A l�gica acima funciona tamb�m para os demais operadores matem�ticos:
        - e -=
        + e +=
        / e /=
    */
    //Operador %
    nNum := 10 % 2
    Alert("O resto da divis�o (10/2) �: " + cValToChar(nNum))
    nNum := 9 % 2
    Alert("O resto da divis�o (9/2) �: " + cValToChar(nNum))

    //Operadores < e <=
    If 10 < 100
        msgInfo("10 � menor que 100", "Aten��o")
    endIf
    If "aaa" <= "zzz"
        msgInfo("aaa menor ou igual a zzz", "Atencio malparido")
    endIf    
    /*
        A l�gica acima funciona tamb�m para os demais operadores matem�ticos:
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
        Alert("N�o OK")
    EndIf

    //Operador .OR.
    If 1 == 1 .OR. "D" == "Z"
        Alert("OK")
    else
        Alert("N�o OK")
    EndIf 

    //Operador Default
    fFuncao()


    
    
Return 


Static Function fFunction(cVar1, cVar2)
    Default cVar1 := "teste"
    Default cVar2 := "teste02"


    Alert("CVar1: " + cVar1 + CRLF + "cVar2: " + cVar2)   
    cVar1 := "Vari�vel 01"
    cVar2 := "Vari�vel 02"
        
Return 
