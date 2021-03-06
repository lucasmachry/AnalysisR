#' ---
#' title: "Tipos numéricos da linguagem R"
#' output: html_notebook
#' ---
#' 
#' ## Tutorial aos tipos de dados numéricos da linguagem R
#' 
#' ### Introdução
#' 
#' A linguagem R possui tipos primitivos, definidos junto à própria linguagem de programação, e tipos complexos/estruturados que são construídos utilizando os mecanismos de orientação a objetos da linguagem.
#' 
#' R é uma linguagem orientada a objetos, o que facilita a criação de novos tipos de dados e suporte às operações comuns da linguagem por meio da sobrecarga de operadores e funções. Outros tipos de dados serão vistas no decorrer da disciplina.
#' 
#' Neste material utilizaremos os tipos primitivos numéricos da linguagem, tanto para introdução aos tipos quanto para introdução de outros conceitos fundamentais da linguagem.
#' 
#' ### Tipos numéricos
#' 
#' O R define, de forma nativa, 2 (ou 3!) tipos numéricos:
#' 
#' - _integer_
#'     - Os números inteiros, positivos ou negativos.
#' - _numeric_
#'     - Números reais, também conhecidos como _double_.
#' 
#' #### Inteiros
#' 
#' Inteiros são números de 32 bits de comprimento, restritos ao intervalo $+/-2*10^9$. Números inteiros fora deste intervalo precisam ser representados com o tipo **numeric**. 
#' 
#' Os testes abaixo mostram uma particularidade sobre os tipos numéricos. Constantes numéricas são sempre consideradas como double/numeric, devendo ser convertidas para inteiro se necessário.
#' 
## ------------------------------------------------------------------------
if( is.numeric(42) ) {
  print("Numérico")

  if( is.integer(42) ) {
    print("Inteiro")

  } else {
    if( is.double(42) ) {
      print("Não é Inteiro, é Double!!")
    }
  }
}

#' 
#' Para termos inteiros temos que convertê-los para este tipo. Duas formas de converter para inteiros são:
#' 
## ------------------------------------------------------------------------
if( is.integer(42L) ) { ### Detalhe para o L
  print("É inteiro!")  
}
#' Nota. Colocando as.integer, ele quebra e IGNORA os número depois da quebra.
if( is.integer( as.integer(42.9) )) {
  print("É inteiro!")  
}

#' 
#' #### Números reais / _double_
#' 
#' Numeric e double são sinônimos na linguagem R. Ambos são representações de números de ponto flutuante com precisão dupla conforme definido pelo padrão [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754) para o tipo [binary64](https://en.wikipedia.org/wiki/IEEE_754#Basic_and_interchange_formats). A linguagem R não possui tipo de dado que represente ponto flutuante com precisão simples (binary32).
#' 
## ------------------------------------------------------------------------
# a função print possibilita a aplicação de algumas formatações. No exemplo abaixo especifiquei a quantidade de casas decimais que devem ser exibidas. 
print(pi, digits=10)

# a função paste combina os atributos em uma única string, utilizando para delimitação o espaço em branco (por padrão)
paste("O tipo de pi é", class(pi))

#' 
## ------------------------------------------------------------------------
print(12.345)

#' 
#' #### O "terceiro tipo"
#' 
#' O "terceiro tipo" é o tipo _logical_ (lógico, ou booleano), que compreende os valores `FALSE` e `TRUE`. 
#' 
## ------------------------------------------------------------------------
# A atribuição com seta pode parecer estranha à primeira vista, pois a maioria das linguagens utiliza o sinal de igual. Há uma inclinação matemática de não sobrecarregar a semântica do sinal de igualdade, mas a linguagem também suporta o `=` para atribuição. Recomendo utilizar a seta.
eh_numerico <- is.numeric( 42 ) 

print(eh_numerico)

#' 
## ------------------------------------------------------------------------
if( eh_numerico ) {
  print("42 é numérico (mas já sabemos disso)")
  
  if( is.logical(eh_numerico) ) {
    print("Todo teste resulta em um valor lógico")
  }
}

#' 
#' A linguagem R trata o tipo _logical_ de forma intercambiável, assumindo automaticamente como 0 (`FALSE`) e 1 (`TRUE`)  quando combinados em operações com os outros tipos numéricos (_integer_ e _numeric_).
#' 
## ------------------------------------------------------------------------
print( eh_numerico + 0 )
print( eh_numerico * 2 )
print( is.numeric(eh_numerico + 0) )

#' 
#' 
#' 
#' ### _Missing Values_
#' 
#' Uma característica que posiciona a linguagem R como uma linguagem para análise de dados é a existência de valores próprios para representar valores ausentes. A constante `NA` (_Not Available_) representa valores ausentes nos diferentes tipos de dados da linguagem.
#' 
## ------------------------------------------------------------------------
valor_presente <- 42
valor_ausente <- NA
test_null <- NULL

print(paste("Soma com NA resulta em", 42 + NA))
print( is.na(valor_ausente) )

print( is.na(test_null) )
#' 
#' ### _Not a Number_, Inf e -Inf
#' 
#' A constante `NaN` é o resultado de operações indefinidas. Inf e -Inf surgem em situações onde não é possível expressar o resultado de uma operação.
#' 
#' #### Divisão por Zero
#' 
#' Divisão por Zero é a causa mais comum para valores como estes. Em R, `Inf` é o resultado de um número diferente de Zero dividido por Zero, enquanto que `NaN` é o resultado de 0 / 0
#' 
## ------------------------------------------------------------------------
1 / 0
0 / 0

#' 
#' 
#' 
#' 
#' 
