# Sistema de Gerenciamento - e-commerce
Bem-vindo ao repositório do Sistema de Gerenciamento e-commerce! Este esquema de banco de dados foi criado para uma aplicação de gerenciamento de vendas, clientes, produtos, pagamentos, fornecedores e entregas. Abaixo, você encontrará uma visão geral das principais entidades do banco de dados.

# Entidades Principais
**clients
Armazena informações dos clientes, incluindo nome, tipo de pessoa, CPF, e endereço.

product
Armazena informações dos produtos, como nome, categoria, avaliação, vendedor e tamanho.

payments
Registra os pagamentos dos clientes, incluindo tipo de pagamento e limite disponível.

cardMain
Contém informações do cartão de crédito principal dos clientes, como número, agência e data de validade.

cardSecond
Armazena informações do segundo cartão de crédito dos clientes.

orders
Registra os pedidos dos clientes, incluindo status, descrição e método de pagamento.

productStorage
Gerencia o estoque de produtos, controlando a quantidade disponível.

supplier
Armazena informações dos fornecedores, como nome e contato.

seller
Contém informações dos vendedores, incluindo nome, avaliação, localização e contato.

productSeller
Relaciona produtos aos vendedores, controlando a quantidade disponível.

productOrder
Relaciona produtos aos pedidos, controlando a quantidade e a disponibilidade.

storageLocation
Relaciona produtos às localizações de armazenamento no estoque.

delivery
Registra informações das entregas, incluindo código de rastreamento, status e endereço.

Nota
Este esquema de banco de dados foi projetado para fins educacionais.
