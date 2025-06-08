#include "PROTHEUS.CH"
#include "RESTFUL.CH"
#include "rwmake.ch"
#include "TbiConn.ch"

WSRESTFUL wsprodutos DESCRIPTION "WS para retornar e cadastrar produtos"
  WSMETHOD GET    produtos       DESCRIPTION "Retorna dados de todos os produtos"       WSSYNTAX "/"             PATH "/" 
  WSMETHOD POST   incluiProdutos DESCRIPTION "Cadastra produto"                         WSSYNTAX "/inclui"       PATH "/inclui" 
END WSRESTFUL

/*/{Protheus.doc} WSMETHOD GET produtos
  serviço rest para retornar todos os produtos cadastrados
  @type  Function
  @author luis.silva
  @since 07/06/2022
  @version 
/*/
WSMETHOD GET produtos WSREST wsprodutos

  Local cJSON    := Self:GetContent() 
  Local oJsnBody := JsonObject():New()
  Local oJsonRet := JsonObject():New()
  Local cRetJson := oJsnBody:FromJson(cJSON)
  Local cQuery   := ""
  Local cAlias   := GetNextAlias()
  Local lRet     := .T.
  Local aJsonRet := {}


  cRetJson := oJsnBody:FromJson(cJSON)

  if ValType(cRetJson) == "C"
    setrestfault(400, "Falha ao transformar texto em objeto json. Erro: " + cRetJson +".",.T.)
    lRet := .F.
    return lRet
  endIf

  cQuery+= " SELECT  * FROM "+RetSqlName("SB1")+ " SB1 (NOLOCK)"
  cQuery+= " WHERE SB1.D_E_L_E_T_ ='' " 
  if !Empty(oJsnBody['codigo'])
    cQuery+= " AND B1_COD ='"+oJsnBody['codigo']+"' " 
  endif
  
  cQuery := ChangeQuery(cQuery)
  cAlias := MPSysOpenQuery(cQuery)

  While !(cAlias)->(Eof())\
    aAdd(aJsonRet,JsonObject():new())
    aJsonRet[len(aJsonRet)]['codigo']    := (cAlias)->B1_COD  
    aJsonRet[len(aJsonRet)]['descricao'] := (cAlias)->B1_DESC
    aJsonRet[len(aJsonRet)]['tipo']      := (cAlias)->B1_TIPO
    aJsonRet[len(aJsonRet)]['um']        := (cAlias)->B1_UM
    aJsonRet[len(aJsonRet)]['armazem']   := (cAlias)->B1_LOCPAD
    (cAlias)->(DbSkip())
  EndDo

  if lRet
    oJsonRet:set(aJsonRet)
    ::SetResponse(EncodeUtf8(oJsonRet:toJSON()))
  endif

return lRet

/*/{Protheus.doc} WSMETHOD GET produtos
  serviço rest para retornar todos os produtos cadastrados
  @type  Function
  @author luis.silva
  @since 07/06/2022
  @version 
/*/
WSMETHOD POST incluiProdutos WSREST wsprodutos

  Local cJSON    := Self:GetContent() 
  Local oJsnBody := JsonObject():New()
  Local cRetJson := oJsnBody:FromJson(cJSON)
  Local nI       := 0
  Local cLogErro := ""
  Local lRet     := .T.
  Local aDados   := {}
  Local aErroAuto:= {}

  Private lMsErroAuto := .F.
  Private lAutoErrNoFile := .T.
  Private lMsHelpAuto :=.T.


  cRetJson := oJsnBody:FromJson(cJSON)

  if ValType(cRetJson) == "C"
    setrestfault(400, "Falha ao transformar texto em objeto json. Erro: " + cRetJson +".",.T.)
    lRet := .F.
    return lRet
  endIf
  
  if empty(oJsnBody['codigo'])
    setrestfault(400, "Informar dados para poder cadastrar produto",.T.)
    lRet := .F.
    return lRet
  endif

  SB1->(DbSetOrder(1))
  SB1->(DbSelectArea("SB1"))
  if SB1->(DbSeek(xFilial("SB1")+oJsnBody['codigo']))
    setrestfault(400, "Produto informado já existe",.T.)
    lRet := .F.
    return lRet
  else
      aDados := {{"B1_COD"    ,oJsnBody['codigo']       ,Nil},;
                {"B1_DESC"    ,oJsnBody['descricao']    ,NIL},;
                {"B1_TIPO"    ,oJsnBody['tipo']         ,Nil},;
                {"B1_UM"      ,oJsnBody['um']           ,Nil},;
                {"B1_LOCPAD"  ,oJsnBody['armazem']      ,Nil},;
                {"B1_PRVALID" ,oJsnBody['validade']     ,Nil},; 
                {"B1_POSIPI"  ,oJsnBody['ncm']          ,Nil},;
                {"B1_ORIGEM"  ,oJsnBody['origem']       ,Nil},;
                {"B1_RASTRO"  ,oJsnBody['usaLote']      ,Nil},;
                {"B1_LOCALIZ" ,oJsnBody['usaEndereco']  ,Nil},;
                {"B1_XHIERA"  ,oJsnBody['hierarquia']   ,Nil}}

      MSExecAuto({|x,y| Mata010(x,y)},aDados,3)
    SB1->(DbCloseArea())

  endIf

  If lMsErroAuto
    aErroAuto := GetAutoGRLog()
    For nI := 1 To Len(aErroAuto)
      cLogErro += StrTran(StrTran(aErroAuto[nI], "<", ""), "-", "") + " "
      ConOut(cLogErro)
    Next nI
    setrestfault(400, "Falha ao cadastrar produto, "+cLogErro,.T.)
    lRet := .F.
  Else
    setrestfault(200, "Produto cadastrado com sucesso!",.T.)
  Endif

return lRet
