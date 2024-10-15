// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegistroPessoas {

    struct Pessoa {
        string nome;
        uint256 idade;
        string estado;
        string enderecoCompleto;
        string cep;
        string email;
    }
    
    address public administrador;
    mapping(string => Pessoa) private registrosPorCpf; 

    string[] private listaCpfs; 
    address[] private listaUsuarios;

    event RegistroRealizado(string indexed cpf, string nome);

    modifier apenasAdmin() {
        require(msg.sender == administrador, "Apenas o administrador pode executar essa operacao");
        _;
    }

    constructor() {
        administrador = msg.sender; 
    }

    function validarDados(
        string memory _cpf,
        uint256 _idade
    ) private pure { 
        require(bytes(_cpf).length == 11, "CPF deve ter 11 caracteres"); // NAO SEI FAZER ... Adicionado: Validação de CPF e Idade

        for (uint256 i = 0; i < bytes(_cpf).length; i++) {
            require(bytes(_cpf)[i] >= 0x30 && bytes(_cpf)[i] <= 0x39, "CPF deve conter apenas numeros");
        }
        
        require(_idade > 0 && _idade <= 120, "Idade deve ser um numero positivo e razoavel");
    }

function registrarPessoa(
    string memory _cpf,
    string memory _nome,
    uint256 _idade,
    string memory _estado,
    string memory _enderecoCompleto,
    string memory _cep,
    string memory _email
    ) public {
        validarDados(_cpf, _idade); 

        require(bytes(registrosPorCpf[_cpf].nome).length == 0, "CPF ja registrado");

        Pessoa memory novaPessoa = Pessoa(_nome, _idade, _estado, _enderecoCompleto, _cep, _email);
        registrosPorCpf[_cpf] = novaPessoa;
        listaCpfs.push(_cpf);

        if (bytes(registrosPorCpf[_cpf].nome).length == 1) {
            listaUsuarios.push(msg.sender);
        }

        emit RegistroRealizado(_cpf, _nome);
    }

    function verDadosPorCpf(string memory _cpf) public view apenasAdmin returns (
        string memory, uint256, string memory, string memory, string memory, string memory
    ) {
        require(bytes(registrosPorCpf[_cpf].nome).length != 0, "CPF nao registrado");
        Pessoa memory pessoa = registrosPorCpf[_cpf];
        return (pessoa.nome, pessoa.idade, pessoa.estado, pessoa.enderecoCompleto, pessoa.cep, pessoa.email);
    }

    function contarPessoasRegistradas() public view apenasAdmin returns (uint256) {
        return listaCpfs.length;
    }

    function verTodosCpfs() public view apenasAdmin returns (string[] memory) {
        return listaCpfs;
    }
}
