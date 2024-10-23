// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OperacoesBasicas {

    function adicionar(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    function subtrair(uint a, uint b) public pure returns (uint) {
        require(b <= a, "Resultado seria negativo");
        return a - b;
    }
}

contract ContratoDerivado is OperacoesBasicas {

    function multiplicar(uint a, uint b) public pure returns (uint) {
        return a * b;
    }
}
