// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContratoBase {
    uint256 internal valor;

    function definirValor(uint256 _valor) public {
        valor = _valor;
    }

    function obterValor() public view returns (uint256) {
        return valor;
    }
}

contract Outrocontrato is ContratoBase {
    function incrementarValor() public {
        valor += 1;
    }
}
