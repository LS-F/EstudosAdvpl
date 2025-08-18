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

	SZ2->(DbSelectArea("SZ2"))
		RecLock('SZ2',.T.)
			SZ2->Z2_FILIAL := ""
			SZ2->Z2_MENU   := "001"
			SZ2->Z2_DESC   := "Produtos"
		MsUnlock()
	SZ2->(DbCloseArea())

    // U_WSTOKEN()

Return
