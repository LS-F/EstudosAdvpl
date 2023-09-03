#INCLUDE "TOTVS.CH"
#INCLUDE "FWMBROWSE.CH"
#INCLUDE "FWMVCDEF.CH"
/*/{Protheus.doc} zAula09
@Description Criado registros com ExecAuto em MVC
@Type		 
@Author 	 Luis*
@Since  	 02/09/2023
/*/
User Function zAula09()
    Local aArea := GetArea()
    Local lDeuCerto := .F.
    Local oModel
    Local oSA2Mod
    Local aErro := {}

    //Pegando o modelo de dados, setando a operação de inclusão
    oModel:= FWLoadModel("MATA020")
    oModel: SetOperation(3)
    oModel: Activate()

    //Pegando o model dos campos da SA2
    oSA2Mod:= oModel:getModel("SA2MASTER")
    oSA2Mod:setValue("A2_COD", "000007") //Código
    oSA2Mod:setValue("A2_LOJA", "01") // Loja
    oSA2Mod:setValue("A2_NOME","FORNECEDOR MVC")//Nome
    oSA2Mod:setValue("A2_NREDUZ","MVC")//Nome Reduz.
    oSA2Mod:setValue("A2_END","RUA CACIQUE")//Endereco
    oSA2Mod:setValue("A2_BAIRRO","BAIRRO DA PAZ")//Bairro
    oSA2Mod:setValue("A2_TIPO","J")//Tipo
    oSA2Mod:setValue("A2_EST","SP")//Estado
    oSA2Mod:setValue("A2_COD_MUN","06003")//Código Municipio
    oSA2Mod:setValue("A2_MUN","BAURU")//Municipio
    oSA2Mod:setValue("A2_CGC","12345678910112")//CNPJ/CPF

    //Se conseguir validas as informações
    If oModel:VldData()

        //Tenta realizar o Commit
        If oModel:CommitData()
            lDeuCerto := .T.

        //Se não deu certo, altera a variável para false
        Else
            lDeuCerto := .F.
        EndIf    
    
    //Se não deu certo a inclusão, mostra a mensagem de erro
    If ! lDeuCerto
        //Busca o Erro do Modelo de Dados
        aErro := oModel:GetErrorMessage()

        //Monta o texto que será mostrado na tela
        AutoGrLog("Id do formulário de origem: " + ' [' + AllToChar(aErro[01]) + ']')
        AutoGrLog("Id do campo de origem: "      + ' [' + AllToChar(aErro[02]) + ']')
        AutoGrLog("Id do formulário de erro: "   + ' [' + AllToChar(aErro[03]) + ']')
        AutoGrLog("Id do campo de erro: "        + ' [' + AllToChar(aErro[04]) + ']')
        AutoGrLog("Id do erro: "                 + ' [' + AllToChar(aErro[05]) + ']')
        AutoGrLog("Mensagem do erro: "           + ' [' + AllToChar(aErro[06]) + ']')
        AutoGrLog("Mensagem da solução: "        + ' [' + AllToChar(aErro[07]) + ']')
        AutoGrLog("Valor atribuído: "            + ' [' + AllToChar(aErro[08]) + ']')
        AutoGrLog("Valor anterior: "             + ' [' + AllToChar(aErro[09]) + ']')

        //Mostra a mensagem de Erro
        MostraErro()
    EndIf

    //Desativa o modelo de dados
    oModel:DeActivate()

    RestArea(aArea)
        
Return
