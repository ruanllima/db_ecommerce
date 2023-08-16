## Sistema de Gerenciamento - e-commerce

Este esquema de banco de dados foi criado para uma aplicação de gerenciamento de vendas, clientes, produtos, pagamentos, fornecedores e entregas de uma empresa que atua no mercado online. Foi desenvolvida integralmente utilizando a linguagem SQL. Abaixo, você encontrará informações sobre as tabelas e sua estrutura.
ㅤ
## ㅤ
## Tabelas do Banco de Dados

### Clients

Armazena informações dos clientes, incluindo nome, tipo de pessoa, CPF e endereço.


- **idClient**: Identificador único do cliente (Chave Primária).
- **pessoa**: Enumeração que indica se o cliente é uma pessoa física ou jurídica.
- **Cname**: Nome do cliente (pessoa física ou nome da empresa).
- **Minit**: Iniciais do nome do cliente (para pessoas físicas).
- **cpf**: CPF do cliente (obrigatório e único).
- **address**: Endereço do cliente.

### Product

Armazena informações dos produtos, como nome, categoria, avaliação, vendedor e tamanho.


- **idProduct**: Identificador único do produto (Chave Primária).
- **Pname**: Nome do produto.
- **category**: Categoria do produto (eletrônico, vestimenta, brinquedos, alimentos, móveis).
- **assessment**: Avaliação do produto (pontuação).
- **prodSeller**: Nome do vendedor do produto.
- **size**: Tamanho do produto.

### Payments

Registra os pagamentos dos clientes, incluindo tipo de pagamento e limite disponível.


- **idClient**: Referência ao cliente (Chave Estrangeira referenciando `Clients`).
- **id_payment**: Identificador único do pagamento (Chave Primária).
- **typePayment**: Método de pagamento (boleto, cartão, dois cartões, PIX).
- **limitAvailable**: Limite disponível para o pagamento.

### CardMain

Contém informações do cartão de crédito principal dos clientes.


- **nameClient**: Nome do cliente (Chave Estrangeira referenciando `Clients`).
- **cardNumber**: Número do cartão de crédito (único e obrigatório).
- **agency**: Agência do cartão.
- **data_vali**: Data de validade do cartão.
- **cvv**: Código de segurança do cartão.

### CardSecond

Armazena informações do segundo cartão de crédito dos clientes.


- **nameClient**: Nome do cliente (Chave Estrangeira referenciando `Clients`).
- **cardNumber**: Número do cartão de crédito (único).
- **agency**: Agência do cartão.
- **data_vali**: Data de validade do cartão.
- **cvv**: Código de segurança do cartão.

### Orders

Armazena informações dos pedidos feitos pelos clientes.


- **idOrder**: Identificador único do pedido (Chave Primária).
- **idOrderClient**: Referência ao cliente que fez o pedido (Chave Estrangeira referenciando `Clients`).
- **orderStatus**: Status do pedido (cancelado, confirmado, em processamento).
- **ordersDescription**: Descrição do pedido.
- **sendValue**: Valor do envio.
- **payment**: Método de pagamento do pedido.

### ProductStorage

Gerencia o estoque de produtos, controlando a quantidade disponível.


- **idProdStorage**: Identificador único do estoque (Chave Primária).
- **storageLocation**: Localização do estoque.
- **quantity**: Quantidade de produtos em estoque.

### Supplier

Armazena informações dos fornecedores.


- **idSupplier**: Identificador único do fornecedor (Chave Primária).
- **SocialName**: Nome social do fornecedor.
- **CNPJ**: CNPJ do fornecedor (único).
- **contact**: Contato do fornecedor.

### Seller

Contém informações dos vendedores.


- **idSeller**: Identificador único do vendedor (Chave Primária).
- **SocialName**: Nome social do vendedor.
- **AbstName**: Nome abreviado do vendedor.
- **CNPJ**: CNPJ do vendedor (único).
- **CPF**: CPF do vendedor.
- **SAssessment**: Avaliação do vendedor.
- **location**: Localização do vendedor.
- **contact**: Contato do vendedor.

### ProductSeller

Relaciona produtos aos vendedores, controlando a quantidade disponível.


- **idPseller**: Referência ao vendedor (Chave Estrangeira referenciando `Seller`).
- **idProduct**: Referência ao produto (Chave Estrangeira referenciando `Product`).
- **prodQuantity**: Quantidade de produtos disponíveis.

### ProductOrder

Relaciona produtos aos pedidos, controlando a quantidade e a disponibilidade.


- **idPOproduct**: Referência ao produto (Chave Estrangeira referenciando `Product`).
- **idPOorder**: Referência ao pedido (Chave Estrangeira referenciando `Orders`).
- **poQuantity**: Quantidade de produtos no pedido.
- **poStatus**: Status da disponibilidade do produto.

### StorageLocation

Relaciona localização de armazenamento e estoque de produtos.


- **idLproduct**: Referência ao produto (Chave Estrangeira referenciando `Product`).
- **idLstorage**: Referência ao estoque (Chave Estrangeira referenciando `ProductStorage`).
- **location**: Localização de armazenamento.

### Delivery

Armazena informações das entregas.


- **trackingCode**: Código de rastreamento da entrega.
- **idDOrder**: Referência ao pedido (Chave Estrangeira referenciando `Orders`).
- **DValue**: Valor da entrega.
- **dClient**: Cliente da entrega.
- **stats**: Status da entrega (a caminho, entregue).
- **orderAdress**: Endereço de entrega.

## ㅤ
## Nota

Este esquema de banco de dados foi projetado para fins educacionais e de autoavaliação. Sinta-se à vontade para fomentar sugestões.
