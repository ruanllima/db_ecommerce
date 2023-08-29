-- Tabela para armazenar informações dos clientes
create table clients(
    idClient int auto_increment primary key,
    pessoa enum('Física','Jurídica'),
    Cname varchar(59),
    Minit char(3),
    cpf char(11) not null,
    constraint unique_cpf_client unique (cpf),
    address varchar(30)
);

-- Tabela para armazenar informações dos produtos
create table product (
    idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    assessment float(5) default 0,
    prodSeller varchar(59),
    size varchar(10),
    constraint fk_product_seller foreign key (prodSeller) references seller(SocialName)
);

-- Tabela para armazenar informações de pagamentos
create table payments(
    PayIdClient int not null,
    id_payment int auto_increment,
    typePayment enum('Boleto', 'Cartão','Dois cartões','Pix') not null,
    limitAvailable float default 50,
    primary key(idClient, id_payment),
    constraint fk_payments_client foreign key (PayIdClient) references clients(IdClient)
);

-- Tabela para armazenar informações do cartão de crédito principal

create table cardMain(
    nameClient varchar(59) not null,
    cardNumber varchar(16) unique not null,
    agency tinyint not null,
    data_vali date not null,
    cvv tinyint not null
);

-- Tabela para armazenar informações do cartão de crédito secundário
create table cardSecond(
    nameClient varchar(59),
    cardNumber varchar(16) unique,
    agency tinyint,
    data_vali date,
    cvv tinyint
);

-- Tabela para armazenar informações dos pedidos
create table orders(
    idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado','Em processamento') default 'Em processamento' not null,
    ordersDescription varchar(255),
    sendValue float default 10,
    payment enum('Boleto', 'Cartão', 'Dois cartões','Pix'),
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

-- Tabela para armazenar informações do estoque de produtos
create table productStorage(
    idProdStorage int auto_increment primary key,
    storageLocation varchar (255),
    quantity int default 0
);

-- Tabela para armazenar informações dos fornecedores
create table supplier (
    idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- Tabela para armazenar informações dos vendedores
create table seller (
    idSeller int auto_increment primary key,
    SocialName varchar(59) not null,
    AbstName varchar(59),
    CNPJ char(15) not null,
    CPF char(9),
    SAssessment float(5) default 0,
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

-- Tabela para relacionar produtos e vendedores
create table productSeller(
    idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

-- Tabela para relacionar produtos e pedidos
create table productOrder(
    idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

-- Tabela para relacionar localização de armazenamento e estoque de produtos
create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

-- Tabela para armazenar informações das entregas
create table delivery(
    trackingCode varchar(10) not null,
    idDOrder int not null,
    DValue int default 0,
    dClient varchar(59),
    stats enum('A caminho', 'Entregue') not null,
    orderAdress varchar(30) not null,
    primary key (trackingCode, idDOrder),
    constraint fk_delivery_orders foreign key (idDOrder) references orders(idOrder),
    constraint fk_delivery_clients foreign key (dClient) references clients(Cname)
);
