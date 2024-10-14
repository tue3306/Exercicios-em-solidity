// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DepositosESaquesSimples {
    uint256 private saldo;

function depositar(uint256 _valor) public {
    saldo += _valor;
    }

function sacar(uint256 _valor) public {
    require(saldo >= _valor, "Saldo insuficiente");
    saldo -= _valor;
}

function consultarSaldo() public view returns (uint256) {
    return saldo;
}
}
