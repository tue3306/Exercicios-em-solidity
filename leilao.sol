// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract LeilaoSimples {

    address public donoLeilao;

    address public maiorLicitante;

    uint public maiorLance;

    bool public leilaoEncerrado;

    event NovoMaiorLance(address indexed licitante, uint valor);

    event LeilaoEncerrado(address vencedor, uint valor);

    constructor() {
        donoLeilao = msg.sender;
        leilaoEncerrado = false;
    }

    function licitar() external payable {
        require(!leilaoEncerrado, "Leilao ja foi encerrado.");

        require(msg.value > maiorLance, "Existe um lance maior ou igual ao enviado.");

        if (maiorLance != 0) {
            payable(maiorLicitante).transfer(maiorLance);
        }

        maiorLicitante = msg.sender;
        maiorLance = msg.value;

        emit NovoMaiorLance(maiorLicitante, maiorLance);
    }

    function encerrarLeilao() external {
        require(msg.sender == donoLeilao, "Apenas o dono do leilao pode encerrar.");

        require(!leilaoEncerrado, "Leilao ja foi encerrado.");

        leilaoEncerrado = true;

        emit LeilaoEncerrado(maiorLicitante, maiorLance);

        payable(donoLeilao).transfer(maiorLance);
    }
}
