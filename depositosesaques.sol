// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DepositosESaques {
mapping(address => uint256) private saldos;

function depositar(uint256 _valor) public {
    saldos[msg.sender] += _valor;
}
 
function sacar(uint256 _valor) public {
    require(saldos[msg.sender] >= _valor, "Saldo insuficiente");
    saldos[msg.sender] -= _valor;
}
    
function consultarSaldo() public view returns (uint256) {
    return saldos[msg.sender];
}
 
function transferir(address destinatario, uint256 _valor) public {
    require(saldos[msg.sender] >= _valor, "Saldo insuficiente");

    saldos[msg.sender] -= _valor;
    saldos[destinatario] += _valor;
}
}
