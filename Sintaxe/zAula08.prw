#include "Totvs.ch"

/*/{Protheus.doc} zAula08()
@Description Criando registros com MsExecAuto
@Type		 
@Author 	 Luis Silva
@Since  	 02/09/2023
/*/
User Function zAula08()
    Local aArea := GetArea()
    Local aDados :={}
    Private lMsErroAuto := .F.

    //Adiciona dados do cadastro de bancos
    aAdd(aDados,{"A6_COD", "077", NIL})
    aAdd(aDados,{"A6_AGENCIA", "00001", NIL})
    aAdd(aDados,{"A6_NUMCON", "2323232323", NIL})
    aAdd(aDados,{"A6_NOME", "BANCO LARANJA", NIL})

    //Iniciando Transação
    Begin Transaction
        MsExecAuto({|x,y| Mata070(x,y)}, aDados, 3)
        
        //Se houver erro, mostra mensagem
        If lMsErroAuto
            MostraErro()
            DisarmTransaction()
        else
            MsgInfo("Banco Cadastrado com sucesso!", "Atenção")
        EndIf
    End Transaction

    RestArea(aArea)
Return
