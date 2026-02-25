
--Cliente 
CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE cliente_pf (
    idCliente INT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE cliente_pj (
    idCliente INT PRIMARY KEY,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

--Produto
CREATE TABLE produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco FLOAT NOT NULL
);

--Fornecedor
CREATE TABLE fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL
);

--Produto disponibilizado por fornecedor
CREATE TABLE fornecedor_produto (
    idFornecedor INT,
    idProduto INT,
    PRIMARY KEY (idFornecedor, idProduto),
    FOREIGN KEY (idFornecedor) REFERENCES fornecedor(idFornecedor),
    FOREIGN KEY (idProduto) REFERENCES produto(idProduto)
);

--Estoque
CREATE TABLE estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    local VARCHAR(100)
);

CREATE TABLE produto_estoque (
    idProduto INT,
    idEstoque INT,
    quantidade INT,
    PRIMARY KEY (idProduto, idEstoque),
    FOREIGN KEY (idProduto) REFERENCES produto(idProduto),
    FOREIGN KEY (idEstoque) REFERENCES estoque(idEstoque)
);

--Pedido
CREATE TABLE pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    status VARCHAR(50),
    descricao VARCHAR(200),
    frete FLOAT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

--Relação Produto x Pedido
CREATE TABLE pedido_produto (
    idPedido INT,
    idProduto INT,
    quantidade INT,
    PRIMARY KEY (idPedido, idProduto),
    FOREIGN KEY (idPedido) REFERENCES pedido(idPedido),
    FOREIGN KEY (idProduto) REFERENCES produto(idProduto)
);

--Pagamento
CREATE TABLE pagamento (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    tipo VARCHAR(50),
    valor FLOAT,
    FOREIGN KEY (idPedido) REFERENCES pedido(idPedido)
);

--Entrega
CREATE TABLE entrega (
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    status VARCHAR(50),
    codigo_rastreio VARCHAR(100),
    FOREIGN KEY (idPedido) REFERENCES pedido(idPedido)
);
