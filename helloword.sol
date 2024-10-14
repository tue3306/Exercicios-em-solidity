// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
string public mensagem = "Hello world";

function alterarMensagem(string memory novaMensagem) public {
    mensagem = novaMensagem;
}
}
