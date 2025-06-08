#include "PROTHEUS.CH"
#include "RESTFUL.CH"

/*/{Protheus.doc} 
    usa api externa para consultar CEP
    @author Luis Silva
    @since 08/06/2025
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    /*/

User Function TelaCEP()

    Local oDlgAux
    Local oButton1
    Local oButton2
    Local oSay
    Local oCep
    Local cCep       := Space(TamSX3("A1_CEP")[1])
    Local nJanAltu   := 200
    Local nJanLarg   := 400
    Local lDimPixels := .T.
    Local lCentraliz := .T.
    Local bBlocoIni  := {||}
    Local cJanTitulo := "Pesquisa CEP"
 
    //Cria a dialog
    oDlgAux := TDialog():New(0, 0, nJanAltu, nJanLarg, cJanTitulo, , , , , , /*nCorFundo*/, , , lDimPixels)
        oSay:= TSay():New(10,92,{||"Digite o Cep"},oDlgAux,,,,,,.T.,,,400,300,,,,,,)
        oCep:= TGet():New(20,92, {|u| Iif(PCount() > 0 , cCep := u, cCep)}, oDlgAux, 30, 20, /*cPict*/, /*bValid*/, /*nClrFore*/, /*nClrBack*/, , , , lDimPixels)
        oButton1 := TButton():New(60, 46, "Buscar", oDlgAux, {||BuscaCEP(cCep)}, 30, 20, , , , lDimPixels)
        oButton2 := TButton():New(60, 138, "Encerrar", oDlgAux, {||oDlgAux:end()}, 30, 20, , , , lDimPixels)

        
    //Ativa e exibe a janela
    oDlgAux:Activate(, , , lCentraliz, , , bBlocoIni)

Return

/*/{Protheus.doc} BuscaCEP
@Description 
@Type		 
@Author 	 
@Since  	 08/06/2025
/*/
Static Function BuscaCEP(cCep)
    Local aHeader  := {}
    Local oRestClient as object

    aAdd(aHeader,'User-Agent: Mozilla/4.0 (compatible; Protheus '+GetBuild()+')')
    aAdd(aHeader,'Content-Type: application/json; charset=utf-8')
 
    oRestClient := FWRest():New("https://viacep.com.br/ws")
    oRestClient:setPath("/"+cCep+"/json/")
    
    if oRestClient:Get(aHeader)
        ShowLog(oRestClient:cResult)
    else
        oRestClient:GetLastError()
    endif

return 
