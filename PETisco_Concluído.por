//Obs.: O sistema funciona apenas no aplicativo do Portugol Studio, não servindo para o Portugol Web Studio.//
/*Algoritmo construído para simular um caixa registrador de um petshop, cujo nome é PETisco Pershop, no qual os produtos serão 
registrados pelo funcionário.*/
programa {
  inclua biblioteca Util --> u
  inclua biblioteca Calendario --> C
  inclua biblioteca Matematica --> M
  inclua biblioteca Mouse --> m
  inclua biblioteca Graficos --> g
  const inteiro LarguraT = 765
  const inteiro AlturaT = 625
  //Para a tela de login funcionar, tem que baixar a imagem na mesma pasta do projeto.
  inteiro logo = g.carregar_imagem("petisco.png")
  inteiro horarioH = C.hora_atual(falso)
  inteiro horarioM = C.minuto_atual()
  inteiro diaAtual = C.dia_mes_atual()
  inteiro mesAtual = C.mes_atual()
  inteiro anoAtual = C.ano_atual()
  cadeia Cumprimento = ""
  cadeia user = "admin"
  cadeia senha = "admin"
  inteiro tentativas  = 0
  logico logado = falso
  logico repete = falso
  real valorTotal = 0.0
  logico faturaNota = verdadeiro 
  inteiro quantidade[10]
  
  funcao inicio() {
  	desenharTela()
	enquanto(verdadeiro){
		cor_FundoPadrao()
		horarioAtual(horarioH)
		interacaoBotaoLogar()
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(18.0)
		g.desenhar_texto(50, 30,Cumprimento + " Seja bem-vinde à PETisco PetShop!")
		g.desenhar_texto(50, 50, "Agora são " + horarioH + " hora(s) e "+ horarioM + " minuto(s)")
		g.renderizar()
	}	
  }

  // Cadastra cliente
  funcao acessoFuncionario() {
	escreva("Por favor, digite suas credenciais de acesso!")

     enquanto(tentativas < 3 e logado == falso) {
      cadeia entrada_usuario
      cadeia entrada_senha

      escreva("\nUsuário: ")
      leia(entrada_usuario)

      escreva("\nSenha: ")
      leia(entrada_senha)

      verificaCredenciais(entrada_usuario, entrada_senha)
     }

     se (logado) {
 		ProgramaPrincipal()
	}
 }
     // verificar a credencial do cliente, com as variaveis(user e senha)
	funcao verificaCredenciais(cadeia entrada_usuario, cadeia entrada_senha) {
	  se(entrada_usuario == user e entrada_senha == senha) {
	    escreva("\nAcesso liberado!")
	    logado = verdadeiro      
	  }
	  senao {
	    tentativas++
	    se(tentativas < 3) {
	    	 limpa()
	      escreva("Pensa mais um pouquinho... Senha ou usuário inválidos!")
	    } senao {
	      escreva("Acesso bloqueado!")
	      g.fechar_janela()
	    }
	  }
	}

     // detalhar a tela login.
	funcao desenharTela() {
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_titulo_janela("PETisco PetShop")
		g.definir_dimensoes_janela(LarguraT, AlturaT)
		
	}

	//detalhar a tela de login.
	funcao cor_FundoPadrao() {
		g.desenhar_imagem(0, 0, logo)
	}

	//mostrar a hora na tela de login.
	funcao horarioAtual(inteiro hora) {
		se(hora >= 5 e hora < 12){
			Cumprimento = "Bom dia!"
		}senao se(hora >= 12 e hora <= 17){
			Cumprimento = "Boa tarde!"
		}senao{
			Cumprimento = "Boa noite!"
		}
	}

	//Verifica a posição do mouse.
	funcao logico mouse(inteiro x, inteiro y, inteiro a, inteiro b){
		se(m.posicao_x() >= x e m.posicao_y() >= y e m.posicao_x() <= x+a e m.posicao_y() <= y+b) {
		   retorne verdadeiro
		}
		retorne falso
	 }

	//Vefirica a interação do botão
	funcao interacaoBotaoLogar(){
		g.definir_cor(g.criar_cor(100, 100, 100))
		g.desenhar_retangulo(300, 500, 160, 35, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(360, 510, "LOGAR")	
		se(mouse(300, 500, 160, 35) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
			g.desenhar_retangulo(210, 320, 160, 35, verdadeiro, falso)
			g.definir_cor(g.COR_PRETO)
		     g.definir_tamanho_texto(20.0)
		     g.minimizar_janela()
			acessoFuncionario()
		}
	}

  //Toda a logica de lista os produtos, selecionar o produto e selecionar a quantidade.
  funcao ProgramaPrincipal() {
    escreva("\n-------------------------------------------------------- \n- PETisco - \n------------------------------------------"
    ,"--------------\n\nBem-vindo ao nosso petShop, aqui você poderá encontrar os \nmelhores produtos para seu animalzinho.")

    cadeia produtos[10] = 
    {"Ração Premium para Cães", "Coleira de Couro para Gatos", "Brinquedo de Pelúcia para Cachorros", 
    "Shampoo para Cães com Aloe Vera", "Caixa de Areia Higiênica para Gatos", "Máquina de tosa", 
    "Tapete gramado para cães", "Cama para cachorros e gatos","Obstáculo para gatos", "Coleira de couro para cães"}
    real valores[10] = {45.99, 15.50, 8.99, 12.75, 19.9, 85.9, 33.9, 44.5, 119.9, 15.4}
    inteiro produto_selecionado = 0
    
    faca{
        para(inteiro produto = 0; produto < (u.numero_elementos(produtos)); produto++) {
	        escreva("\n[ ", produto + 1, " ] ", produtos[produto], " --> R$", valores[produto])
        }
	   
	   escreva("\n[ 0 ] Sair do programa ou qualquer outro número para sair da tela de seleção de produtos\n")
	   escreva("\nDigite o número referente ao produto:\n")
	   leia(produto_selecionado)
	   
	   se((produto_selecionado > 0) e (produto_selecionado <= u.numero_elementos(produtos))) {
	       
	       escreva("\nDigite a quantidade desejada por este produto:\n")
	       inteiro produto_quantidade
	       leia(produto_quantidade)
	       
	       se(produto_quantidade > 0){
	          quantidade[produto_selecionado - 1] += produto_quantidade
	       }
	   } senao {
	      repete = falso
	   }
	   
	   limpa()
    }enquanto(repete == verdadeiro)
    
	    se(produto_selecionado > 0 e produto_selecionado < 10) {
	      contabiliza(valores, quantidade)
	      pagamento(valorTotal)
	      se(faturaNota == verdadeiro) {
	        notaFiscal(produtos, valores, quantidade)
	      }
	    }senao {
	    	   g.fechar_janela()
	    }
  }

  //informa o valor total da compra.
  funcao contabiliza(real valores[], inteiro quantidades[]) {
    para(inteiro i = 0; i < u.numero_elementos(valores); i++) {
      valorTotal += (valores[i] * quantidades[i])
    }
  }

  //informa o produto o valor do produto e quantidade. 
  funcao exibeFatura(cadeia produtos[], real valores[], inteiro quantidades[]) {
  	para(inteiro i = 0; i < u.numero_elementos(produtos); i++) {
     	se(quantidades[i] > 0) {
          	escreva("\nProduto: ", produtos[i], ", Valor Unitário: ", M.arredondar(valores[i],2),
          	", Quantidade: ", quantidade[i])
          } 
     }
  }  

  funcao temporizador(inteiro tempo) {
      u.aguarde(tempo)
  }

  //Gera a nota fiscal
  funcao notaFiscal(cadeia produtos[], real valores[], inteiro quantidades[]) {
    cadeia nomeCliente
    escreva("\nPor favor, digite o nome do cliente: ")
    leia(nomeCliente)
    escreva("\nGerando...\n")
    temporizador(3000)
    escreva("\nCliente: ", nomeCliente)
    exibeFatura(produtos, valores, quantidades)
    escreva("\nValor total da compra: ", M.arredondar(valorTotal,2))
    escreva("\n- PETisco -")
    escreva("\nCNPJ: 92.249.031/0001-07")
    escreva("\nData: ", diaAtual,"/", mesAtual,"/", anoAtual)
    escreva("\nHorário: ", horarioH, ":", horarioM)
    escreva("\nOBRIGADO E VOLTE SEMPRE!!!\n\n")
    temporizador(3000)
    g.fechar_janela()
  }

  //Seleciona a forma de pagamento, e se o cliente escolher a opção de dinheiro informa o troco se o troco não for menor que 0.
  funcao pagamento(real conta){
  	
  	real valorcliente, troco
  	inteiro formaPagamento, parcela, cartao
	
	faca {
	 escreva("\nQual será a forma de pagamento?\n\n(1) Dinheiro\n(2) Crédito\n(3) Débito\n")
	 leia(formaPagamento)

        escolha(formaPagamento){
           caso 1: //Dinheiro
              faca{
                 escreva("O total de sua compra foi de R$ ", M.arredondar(conta,2), "\nDigite o valor de pagamento:\n")
                 leia(valorcliente)
                 troco = valorcliente - conta
                 faturaNota = verdadeiro
                 se(troco < 0) {
                    escreva("Desculpe, valor menor que a compra!\n\n")
                 }senao {
                    escreva("\nTotal da compra R$ ", M.arredondar(conta,2), "\nValor do pagamento R$ ", M.arredondar(valorcliente,2))
                    se(troco > 0) {
            	        escreva("\nTroco: R$ ", M.arredondar(troco,2),"\n")
                    }
                    faturaNota = verdadeiro
                 }
        } enquanto(troco < 0)
        pare
        
        caso 2: //Crédito
          parcelacred(conta)
        pare

        caso 3: //Débito
          escreva("\nO total de sua compra foi de R$ ", M.arredondar(conta,2), "\nA opção desejada foi cartão de débito\n")
          faturaNota = verdadeiro
        pare

        caso contrario:
          escreva("\n\nERRO! OPÇÃO INVÁLIDA!\n\n")
      }
    }enquanto(formaPagamento>=4)	
  }

  //Essa função mostra o valor da compra parcelado em 3 vezes, se o cliente selecionar cartão de crédito.
  funcao parcelacred(real conta) {
    
    inteiro parcela		
    
    faca {
      escreva("\nO total de sua compra foi de R$ ", M.arredondar(conta,2))
      escreva("\nEm quantas parcelas deseja realizar a compra?\n")
      escreva("\n(1) 1 parcela de R$", M.arredondar(conta,2), "\n(2) 2 parcelas de R$",M.arredondar(conta/2, 2),
      "\n(3) 3 parcelas de R$",M.arredondar(conta/3, 2),"\n")
      
      leia(parcela)
      escolha(parcela){ 
      caso 1:
        bandeiracred()
        escreva("\nCompra solicitada no crédito rotativo\n")
      pare
      caso 2:
        bandeiracred()
        escreva("\nCompra solicitada parcelada em 2x de R$ ", M.arredondar(conta/2, 2), "\n")
        faturaNota = verdadeiro
      pare
      caso 3:
        bandeiracred()
        escreva("\nCompra solicitada parcelada em 3x de R$ ", M.arredondar(conta/3, 2), "\n")
        faturaNota = verdadeiro
      pare
      caso contrario:
        escreva("\n\nERRO! OPÇÃO INVÁLIDA!\n\n")
      }
    }enquanto(parcela >= 4)
  }

  //Essa função mostra o valor total da compra e passa no cartão de débito.
  funcao bandeiracred() {
    
    inteiro cartao	
    
    faca{
      escreva("\nQual a bandeira do seu cartão:\n\n(1) Credicard\n(2) Mastercard\n(3) American Express\n(4) Hipercard\n")
      leia(cartao)
      escolha(cartao){
      caso 1: 
        escreva("\nBandeira solicitada: Credicard")
        faturaNota = verdadeiro
      pare
      caso 2: 
        escreva("\nBandeira solicitada: Mastercard")
        faturaNota = verdadeiro
      pare
      caso 3:
        escreva("\nBandeira solicitada: American Express")
        faturaNota = verdadeiro
      pare
      caso 4: 
        escreva("\nBandeira solicitada: Hipercard")
        faturaNota = verdadeiro
      pare
      caso contrario:
        escreva("\n\nERRO! OPÇÃO INVÁLIDA!\n\n")
      }
    } enquanto(cartao >= 5)
  }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6324; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9975; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */