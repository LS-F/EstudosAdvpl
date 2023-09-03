#INCLUDE "totvs.ch"
/*/{Protheus.doc} zAula10
@Description 
@Type		 
@Author 	 
@Since  	 03/09/2023
/*/
User Function zAula10()
    Local aArea := GetArea()
    Local cAliasTmp := "TMP-XPTO"

    //Cria a tabela temporária
    oTempTable := FWTemporaryTable():New(cAliasTmp)

    //Adiciona no array das colunas as que serão incluidas (Nome do Campo, Tipo do Campo, Tamanho, Decimais)
    aFields := {}
    aAdd(aFields,{"FILIAL", "C", 2, 0})
    aAdd(aFields,{"NOME", "C", 50, 0})
    aAdd(aFields,{"VALOR", "N", 8, 2})
    aAdd(aFields,{"EMISSAO", "D", 8, 0})

    //Define as colunas usadas
    oTempTable:SetFields(aFields)

    //Cria índice com colunas setadas anteriormente
    oTempTable:AddIndex("INDICE1",{"FILIAL","NOME"})

    //Efetua a criação da tabela
    oTempTable:Create()

    Reclock(cAliasTmp, .T.)
        (cAliasTmp)->FILIAL :=""
        (cAliasTmp)->NOME :="TESTE TABELA TEMPORÁRIA"
        (cAliasTmp)->VALOR := 30
        (cAliasTmp)->EMISSAO := Date()
    (cAliasTmp)->(MSUNLOCK())

    Alert("Nome real da tabela temporária: [" + oTempTable:GetRealName() + "]")

    //Excluindo a temporária
    oTempTable:Delete()
    
    RestArea(aArea)
Return
