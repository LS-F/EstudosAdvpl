//Bibliotecas
#include "TOTVS.CH"

/*/{Protheus.doc zAula11
@Description 
@Type		 
@Author 	 
@Since  	 03/09/2023
/*/
User Function MA020ROT()
    Local aArea := GetArea()
    Local aRotNov := {}

    //Adicionando ações relacionadas no cadastro de fornecedor
    aAdd( aRotNov, {"* Base de Conhecimento", "MsDocument('SA2', SA2->(RecNo()),4)", 0,4})
    aAdd( aRotNov, {"* Teste", "Alert('Deu certo!')", 0,2})

    RestArea(aArea)

Return aRotNov
