
-- 1. Quantos pedidos por cliente?
     SELECT 
            c.nome, 
            COUNT(p.idPedido) AS total_pedidos
     FROM cliente c
     LEFT JOIN pedido p ON c.idCliente = p.idCliente
     GROUP BY c.nome
     ORDER BY total_pedidos DESC;
	 
-- 2. Valor total de cada pedido (atributo derivado)
     SELECT 
         p.idPedido,
         SUM(pp.quantidade * pr.preco) + p.frete AS valor_total
     FROM pedido p
     JOIN pedido_produto pp ON p.idPedido   = pp.idPedido
     JOIN produto pr        ON pr.idProduto = pp.idProduto
     GROUP BY p.idPedido;
	 
-- 3. Produtos com estoque maior que 20
     SELECT 
           pr.nome, 
           pe.quantidade
     FROM produto pr
     JOIN produto_estoque pe ON pr.idProduto = pe.idProduto
     WHERE pe.quantidade > 20
     ORDER BY pe.quantidade DESC;
	 
-- 4. Fornecedores e seus produtos
     SELECT 
           f.razao_social, 
           pr.nome
     FROM fornecedor f
     JOIN fornecedor_produto fp ON f.idFornecedor = fp.idFornecedor
     JOIN produto pr            ON pr.idProduto   = fp.idProduto;
	 
-- 5. Clientes que fizeram mais de 1 pedido (HAVING)
     SELECT 
           c.nome, 
           COUNT(p.idPedido) AS total
     FROM cliente c
     JOIN pedido p ON c.idCliente = p.idCliente
     GROUP BY c.nome
     HAVING COUNT(p.idPedido) > 1;
	 
-- 6. Relação Produto x Fornecedor x Estoque
     SELECT 
         pr.nome AS produto,
         f.razao_social AS fornecedor,
         e.local,
         pe.quantidade
     FROM produto pr
     JOIN fornecedor_produto fp ON pr.idProduto   = fp.idProduto
     JOIN fornecedor f          ON f.idFornecedor = fp.idFornecedor
     JOIN produto_estoque pe    ON pe.idProduto   = pr.idProduto
     JOIN estoque e             ON e.idEstoque    = pe.idEstoque;
	 
