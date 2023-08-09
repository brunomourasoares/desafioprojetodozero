use pizzaria;

-- clientes
insert into cliente (nome, endereco, telefone) values 
	('Bruno', 'Rua 1', '1234567891'),
	('Marcela', 'Rua 2', '1987654321'),
	('Douglas', 'Rua 3', '1472583690'),
	('Vera', 'Rua 4', '2581473690'),
	('Carlos', 'Rua 5', '3692581470');

-- ingredientes em estoque
insert into estoque (codigo, descricao, quantidade, preco) values
	(1, 'Queijo', 10, 29.00),
	(2, 'Calabresa', 10, 25.00),
	(3, 'Frango', 10, 23.00),
	(4, 'Bacon', 10, 39.00),
	(5, 'Lombo canadense', 10, 47.00);

-- tipos de pizzas
insert into pizza (codigo, descricao, preco_peq, preco_med, preco_grd, tempomedio) values
	(1, 'Pizza de queijo', 30.00, 40.00, 50.00, '00:30:00'),
	(2, 'Pizza de calabresa', 30.00, 40.00, 50.00, '00:30:00'),
	(3, 'Pizza de frango', 30.00, 40.00, 50.00, '00:30:00'),
	(4, 'Pizza de bacon', 30.00, 40.00, 50.00, '00:30:00'),
	(5, 'pizza de lombo canadense', 30.00, 40.00, 50.00, '00:30:00');

-- associação entre pizza e estoque
insert into ingredientes (codpizza, codestoque) values
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);

-- lista de bebidas (R = Refrigerante, C = Cerveja, O = Outros)
insert into bebida (codigo, descricao, tipo, quantidade, preco) values
	(1, 'Brahma Lata', 'C', 5, 34.00),
	(2, 'Coca-cola Lata', 'R', 5, 36.00),
	(3, 'Mate leao Copo', 'O', 2, 30.00),
	(4, 'Guarana Antartica Lata', 'R', 5, 33.00),
	(5, 'Antarctica Lata', 'C', 5, 31.00);

-- lista de conta (Tipo L = venda local, D = delivery, Situacao 0/false = cartao e 1/true = dinheiro)
insert into conta (situacao, tipo, cliente, horario) values
	(1, 'L', 1, '2023-07-31 18:40:31'),
	(0, 'L', 2, '2023-07-31 19:51:49'),
	(1, 'D', 3, '2023-07-31 20:26:11');

-- pizzas consumidas
insert into conta_pizza (codigo, pizza, quantidade, preco) values
	(1, 5, 1, 40.00),
	(2, 3, 1, 40.00),
	(3, 4, 1, 50.00);

-- bebidas consumidas
insert into conta_bebida (codigo, bebida, quantidade, preco) values
	(1, 2, 1, 3.50),
	(2, 3, 1, 3.00),
	(3, 4, 1, 3.50);

-- compras feitas ao fornecedor
insert into compra (dia) values
	('2023-07-20'),
   	('2023-07-23'),
	('2023-07-25'),
	('2023-07-28'),
   	('2023-07-28'),
	('2023-07-30');

-- lista de fornecedores
insert into fornecedor (cnpj, nome, telefone, endereco) values
	('012345678910123', 'Sol de Minas', '92345678910', 'Rua 1 de Minas Gerais'),
	('014725836902583', 'Sadia', '98752136485', 'Rua 2 de Sao paulo'),
	('036925814702581', 'Ambev', '95132654871', 'Rua 3 do Rio de janeiro'),
	('012398745632108', 'Perdigao', '98726138452', 'Rua 4 do Rio grande do sul'),
	('085274196302589', 'Coca-cola', '97643125852', 'Rua 5 do Rio de Janeiro');

-- pedido de compras (estoque bebidas)
insert into compra_bebida values
	(1, 1, 15, 3),
  	(2, 2, 20, 5),
	(3, 3, 25, 5);
    
-- pedido de compras (estoque pizza)
insert into compra_estoque values
	(4, 1, 5, 1),
	(5, 2, 5, 2),
	(6, 5, 5, 4);