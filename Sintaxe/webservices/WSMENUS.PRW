#include "PROTHEUS.CH"
#include "RESTFUL.CH"
#include "rwmake.ch"
#include "TbiConn.ch"

WSRESTFUL wsmenus DESCRIPTION "WS para retornar menus de acesso"
  WSMETHOD GET    menus       DESCRIPTION "Retorna menus de acesso"       WSSYNTAX "/"             PATH "/" 
END WSRESTFUL

WSMETHOD GET menus WSREST wsmenus
    Local cJSON    := Self:GetContent() 
    Local oJsnBody := JsonObject():New()
    Local oJsonRet := JsonObject():New()
    Local cRetJson := oJsnBody:FromJson(cJSON)
    Local cQuery   := ""
    Local cAlias   := GetNextAlias()
    Local lRet     := .T.
    Local aJsonRet := {}

  conout("### Iniciando rotina de consulta de Menus... ###")

  cRetJson := oJsnBody:FromJson(cJSON)

  if ValType(cRetJson) == "C"
    setrestfault(400, "Falha ao transformar texto em objeto json. Erro: " + cRetJson +".",.T.)
    lRet := .F.
    return lRet
  endIf

  cQuery+= " SELECT  * FROM "+RetSqlName("SZ2")+ " SZ2 (NOLOCK)"
  cQuery+= " WHERE SZ2.D_E_L_E_T_ ='' " 

  conout(" ### query de MENUS ###")
  conout(cQuery)
  
  cQuery := ChangeQuery(cQuery)
  cAlias := MPSysOpenQuery(cQuery)

  While !(cAlias)->(Eof())\
    aAdd(aJsonRet,JsonObject():new())
    aJsonRet[len(aJsonRet)]['codigoMenu']    := (cAlias)->Z2_MENU  
    aJsonRet[len(aJsonRet)]['descMenu']      := (cAlias)->Z2_DESC
    (cAlias)->(DbSkip())
  EndDo

  if lRet
    oJsonRet:set(aJsonRet)
    ::SetResponse(EncodeUtf8(oJsonRet:toJSON()))
  endif

return lRet
  
