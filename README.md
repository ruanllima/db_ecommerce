Sistema de Gerenciamento - README
Este repositório contém o esquema de banco de dados para um sistema de gerenciamento de vendas, clientes, produtos, pagamentos, fornecedores e entregas. O esquema foi projetado para armazenar informações relevantes para um negócio que lida com vendas e estoque de produtos. Abaixo, você encontrará informações sobre as tabelas e sua estrutura.

Tabelas do Banco de Dados
clients: Armazena informações dos clientes.

idClient: Identificador único do cliente.
pessoa: Enumeração que indica se o cliente é uma pessoa física ou jurídica.
Cname: Nome do cliente (pessoa física ou nome da empresa).
Minit: Iniciais do nome do cliente (para pessoas físicas).
cpf: CPF do cliente (obrigatório e único).
address: Endereço do cliente.
product: Armazena informações dos produtos.

idProduct: Identificador único do produto.
Pname: Nome do produto.
category: Categoria do produto (eletrônico, vestimenta, brinquedos, alimentos, móveis).
assessment: Avaliação do produto (pontuação).
prodSeller: Nome do vendedor do produto.
size: Tamanho do produto.
payments: Armazena informações de pagamentos dos clientes.

idClient: Referência ao cliente.
id_payment: Identificador único do pagamento.
typePayment: Método de pagamento (boleto, cartão, dois cartões, PIX).
limitAvailable: Limite disponível para o pagamento.
cardMain: Armazena informações do cartão de crédito principal do cliente.

nameClient: Nome do cliente.
cardNumber: Número do cartão de crédito (único).
agency: Agência do cartão.
data_vali: Data de validade do cartão.
cvv: Código de segurança do cartão.
cardSecond: Armazena informações do segundo cartão de crédito do cliente.

nameClient: Nome do cliente.
cardNumber: Número do cartão de crédito (único).
agency: Agência do cartão.
data_vali: Data de validade do cartão.
cvv: Código de segurança do cartão.
orders: Armazena informações dos pedidos.

idOrder: Identificador único do pedido.
idOrderClient: Referência ao cliente que fez o pedido.
orderStatus: Status do pedido (cancelado, confirmado, em processamento).
ordersDescription: Descrição do pedido.
sendValue: Valor do envio.
payment: Método de pagamento do pedido.
productStorage: Armazena informações do estoque de produtos.

idProdStorage: Identificador único do estoque.
storageLocation: Localização do estoque.
quantity: Quantidade de produtos em estoque.
supplier: Armazena informações dos fornecedores.

idSupplier: Identificador único do fornecedor.
SocialName: Nome social do fornecedor.
CNPJ: CNPJ do fornecedor (único).
contact: Contato do fornecedor.
seller: Armazena informações dos vendedores.

idSeller: Identificador único do vendedor.
SocialName: Nome social do vendedor.
AbstName: Nome abreviado do vendedor.
CNPJ: CNPJ do vendedor (único).
CPF: CPF do vendedor.
SAssessment: Avaliação do vendedor.
location: Localização do vendedor.
contact: Contato do vendedor.
productSeller: Relaciona produtos e vendedores.

idPseller: Referência ao vendedor.
idProduct: Referência ao produto.
prodQuantity: Quantidade de produtos disponíveis.
productOrder: Relaciona produtos e pedidos.

idPOproduct: Referência ao produto.
idPOorder: Referência ao pedido.
poQuantity: Quantidade de produtos no pedido.
poStatus: Status da disponibilidade do produto.
storageLocation: Relaciona localização de armazenamento e estoque de produtos.

idLproduct: Referência ao produto.
idLstorage: Referência ao estoque.
location: Localização de armazenamento.
delivery: Armazena informações das entregas.

trackingCode: Código de rastreamento da entrega.
idDOrder: Referência ao pedido.
DValue: Valor da entrega.
dClient: Cliente da entrega.
stats: Status da entrega (a caminho, entregue).
orderAdress: Endereço de entrega.
Nota
Este esquema de banco de dados foi projetado para fins educacionais e pode requerer ajustes para ser utilizado em um ambiente de produção. Certifique-se de adaptá-lo às necessidades específicas do seu projeto antes de implementá-lo. Se tiver alguma dúvida ou precisar de ajuda, sinta-se à vontade para entrar em contato.

Lembre-se de que este é um esquema de banco de dados e não inclui a implementação de lógica de aplicativo ou a interação com um sistema real.
