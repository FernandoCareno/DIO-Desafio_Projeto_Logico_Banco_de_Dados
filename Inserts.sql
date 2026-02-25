
-- Clientes
INSERT INTO cliente (nome, email) VALUES ('João Silva', 'joao@email.com');
INSERT INTO cliente (nome, email) VALUES ('Empresa XPTO', 'contato@xpto.com');

INSERT INTO cliente_pf VALUES (1, '123.456.789-00');
INSERT INTO cliente_pj VALUES (2, '12.345.678/0001-00', 'XPTO LTDA');

-- Produtos
INSERT INTO produto (nome, categoria, preco)
VALUES ('Notebook', 'Eletronico', 3500),
       ('Mouse', 'Eletronico', 80);

-- Fornecedor
INSERT INTO fornecedor (razao_social, cnpj)
VALUES ('Fornecedor Tech', '11.111.111/0001-11');

INSERT INTO fornecedor_produto VALUES (1,1),(1,2);

-- Estoque
INSERT INTO estoque (local) VALUES ('SP'), ('PR');

INSERT INTO produto_estoque VALUES (1,1,10),(2,2,50);

-- Pedido
INSERT INTO pedido (idCliente, status, descricao, frete)
VALUES (1,'Processando','Compra online',50);

INSERT INTO pedido_produto VALUES (1,1,1),(1,2,2);

-- Pagamento
INSERT INTO pagamento (idPedido,tipo,valor)
VALUES (1,'Cartao',3660);

-- Entrega
INSERT INTO entrega (idPedido,status,codigo_rastreio)
VALUES (1,'Enviado','BR123456789');
