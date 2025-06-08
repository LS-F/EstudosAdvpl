//Bibliotecas
#INCLUDE "Totvs.ch"
#INCLUDE 'FONT.CH'

/*/{Protheus.doc} User Function 'zTeste'
    Teste de conceitos cursos advpl
    @type  Function
    @author Luis
    @since 27/04/2023
    @version 1.0

    /*/

/* 3. Abertura do programa*/

User Function zTeste()
    Local aArea := GetArea()
    Local dDataAtu := Date()
    Local cHoraAtu := Time()
    Local cNome := "Curso AdvPL"

    /* 4. Corpo do programa*/
    MsgInfo("Estamos no [" + cNome + "], hoje � " + dToC(dDataAtu) + " , às " + cHoraAtu, "Aten��o")
    MsgInfo("Ontem seria " + dToc(DaySub(dDataAtu,1)), "Aten��o")
    MsgInfo("Mês passado seria " + dToc(MonthSub(dDataAtu,1)), "Aten��o")

    /* 5. Encerramento do programa*/
    Rest(aArea)
    
    
Return 





