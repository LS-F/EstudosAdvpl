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


    
    
Return 
