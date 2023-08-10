
//Biblioteca

#INCLUDE 'TOTVS.ch'

//Documenta��o da Fun��o

/*/{Protheus.doc} User Function zAula02
    Soma de dois valores inteiros
    @type  Function
    @author Luis Silva
    @since 10/06/2023
    @version 1.0
    @see (links_or_references)
    /*/

//Abertura do Programa

User Function zAula02()
    Local aArea := GetArea()
    Local dDataAtu := Date()
    Local cHoraAtu := Time()
    Local cNome := "Eu sou foda, meu parceiro"

    // Corpo do programa
    MsgInfo("Estamos no [" + cNome + "], hoje � " + dToC(dDataAtu) + ", �s " + cHoraAtu, "Aten��o")
    MsgInfo("Ontem seria " + dToC(DaySub(dDataAtu,1)), "Aten��o")
    MsgInfo("M�s passado seria " + dToC(MonthSub(dDataAtu,1)), "Eu sou fodaaaaa!!!!")

    //Encerramento do Programa
    RestArea(aArea)
Return 
