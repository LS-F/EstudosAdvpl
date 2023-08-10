#INCLUDE 'Totvs.ch'
#INCLUDE 'Protheus.ch'


/*/{Protheus.doc} User Function zCadastro
    (long_description)
    @type  Function
    @author Luis
    @since 23/07/2023
    @version 1.0
    
    /*/

 //Criando uma janela no Protheus   
User Function zJanela()
    Local cTitulo := 'Cadastro de fornecedor'
    Local cNome := Space(60)
    Local cEndereco := Space(100)

//Declaração de Objetos
    Local oJanela  
    Local oNome
    Local oEndereco
    Local oButton1

    oJanela := TDialog():New(180,180,550,700,cTitulo,,,,,CLR_BLACK,CLR_WHITE,,,.T.)

    cNome :='Digite  o texto aqui'
    oNome := TGet():New( 20,20,{|u|IIF(PCount()>0,cNome,cNome:=u)},oJanela,096,009, "@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cNome,,,, )

    cEndereco :='Digite o seu endereco'
    oEndereco := TGet():New( 35,20,{|u|IIF(PCount()>0,cEndereco,cEndereco:=u)},oJanela,096,009, "@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cEndereco,,,, )

    oButton1 := TButton():New( 60, 20, "Verificar conteúdo",oJanela,{||MSGINFO(cNome,"Texto Digitado")}, 60,10,,,.F.,.T.,.F.,,.F.,,,.F. ) 




    oJanela:ACTIVATE(,,,.T.)
    




    //Private xNome := 
    
Return 
