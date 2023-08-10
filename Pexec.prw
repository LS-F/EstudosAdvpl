#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'FONT.CH'
#INCLUDE 'COLORS.CH'

/*/{Protheus.doc} User Function PEXEC
    Programa para executar rotinas através de um TGET
    @type  Function
    @author matheus.vinicius@totvspartners.com.br
    @since 19/08/2022
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
/*/
User Function PEXEC()
    Private cNomeFun   := Space(30)

    DEFINE MSDIALOG oExecFunc FROM  140,000 TO 250,200 TITLE "Executor de Funcoes" PIXEL 
		@ 05,05 TO 38,100 LABEL "Informe o nome da rotina." OF oExecFunc PIXEL
		
        oGet1      := TGet():New( 015,008,{|u| If(PCount()>0,cNomeFun:=u,cNomeFun)},oExecFunc,090,013,'',;
        {||fMontaFun(),VldFun()},CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cNomeFun",,)
		
		oBtn1      := TButton():New( 042,008,"Executar",oExecFunc,{|| IIF(!Empty(cNomeFun),&(cNomeFun),;
        MsgStop("Informe o nome da Funcao!","Atencao"))},030,010,,,,.T.,,"",,,,.F. )

        oBtn2      := TButton():New( 042,050,"Cancelar",oExecFunc,{|| oExecFunc:End()},030,010,,,;
        ,.T.,,"",,,,.F. )

	ACTIVATE MSDIALOG oExecFunc CENTERED ON INIT()

Return

/*/{Protheus.doc} fMontaFun
    ajusta o nome da funcao
    @type  User Function
    @author matheus.vinicius@totvspartners.com.br
    @since 19/08/2022
    @version version    
/*/
Static Function fMontaFun()
    cNomeFun := Alltrim(cNomeFun)

    If !("(" $ cNomeFun) .OR. !(")" $ cNomeFun)
        cNomeFun+="()"
    endif

return 

/*/{Protheus.doc} ImpDeAte
    valida a funcao digitada
    @type  User Function
    @author matheus.vinicius@totvspartners.com.br
    @since 19/08/2022
    @version version    
/*/
Static Function VldFun()
    Local lRet       := .T.
    Local cVldFuncao := StrTran( cNomeFun , "U_" , "" )
    Local lUserFunc  := .F.

    lUserFunc := "U_" $ Upper(cNomeFun)

    cVldFuncao := StrTran( cVldFuncao , "()" , "" )
    cVldFuncao := StrTran( cVldFuncao , "u_" , "" )

    If lUserFunc
        lRet := ExistBlock(cVldFuncao)
    ElseIf  lRet := FindFunction(cVldFuncao)
    EndIF

    If !lRet
        MsgStop("Fonte não compilado no RPO", "Atenção")
    EndIf
    
Return lRet
