#INCLUDE "Protheus.ch"
#include "Totvs.ch"
#include "Topconn.ch"
#include "Tbiconn.ch"
#Include 'FWMVCDef.ch'
#INCLUDE "COLORS.CH"
#INCLUDE "RPTDEF.CH"
#INCLUDE "FWPrintSetup.ch"

User Function DEBUG()    
	
	RpcSetType(3)
	RpcSetEnv("99", '01', "admin", "MSIGA", "EST", GetEnvServer())
	SetModulo("SIGAEST", "EST")
	SetHideInd(.T.)

    U_WSTOKEN()

Return
