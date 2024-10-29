// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface TokenSimples {
    function saldo(address conta) external view returns (uint256);
}

contract ChecarSaldo {
    function verSaldo(address enderecoToken, address usuario) public view returns (uint256) {
        TokenSimples tokenContrato = TokenSimples(enderecoToken); 
        return tokenContrato.saldo(usuario);                   
    }
}
