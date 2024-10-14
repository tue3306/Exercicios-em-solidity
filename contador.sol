// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContadorSimples {
int256 public contador;

function incrementar() public {
    contador += 1;
}

function decrementar() public {
    contador -= 1;
}

function resetar() public {
    contador = 0;
}
}
