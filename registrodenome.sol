// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract RegistroDeNome {
    string private nome;

    
function salvarNome(string memory novoNome) public {
    nome = novoNome;
}

function verNome() public view returns (string memory) {
    return nome;
}

}