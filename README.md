# my-volume-control-autohotkey

## Objetivo

Script/Programa para remapear combinações de teclas dando funcionalidades diferentes das originais, neste caso imitar um teclado multimídia aumentando e diminuido o volume.

Neste exemplo a combinação das teclas `Crtl + X` aumenta 2 unidades o volume, a combinação `Crtl + V` diminui 2 unidades.

## Como usar

Com o script ativo na máquina o serviço rodando poderá ser observado na aba de tarefas do Windows com um ícone `H` verde no canto inferior direito.

Para alterar os comandos de controle de volume, altere o arquivo `volume.ahk` com as configurações desejadas. 

Além das teclas, pode-se alterar a taxa de variação do volume.

    ; Tecla Control (^) + Tecla X
    ^X::
    send {Volume_Up 2}
    return
    ; Tecla Control (^) + Tecla V
    ^V::
    send {Volume_Down 2}
    return

## Requisitos

Para que o script funcione corretamente, é necessário que o `SDK AutoHotKey` esteja instalado.

Para criar um instalador próprio, é necessário que o `SDK NSIS` esteja instalado.

## Desinstalação

  Para fechar o programa, ir na aba de notificações e clicar no ícone `H` verde.

  Para desinstalar basta executar o programa `unistall.exe` que está na pasta da instalação.

  Se o programa continuar sendo executado após a inicialiazação do Windows, remova-o da inicialização automática executando os seguintes passos:

   * Clicar nas teclas Windows + R
   * Digitar dentro do programa aberto `shell:startup`
   * Vai abrir uma janela, basta excluir o arquivo `volumeControl.bat`

## Fonte

* [AutoHotkey](https://www.autohotkey.com/) Documentação e sintaxe do SDK AutoHotKey
* [NSIS](https://nsis.sourceforge.io/Docs/) Documentação e sintaxe do SDK NSIS
  
