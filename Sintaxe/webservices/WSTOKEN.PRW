#include "PROTHEUS.CH"
#include "RESTFUL.CH"
#include "rwmake.ch"
#include "TbiConn.ch"

static cUrl :="http://localhost:9971/rest/"
static cLogin:= "admin"
static cPass := "MSIGA"

WSRESTFUL wstoken DESCRIPTION "WS para validar credenciais protheus"
    WSMETHOD POST login DESCRIPTION "Pega dados de acesso" WSSYNTAX "/login" PATH "/login" 
END WSRESTFUL


WSMETHOD POST login WSREST wstoken
    Local cJSON     := Self:GetContent() // Pega a string do JSON
    Local oJsnBody  := JsonObject():New()
    Local cRetJson  := oJsnBody:FromJson(cJSON)
    Local cToken    := ""

    If ValType(cRetJson) == "C"
        setrestfault(400, "Falha ao transformar texto em objeto json. Erro: " + cRetJson +".",.T.)
        lRet := .F.
        return lRet
    EndIf

    cToken := getToken()

return 

Static Function getToken()
    Local cToken     As Character // Bearer Token
    Local cPath      As Character // endpoint path
    Local cGrantType As Character // grant type
    Local cUserName  As Character // user name
    Local cPassword  As Character // password
    Local cResponse  As Character // response
    Local cStatus    As Character // status code
    Local cError     As Character // error message
    Local oRest      As Object    // FWRest() object
    Local jResponse  As Json      // response JsonObject
    Local aHeader    As Array     // request header
 
    // set values
    cGrantType := "password"                         
    cPath      := "api/oauth2/v1/token?grant_type=" + cGrantType + "&username=" + Escape(cLogin) + "&password=" + Escape(cPass) // type here token endpoint
    aHeader    := {}
    cToken     := ""
 
    Aadd(aHeader, "Authorization: Basic " + Encode64(cLogin + ":" + cPass))
    Aadd(aHeader, "Content-Type: application/json")
 
    // FWRest() object
    oRest := FWRest():New(cUrl)
    oRest:setPath(cPath)
    oRest:nTimeOut := 360

    conout("buscando token...")
    conout("cURL: " + cUrl)
    conout("cPath: " + cPath)

    // request
    If (oRest:Post(aHeader))
        cResponse := oRest:GetResult()
        jResponse := JsonObject():New()

        If (ValType(jResponse:fromJson(cResponse)) == 'U')
            cToken := jResponse['access_token']
        EndIf
    Else
        cError  := oRest:GetLastError()
        cStatus := oRest:GetHTTPCode()
        conout("cError: " +cError)
        conout("cStatus: " +cStatus)
    EndIf
Return cToken
