-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "categorias" -------------------------------
CREATE TABLE `categorias` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`titulo` VarChar( 255 ) NOT NULL,
	`descricao` Text NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- ---------------------------------------------------------


-- CREATE TABLE "ci_sessions" ------------------------------
CREATE TABLE `ci_sessions` ( 
	`id` VarChar( 40 ) NOT NULL,
	`ip_address` VarChar( 45 ) NOT NULL,
	`timestamp` Int( 10 ) UNSIGNED NOT NULL DEFAULT '0',
	`data` Blob NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "clientes" ---------------------------------
CREATE TABLE `clientes` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`nome` VarChar( 245 ) NOT NULL,
	`sobrenome` VarChar( 145 ) NOT NULL,
	`rg` VarChar( 45 ) NOT NULL,
	`cpf` VarChar( 45 ) NOT NULL,
	`data_nascimento` DateTime NOT NULL,
	`sexo` Char( 1 ) NOT NULL,
	`rua` VarChar( 145 ) NOT NULL,
	`numero` VarChar( 15 ) NOT NULL,
	`bairro` VarChar( 145 ) NOT NULL,
	`cidade` VarChar( 145 ) NOT NULL,
	`estado` VarChar( 45 ) NOT NULL,
	`cep` VarChar( 15 ) NOT NULL,
	`telefone` VarChar( 15 ) NOT NULL,
	`celular` VarChar( 15 ) NOT NULL,
	`email` VarChar( 145 ) NOT NULL,
	`senha` VarChar( 45 ) NOT NULL,
	`status` TinyInt( 1 ) NOT NULL DEFAULT '0',
	`cadastrado_em` DateTime NOT NULL DEFAULT '2016-02-11 00:00:00',
	PRIMARY KEY ( `id` ),
	CONSTRAINT `CPF_Unico` UNIQUE( `cpf` ),
	CONSTRAINT `Email_Unico` UNIQUE( `email` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- ---------------------------------------------------------


-- CREATE TABLE "clientes_log" -----------------------------
CREATE TABLE `clientes_log` ( 
	`id` Int( 10 ) UNSIGNED NOT NULL,
	`nome` VarChar( 245 ) NOT NULL,
	`sobrenome` VarChar( 145 ) NOT NULL,
	`rg` VarChar( 45 ) NOT NULL,
	`cpf` VarChar( 45 ) NOT NULL,
	`data_nascimento` DateTime NOT NULL,
	`sexo` Char( 1 ) NOT NULL,
	`rua` VarChar( 145 ) NOT NULL,
	`numero` VarChar( 15 ) NOT NULL,
	`bairro` VarChar( 145 ) NOT NULL,
	`cidade` VarChar( 145 ) NOT NULL,
	`estado` VarChar( 45 ) NOT NULL,
	`cep` VarChar( 15 ) NOT NULL,
	`telefone` VarChar( 15 ) NOT NULL,
	`celular` VarChar( 15 ) NOT NULL,
	`email` VarChar( 145 ) NOT NULL,
	`senha` VarChar( 45 ) NOT NULL,
	`status` TinyInt( 1 ) NOT NULL DEFAULT '0',
	`cadastrado_em` DateTime NOT NULL )
ENGINE = MyISAM;
-- ---------------------------------------------------------


-- CREATE TABLE "itens_pedidos" ----------------------------
CREATE TABLE `itens_pedidos` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`pedido` Int( 10 ) UNSIGNED NOT NULL,
	`item` VarChar( 45 ) NOT NULL,
	`quantidade` Int( 10 ) UNSIGNED NOT NULL,
	`preco` Decimal( 10, 2 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 16;
-- ---------------------------------------------------------


-- CREATE TABLE "pedidos" ----------------------------------
CREATE TABLE `pedidos` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`data` Timestamp NOT NULL DEFAULT '2016-02-11 00:00:00',
	`cliente` Int( 10 ) UNSIGNED NOT NULL,
	`produtos` Decimal( 10, 2 ) NOT NULL,
	`frete` Decimal( 10, 2 ) NOT NULL,
	`status` Int( 10 ) UNSIGNED NOT NULL DEFAULT '1',
	`comentarios` Text NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 116;
-- ---------------------------------------------------------


-- CREATE TABLE "produtos" ---------------------------------
CREATE TABLE `produtos` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`codigo` VarChar( 45 ) NOT NULL,
	`titulo` VarChar( 255 ) NOT NULL,
	`descricao` Text NOT NULL,
	`preco` Decimal( 10, 2 ) NOT NULL,
	`largura_caixa_mm` Int( 10 ) UNSIGNED NOT NULL,
	`altura_caixa_mm` Int( 10 ) UNSIGNED NOT NULL,
	`comprimento_caixa_mm` Int( 10 ) UNSIGNED NOT NULL,
	`peso_gramas` Int( 10 ) UNSIGNED NOT NULL,
	`data_adicionado` DateTime NOT NULL DEFAULT '2016-02-11 00:00:00',
	`ativo` TinyInt( 1 ) NOT NULL DEFAULT '1',
	PRIMARY KEY ( `id` ),
	CONSTRAINT `codigo_unico` UNIQUE( `codigo` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 25;
-- ---------------------------------------------------------


-- CREATE TABLE "produtos_categorias" ----------------------
CREATE TABLE `produtos_categorias` ( 
	`produto` Int( 10 ) UNSIGNED NOT NULL,
	`categoria` Int( 10 ) UNSIGNED NOT NULL,
	CONSTRAINT `unique_produto_categoria` UNIQUE( `produto`, `categoria` ) )
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "tb_transporte_preco" ----------------------
CREATE TABLE `tb_transporte_preco` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`peso_de` Decimal( 6, 2 ) NOT NULL,
	`peso_ate` Decimal( 6, 2 ) NOT NULL,
	`preco` Decimal( 10, 2 ) NOT NULL,
	`adicional_kg` Decimal( 10, 2 ) NOT NULL,
	`uf` VarChar( 45 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ENGINE = InnoDB
AUTO_INCREMENT = 95;
-- ---------------------------------------------------------


-- CREATE TABLE "classes_metodos" --------------------------
CREATE TABLE `classes_metodos` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`classe` VarChar( 255 ) NOT NULL,
	`metodo` VarChar( 255 ) NOT NULL,
	`nome_amigavel` TinyText NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 30;
-- ---------------------------------------------------------


-- CREATE TABLE "permissoes" -------------------------------
CREATE TABLE `permissoes` ( 
	`usuario` Int( 10 ) UNSIGNED NOT NULL,
	`metodo` Int( 10 ) UNSIGNED NOT NULL,
	CONSTRAINT `Chave_unica` UNIQUE( `usuario`, `metodo` ) )
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "usuarios" ---------------------------------
CREATE TABLE `usuarios` ( 
	`id` Int( 10 ) UNSIGNED AUTO_INCREMENT NOT NULL,
	`login` VarChar( 45 ) NOT NULL,
	`senha` VarChar( 45 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- ---------------------------------------------------------


-- Dump data of "categorias" -------------------------------
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '1', 'Acessórios e Periféricos', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '2', 'Armazenamento', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '3', 'Automação comercial', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '4', 'Áudio', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '5', 'Cabos', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '6', 'Carregadores e pilhas', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '7', 'Conectividade', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '8', 'Energia', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '9', 'Fone de ouvido', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '10', 'Gabinetes', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '11', 'Gamer', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '12', 'Impressão', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '13', 'Kit Teclado e Mouse', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '14', 'Maleta e Mochila', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '15', 'Memória', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '16', 'Monitor e tv monitor', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '17', 'Mouse', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '18', 'Papel', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '19', 'Placa de Vídeo', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '20', 'Placa mãe', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '21', 'Processadores', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '22', 'Projetor', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '23', 'Segurança CFTV', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '24', 'Suprimentos', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '25', 'Tablet', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '26', 'Teclado', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '27', 'Telefonia', '' );
INSERT INTO `categorias`(`id`,`titulo`,`descricao`) VALUES ( '28', 'Web cam', '' );
-- ---------------------------------------------------------


-- Dump data of "ci_sessions" ------------------------------
INSERT INTO `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) VALUES ( '56c614a7946799eb0a68dd17aa7b4c574d3489b8', '127.0.0.1', '1480626696', 0x5 );
INSERT INTO `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) VALUES ( '8b35a29bc5d76ea3ae574cc8d6dd9e57ade28985', '127.0.0.1', '1480629376', 0x5 );
INSERT INTO `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) VALUES ( 'b89a80a5ce35937a195a1f8799c05e4d878a7011', '127.0.0.1', '1480630451', 0x5 );
INSERT INTO `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) VALUES ( 'bd3dd6694a11910a12b463bb7d310ad6badb3dbc', '127.0.0.1', '1480632639', 0x5 );
INSERT INTO `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) VALUES ( 'cd0eb9ec48cdb56490aaa7ddc98dd6424dee8bfa', '127.0.0.1', '1480631325', 0x5 );
INSERT INTO `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) VALUES ( 'e4bd750bc28ef8d3d335e4ce1924a445f4919c49', '127.0.0.1', '1480630813', 0x5 );
INSERT INTO `ci_sessions`(`id`,`ip_address`,`timestamp`,`data`) VALUES ( 'f986cee7c394ea13fe9a04f515ded6f859dce7a8', '127.0.0.1', '1480632300', 0x5 );
-- ---------------------------------------------------------


-- Dump data of "clientes" ---------------------------------
INSERT INTO `clientes`(`id`,`nome`,`sobrenome`,`rg`,`cpf`,`data_nascimento`,`sexo`,`rua`,`numero`,`bairro`,`cidade`,`estado`,`cep`,`telefone`,`celular`,`email`,`senha`,`status`,`cadastrado_em`) VALUES ( '1', 'Maicon', 'Martins', '111111111', '123.123.123-45', '1984-02-22 00:00:00', 'M', 'Avenida Narciso Silva', '12', 'Centro', 'Capão do Leão', 'RS', '96160000', '5391245556', '5391245556', 'mmartins@gmail.com', '12345', '1', '2015-04-26 08:47:39' );
INSERT INTO `clientes`(`id`,`nome`,`sobrenome`,`rg`,`cpf`,`data_nascimento`,`sexo`,`rua`,`numero`,`bairro`,`cidade`,`estado`,`cep`,`telefone`,`celular`,`email`,`senha`,`status`,`cadastrado_em`) VALUES ( '2', 'Christian', 'Medeiros', '12312345', '123.123.123-44', '1981-02-07 00:00:00', 'M', 'Avenida Domingos de Almeida', '123', 'Centro', 'Pelotas', 'RS', '96085470', '5381027737', '5381027737', 'christian.souza@gmail.com', '12345', '1', '2015-07-06 07:16:45' );
-- ---------------------------------------------------------


-- Dump data of "clientes_log" -----------------------------
-- ---------------------------------------------------------


-- Dump data of "itens_pedidos" ----------------------------
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '1', '1', 'MSAT001', '1', '12.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '2', '1', 'QJOG001', '1', '218.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '3', '1', 'VTTO001', '1', '914.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '4', '112', 'CLTE002', '1', '32.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '5', '112', 'CLTE003', '1', '124.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '6', '113', 'PPRK001', '1', '43.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '7', '113', 'QJOG001', '1', '218.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '8', '113', 'MSAT001', '1', '12.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '12', '115', 'MSAT001', '1', '12.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '13', '115', 'QJOB001', '1', '700.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '14', '115', 'CBEF001', '1', '47.00' );
INSERT INTO `itens_pedidos`(`id`,`pedido`,`item`,`quantidade`,`preco`) VALUES ( '15', '116', 'ACAF001', '1', '418.00' );
-- ---------------------------------------------------------


-- Dump data of "pedidos" ----------------------------------
INSERT INTO `pedidos`(`id`,`data`,`cliente`,`produtos`,`frete`,`status`,`comentarios`) VALUES ( '112', '2016-09-09 20:02:33', '1', '156.00', '23.25', '1', 'Novo pedido inserido no sistema.' );
INSERT INTO `pedidos`(`id`,`data`,`cliente`,`produtos`,`frete`,`status`,`comentarios`) VALUES ( '113', '2016-09-09 20:06:23', '1', '273.00', '27.05', '1', 'Pagamento confirmado, pedido em andamento.' );
INSERT INTO `pedidos`(`id`,`data`,`cliente`,`produtos`,`frete`,`status`,`comentarios`) VALUES ( '115', '2016-10-06 07:33:58', '4', '759.00', '24.05', '0', 'Novo pedido inserido no sistema.' );
-- ---------------------------------------------------------


-- Dump data of "produtos" ---------------------------------
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '1', 'PPRK001', 'Páprica', 'também conhecido por pimentão, pimentão-doce ou colorau, é uma especiaria obtida do pimentão-doce depois de seco e moído, muito usada na cozinha como condimento. O pimentão-doce é uma variedade de Capsicum annuum, da família das Solanaceae. A sua origem é latino-americana, mais especificamente da região central e do México. Diversas variedades desta espécie são utilizadas de acordo se se pretende um condimento mais ou menos picante.

A páprica é usada como corante de carnes assadas, sopas, pães e arroz. Na indústria alimentícia é usado para carnes congeladas ou defumadas, arroz, manteiga e queijos.', '43.00', '55', '105', '55', '200', '2015-04-11 20:58:37', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '2', 'OLOL001', 'Azeite de Oliva', 'Usualmente, o termo azeite refere-se ao produto alimentar, usado como tempero, produzido a partir da azeitona, fruto advindo das oliveiras (em outros contextos, pode também tratar-se de óleos produzidos a partir de outras plantas). Trata-se de um alimento antigo, clássico da culinária contemporânea, regular na dieta mediterrânea e nos dias atuais presente em grande parte das cozinhas.', '62.00', '120', '250', '120', '450', '2015-04-11 21:00:20', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '3', 'TBSC001', 'Tabasco - Galão', 'Galão de 3.8L - O molho tabasco é um molho de pimenta fabricado nos Estados Unidos, conhecido e vendido em todo o mundo. De sabor picante, prepara-se com pimentos vermelhos Capsicum frutescens da variedade tabasco, vinagre, água e sal, macerados em barris de carvalho. O molho é produzido na ilha de Avery, que fica localizada na Paróquia de Iberia, no estado estadunidense da Luisiana.', '314.00', '300', '300', '300', '3600', '2015-04-11 21:03:16', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '4', 'MSTA001', 'Mostarda Amarela', 'Tanto as sementes amarelas quanto as escuras são utilizadas para a fabricação da Mostarda, podendo ainda serem misturadas, para obter variedades diferentes do condimento. A Mostarda alemã utiliza em sua composição as sementes amarelas, enquanto na França, são utilizadas as Mostardas escuras. Quanto ao gosto, as duas sementes se diferênciam no sabor, mais picante, no óleo das sementes escuras.', '12.00', '45', '200', '120', '300', '2015-04-11 21:09:48', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '5', 'ACAF001', 'Açafrão', 'O açafrão é extraído dos estigmas de flores de Crocus sativus, uma planta da família das Iridáceas. É utilizado desde a Antiguidade como especiaria, principalmente na culinária do Mediterrâneo — região de onde a variedade é originária — no preparo de risotos, aves, caldos, massas e doces. É um item essencial à paella espanhola. É tida como uma das mais caras ou a mais cara especiaria do mundo uma vez que, para se obter um quilo de açafrão seco, são processadas manualmente cerca de 150.000 flores, e é preciso cultivar uma área de aproximadamente 2000 m²', '418.00', '100', '100', '100', '100', '2015-04-11 21:15:44', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '6', 'CPBL001', 'Sopa Campbel - Qualquer sabor', 'Em sabores variados, os nutricionistas aconselham a ingestão diária de sopa para um regime alimentar equilibrado. A maior parte das sopas é de baixo custo, de confecção simples e de digestão fácil, contendo vitaminas e hidratos de carbono. A ingestão de sopa auxilia nos regimes alimentares de controlo de peso e é uma forma fácil de assegurar que crianças pequenas e idosos ingiram produtos hortícolas e água.', '16.00', '120', '120', '120', '350', '2015-04-11 21:18:32', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '7', 'CBEF001', 'Carne enlatada', 'Carne enlatada. Atualmente os alimentos enlatados passam por um processo que tem por objetivo eliminar microorganismos e outros agentes nocivos que podem comprometer a qualidade do alimento e a saúde de seus consumidores. Entre os microorganismos nocivos que precisam ser eliminados está o Clostridium botulinum causador do botulismo.

Primeiramente os alimentos são acondicionados nas latas, que são preenchidas por água, óleo ou uma solução ácida. Em seguida, as latas são fechadas hermeticamente e expostas a altas temperaturas e pressões. Todo o processo é automatizado sendo realizado por máquinas sem requerer contato manual.', '47.00', '200', '300', '250', '400', '2015-04-11 21:21:10', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '8', 'UNIC001', 'Carne de Unicórnio em Lata', 'Unicórnio, também conhecido como licórnio ou licorne, é um animal mitológico que tem a forma de um cavalo, geralmente branco, com um único chifre em espiral. Sua imagem está associada à pureza e à força. As carnes são formadas principalmente de proteínas, gorduras e água, em proporção que varia minimamente dependendo do animal. A carne magra apresenta em torno de 75% de água, 21 a 22% de proteína, 1 a 2% de gordura, 1% de minerais e menos de 1% de carboidratos. A quantidade de calorias (conteúdo energético) é relativamente pequena, com média de 105 kcal/100g de carne crua.', '87.00', '250', '250', '120', '350', '2015-04-11 21:24:53', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '9', 'SLMN001', 'Salmões em Lata', 'A cor vermelha do salmão é devido a um pigmento chamado astaxantina. O salmão é basicamente um peixe branco. O pigmento vermelho é feito através das algas e dos organismos unicelulares, que são ingeridos pelos camarões do mar; o pigmento é armazenado no músculo do camarão ou na casca. Quando os camarões são comidos pelo salmão, estes também acumulam o pigmento nos seus tecidos adiposos. Como a dieta do salmão é muito variada, o salmão natural toma uma enorme variedade de cores, desde branco ou um cor-de-rosa suave a um vermelho vivo.', '6.00', '120', '45', '120', '120', '2015-04-11 21:28:15', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '10', 'SDNA001', 'Sardinhas da Louisiana', 'As sardinhas ou manjuas são peixes da família Clupeidae, aparentados com os arenques. Geralmente de pequenas dimensões (10–15 cm de comprimento), caracterizam-se por possuírem apenas uma barbatana dorsal sem espinhos.', '5.00', '140', '45', '80', '120', '2015-04-11 21:32:29', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '11', 'CLTE001', 'Chocolates variados com licor', 'O chocolate, tal como é consumido hoje, é resultado de sucessivos aprimoramentos realizados desde o início da colonização da América. O produto era consumido pelos nativos na forma de uma bebida quente e amarga, de uso exclusivo da nobreza. Os europeus passaram a adoçar e a misturar especiarias para adequá-lo ao seu gosto. Com o desenvolvimento dos processos industriais e técnicas culinárias, surgiu o chocolate com leite e depois na forma de um sólido. Atualmente, é encontrado em diferentes formas que vão desde o sólido, como o chocolate em pó, as barras, os ovos e os bombons.', '90.00', '400', '30', '400', '380', '2015-04-11 21:36:21', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '12', 'CLTE002', 'Remy Martin Chocolate', 'Chocolate vem do cacau. Desde a sua domesticação, o cacau é usado como bebida e, depois, como ingrediente para alimentos. Durante a civilização maia, era cultivado e, a partir de suas sementes, era feita uma bebida amarga chamada xocoatl, geralmente temperada com baunilha e pimenta. O xocoatl, acreditava-se, combatia o cansaço, além de ser afrodisíaco.', '32.00', '150', '20', '300', '200', '2015-04-11 21:40:10', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '13', 'CLTE003', 'Trufas Godiva', 'Godiva Chocolatier é um fabricante de chocolates premium e produtos relacionados. Godiva, fundada na Bélgica em 1926, foi comprado pelo turco Yildiz Segurar, proprietário do Grupo Ülker, em 20 de novembro de 2007.', '124.00', '240', '45', '240', '360', '2015-04-11 21:43:33', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '14', 'VTTO001', 'Vinho tinto - Fine Wine Found', 'Merlot é uma casta de uva tinta, fruto da Vitis vinifera. É uma das responsáveis pelas características dos vinhos tintos de Saint Émillion, na região de Bordeaux, na França. Apesar da casta geralmente ser utilizada em vinhos para serem consumidos jovens, as vinícolas de Saint Émillion garantem rótulos de longevidade.', '914.00', '180', '350', '180', '980', '2015-04-11 21:49:39', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '15', 'VVSS001', 'Vinho branco suave', 'Chardonnay é uma uva da família da Vitis vinifera, a partir da qual é fabricado vinho branco de qualidade. Também é conhecida como aubaine, beaunois, melon blanc e pinot chardonnay. A chardonnay é usada na composição do vinho champagne, sendo responsável por seu aroma característico.', '465.00', '180', '350', '180', '990', '2015-04-11 21:57:55', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '16', 'KTVN001', 'Kit de Vinho para presente', 'Em uma linda caixa acompnham acessórios e um delicioso vinho Merlot é uma casta de uva tinta, fruto da Vitis vinifera. É uma das responsáveis pelas características dos vinhos tintos de Saint Émillion, na região de Bordeaux, na França. Apesar da casta geralmente ser utilizada em vinhos para serem consumidos jovens, as vinícolas de Saint Émillion garantem rótulos de longevidade.', '319.00', '300', '450', '250', '1540', '2015-04-11 22:00:39', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '17', 'QJSO001', 'Queijo Suiço - The lauguing cow', 'Um dos melhores queijos do mundo. Existem centenas de tipos de queijos produzidos em todo o mundo. Diferentes estilos e sabores de queijo são o resultado do uso do leite de diferentes mamíferos ou com o acréscimo de diferentes teores de gordura, empregando determinadas espécies de bactérias e bolores, e variando o tempo de envelhecimento e outros tratamentos de transformação.', '278.00', '320', '120', '320', '850', '2015-04-12 10:14:16', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '18', 'QJOF001', 'Queijo Feta Grego', 'O feta é um queijo envelhecido, habitualmente produzido em blocos, com uma textura levemente granulada. É servido como queijo de mesa, assim como em saladas, empadas, tortas e outros alimentos assados, em especial aqueles com massas folhadas - como o spanakopita ("torta de espinafre") e tyropita ("torta de queijo").', '199.00', '320', '290', '320', '700', '2015-04-12 10:20:20', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '19', 'QJOB001', 'Queijo Brie Francês', 'Os chamados brie são uma importante família de queijos de pasta mole e crosta florida, originados da região de Brie, na França. Fabricados com leite de vaca, o brie tradicional apresenta-se no formato de um cilindro com 35 centímetros de diâmetro por 35 milímetros de altura e com um peso que varia de 2 a 2,5 quilogramas. A sua crosta é branca e macia, formada pelo fungo Penicillium candida.', '700.00', '340', '290', '340', '1450', '2015-04-12 10:25:32', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '20', 'QJOG001', 'Queijo Guda', 'Queijo de Gouda é um queijo amarelo feito de leite de vaca. Recebe o nome da cidade de Gouda, nos Países Baixos, porém seu nome não é protegido. A Comissão Europeia, no entanto, confirmou que o gouda holandês deverá ser protegido. Queijos feitos em outros países com o nome de gouda são vendidos, no entanto, ao redor do mundo.', '218.00', '340', '290', '340', '1200', '2015-04-12 10:37:34', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '21', 'MSAA001', 'Espaguete Italiano', 'Há vários tipos de espaguete conforme o seu diâmetro (spaghettone, spaghettino, capellini, vermiceli, vermicelloni). Diz-se que cada italiano consome cerca de 30 quilogramas anuais de massas, enquanto que no Brasil esse consumo é da ordem de apenas 5,7 quilogramas/ano. O prato é consumido tradicionalmente com diferentes molhos (bechamel, tomate, ragu, quatro queijos etc).', '8.00', '120', '45', '400', '1050', '2015-04-12 10:43:30', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '22', 'MSAT001', 'Tagliarini Italiano', 'Talharim (do italiano tagliarini) é um tipo de massa alimentícia com a forma de finas tiras. Há variações no nome, que incluem “taglierini” ou “tajarin” (no dialeto do Piemonte, que é a “pátria” desta massa e aparentemente a palavra mais próxima do nome em português), e representam o tipo mais fino das massas do grupo tagliatelle, as pastas em tiras.

Esta massa é de cozedura muito rápida e, por absorver rapidamente os líquidos, normalmente é servida com um molho simples, por vezes, apenas manteiga ou mascarpone (um queijo cremoso), ou o molho de um assado.', '12.00', '120', '45', '400', '1050', '2015-04-12 10:59:51', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '23', 'MSAC001', 'Caneloni Italiano', 'Cannelloni (ou canelone) são um formato de macarrão cilíndrico tipicamente italiano. O produto habitualmente é consumido com recheio salgado que pode incluir queijo ricota e vegetais como o espinafre, além da carne moída. Depois é coberto por um molho que pode ser de tomate clássico ou bechamel e gratinados ao forno.

Esse tipo de macarrão é vendido tanto nas versões pré-cozida quanto na que necessita de um pré-cozimento antes de ser recheado. As dimensões são aproximadamente de 8 a 10 cm de comprimento por cerca de 2 cm de diâmetro.', '18.00', '120', '45', '400', '1034', '2015-04-12 11:08:52', '1' );
INSERT INTO `produtos`(`id`,`codigo`,`titulo`,`descricao`,`preco`,`largura_caixa_mm`,`altura_caixa_mm`,`comprimento_caixa_mm`,`peso_gramas`,`data_adicionado`,`ativo`) VALUES ( '24', 'MACT001', 'Tagliatelli Italiano', 'Tagliatelle, também conhecido como Tagliatella e Taiadela, são o tipo mais comum das massas cortadas em tiras. Por vezes, são consideradas sinónimos dos fettuccine, embora outras fontes considerem que as tagliatelle devem ter, no máximo, 0,75 cm de largura e os tagliatelline ou fettuccine não podem ultrapassar os 0,5 cm.

Estas pastas, tradicionalmente feitas à mão, têm como ingredientes a semolina ou farinha de trigo de grão duro e ovos, começando por uma massa estendida bem fina, chamada “sfoglia”. No entanto, existem ainda as pastas verdes, cuja massa pode ser preparada com espinafre (o mais comum), com urtiga, ou acelga.

Os tagliatelle são tradicionalmente acompanhados de molho à bolonhesa.', '22.00', '120', '45', '400', '1056', '2015-04-12 11:10:52', '1' );
-- ---------------------------------------------------------


-- Dump data of "produtos_categorias" ----------------------
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '1', '1' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '2', '1' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '3', '1' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '4', '1' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '5', '1' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '6', '2' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '7', '2' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '8', '2' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '9', '2' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '10', '2' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '11', '3' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '12', '3' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '13', '3' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '14', '4' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '15', '4' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '16', '4' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '17', '5' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '18', '5' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '19', '5' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '20', '5' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '21', '6' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '22', '6' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '23', '6' );
INSERT INTO `produtos_categorias`(`produto`,`categoria`) VALUES ( '24', '6' );
-- ---------------------------------------------------------


-- Dump data of "tb_transporte_preco" ----------------------
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '1', '0.00', '10.00', '36.76', '0.71', 'MG' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '2', '10.00', '20.00', '53.91', '0.71', 'MG' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '3', '20.00', '30.00', '62.48', '0.71', 'MG' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '4', '30.00', '50.00', '70.44', '0.71', 'MG' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '5', '50.00', '75.00', '90.07', '0.71', 'MG' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '6', '75.00', '100.00', '122.51', '0.71', 'MG' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '7', '0.00', '10.00', '44.27', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '8', '10.00', '20.00', '64.95', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '10', '30.00', '50.00', '84.89', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '11', '50.00', '75.00', '108.48', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '12', '75.00', '100.00', '147.60', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '19', '0.00', '10.00', '36.76', '0.71', 'SC' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '20', '10.00', '20.00', '36.76', '0.71', 'SC' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '21', '20.00', '30.00', '36.76', '0.71', 'SC' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '22', '30.00', '50.00', '36.76', '0.71', 'SC' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '23', '50.00', '75.00', '36.76', '0.71', 'SC' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '24', '75.00', '100.00', '36.76', '0.71', 'SC' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '25', '0.00', '10.00', '62.52', '0.71', 'GO' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '26', '10.00', '20.00', '83.88', '0.71', 'GO' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '27', '20.00', '30.00', '97.21', '0.71', 'GO' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '28', '30.00', '50.00', '109.60', '0.71', 'GO' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '29', '50.00', '75.00', '140.12', '0.71', 'GO' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '30', '75.00', '100.00', '190.60', '0.71', 'GO' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '31', '0.00', '10.00', '27.37', '0.71', 'RS' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '32', '10.00', '20.00', '40.18', '0.71', 'RS' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '33', '20.00', '30.00', '46.56', '0.71', 'RS' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '34', '30.00', '50.00', '52.48', '0.71', 'RS' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '35', '50.00', '75.00', '67.10', '0.71', 'RS' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '36', '75.00', '100.00', '91.29', '0.71', 'RS' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '37', '0.00', '10.00', '40.80', '0.71', 'RJ' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '38', '10.00', '20.00', '59.86', '0.71', 'RJ' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '39', '20.00', '30.00', '69.39', '0.71', 'RJ' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '40', '30.00', '50.00', '78.22', '0.71', 'RJ' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '41', '50.00', '75.00', '99.98', '0.71', 'RJ' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '42', '75.00', '100.00', '136.02', '0.71', 'RJ' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '43', '0.00', '10.00', '27.37', '0.71', 'SP' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '44', '10.00', '20.00', '27.37', '0.71', 'SP' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '45', '20.00', '30.00', '27.37', '0.71', 'SP' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '46', '30.00', '50.00', '27.37', '0.71', 'SP' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '47', '50.00', '75.00', '27.37', '0.71', 'SP' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '48', '75.00', '100.00', '27.37', '0.71', 'SP' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '49', '0.00', '10.00', '63.17', '0.71', 'ES' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '50', '10.00', '20.00', '92.62', '0.71', 'ES' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '51', '20.00', '30.00', '107.36', '0.71', 'ES' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '52', '30.00', '50.00', '121.05', '0.71', 'ES' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '53', '50.00', '75.00', '154.75', '0.71', 'ES' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '54', '75.00', '100.00', '179.90', '0.71', 'ES' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '55', '789.00', '9000.00', '179.90', '0.71', 'AC' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '56', '0.00', '10.00', '179.90', '0.71', 'PE' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '57', '0.00', '10.00', '179.90', '0.71', 'PB' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '58', '20.00', '30.00', '179.90', '0.71', 'MS' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '59', '50.00', '75.00', '179.90', '0.71', 'MS' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '60', '30.00', '50.00', '179.90', '0.71', 'AL' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '61', '50.00', '75.00', '179.90', '0.71', 'AL' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '62', '30.00', '50.00', '179.90', '0.71', 'AM' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '63', '50.00', '75.00', '179.90', '0.71', 'AM' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '64', '75.00', '100.00', '179.90', '0.71', 'AC' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '65', '30.00', '50.00', '179.90', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '66', '50.00', '75.00', '179.90', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '67', '75.00', '150.00', '179.90', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '68', '30.00', '50.00', '179.90', '0.71', 'BA' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '69', '50.00', '75.00', '179.90', '0.71', 'BA' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '70', '75.00', '150.00', '179.90', '0.71', 'BA' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '71', '30.00', '50.00', '179.90', '0.71', 'ES' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '72', '50.00', '75.00', '179.90', '0.71', 'ES' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '73', '75.00', '120.00', '179.90', '0.71', 'ES' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '74', '30.00', '55.00', '179.90', '0.71', 'GO' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '75', '75.00', '120.00', '179.90', '0.71', 'GO' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '76', '30.00', '55.00', '179.90', '0.71', 'MA' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '77', '50.00', '120.00', '179.90', '0.71', 'AC' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '78', '30.00', '50.00', '179.90', '0.71', 'MS' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '79', '1.00', '50.00', '179.90', '0.71', 'MS' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '80', '1.00', '50.00', '179.90', '0.71', 'MT' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '81', '0.00', '30.00', '101.00', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '82', '30.00', '50.00', '150.00', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '83', '50.00', '75.00', '166.00', '0.71', 'DF' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '84', '1.00', '50.00', '179.90', '0.71', 'PE' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '87', '50.00', '100.00', '179.90', '0.71', 'PE' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '90', '22.00', '66.00', '179.90', '0.71', 'AC' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '91', '0.00', '30.00', '199.00', '0.71', 'PB' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '92', '0.00', '35.00', '179.90', '0.71', 'PR' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '93', '35.00', '55.00', '179.90', '0.71', 'PR' );
INSERT INTO `tb_transporte_preco`(`id`,`peso_de`,`peso_ate`,`preco`,`adicional_kg`,`uf`) VALUES ( '94', '55.00', '100.00', '179.90', '0.71', 'PR' );
-- ---------------------------------------------------------


-- Dump data of "classes_metodos" --------------------------
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '1', 'categorias', 'index', 'index - categorias' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '2', 'categorias', 'alterar', 'alterar - categorias' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '3', 'categorias', 'adicionar', 'adicionar - categorias' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '4', 'home', 'index', 'index - home' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '5', 'home', 'login', 'login - home' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '6', 'produtos', 'index', 'index - produtos' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '7', 'usuarios', 'sem_permissao', 'sem_permissao - usuarios' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '8', 'clientes', 'index', 'index - clientes' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '9', 'pedidos', 'index', 'index - pedidos' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '10', 'transportadoras', 'index', 'index - transportadoras' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '11', 'usuarios', 'index', 'index - usuarios' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '12', 'usuarios', 'efetuar_login', 'efetuar_login - usuarios' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '13', 'usuarios', 'logout', 'logout - usuarios' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '14', 'usuarios', 'permissoes', 'permissoes - usuarios' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '15', 'transportadoras', 'adicionar', 'adicionar - transportadoras' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '16', 'clientes', 'detalhes', 'detalhes - clientes' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '17', 'clientes', 'alterar', 'alterar - clientes' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '18', 'clientes', 'excluir', 'excluir - clientes' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '19', 'categorias', 'excluir', 'excluir - categorias' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '20', 'produtos', 'adicionar', 'adicionar - produtos' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '21', 'produtos', 'alterar', 'alterar - produtos' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '22', 'pedidos', 'detalhes', 'detalhes - pedidos' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '23', 'pedidos', 'excluir', 'excluir - pedidos' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '24', 'transportadoras', 'excluir', 'excluir - transportadoras' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '25', 'usuarios', 'alterar_permissoes', 'alterar_permissoes - usuarios' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '26', 'usuarios', 'adicionar', 'adicionar - usuarios' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '27', 'usuarios', 'alterar', 'alterar - usuarios' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '28', 'usuarios', 'excluir', 'excluir - usuarios' );
INSERT INTO `classes_metodos`(`id`,`classe`,`metodo`,`nome_amigavel`) VALUES ( '29', 'usuarios', 'salvar_alteracao', 'salvar_alteracao - usuarios' );
-- ---------------------------------------------------------


-- Dump data of "permissoes" -------------------------------
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '1' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '2' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '3' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '4' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '5' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '6' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '7' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '8' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '9' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '10' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '11' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '12' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '13' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '14' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '15' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '16' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '17' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '18' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '19' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '20' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '21' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '22' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '23' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '24' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '25' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '26' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '27' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '28' );
INSERT INTO `permissoes`(`usuario`,`metodo`) VALUES ( '1', '29' );
-- ---------------------------------------------------------


-- Dump data of "usuarios" ---------------------------------
INSERT INTO `usuarios`(`id`,`login`,`senha`) VALUES ( '1', 'admin', 'teste123' );
-- ---------------------------------------------------------


-- CREATE INDEX "ci_sessions_timestamp" --------------------
CREATE INDEX `ci_sessions_timestamp` USING BTREE ON `ci_sessions`( `timestamp` );
-- ---------------------------------------------------------


-- CREATE INDEX "FK_produtos_categorias_categoria" ---------
CREATE INDEX `FK_produtos_categorias_categoria` USING BTREE ON `produtos_categorias`( `categoria` );
-- ---------------------------------------------------------


-- CREATE INDEX "FK_metodo" --------------------------------
CREATE INDEX `FK_metodo` USING BTREE ON `permissoes`( `metodo` );
-- ---------------------------------------------------------


-- CREATE LINK "FK_produtos_categorias_categoria" ----------
ALTER TABLE `produtos_categorias`
	ADD CONSTRAINT `FK_produtos_categorias_categoria` FOREIGN KEY ( `categoria` )
	REFERENCES `categorias`( `id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "FK_produtos_categorias_produto" ------------
ALTER TABLE `produtos_categorias`
	ADD CONSTRAINT `FK_produtos_categorias_produto` FOREIGN KEY ( `produto` )
	REFERENCES `produtos`( `id` )
	ON DELETE Restrict
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "FK_metodo" ---------------------------------
ALTER TABLE `permissoes`
	ADD CONSTRAINT `FK_metodo` FOREIGN KEY ( `metodo` )
	REFERENCES `classes_metodos`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "FK_usuario" --------------------------------
ALTER TABLE `permissoes`
	ADD CONSTRAINT `FK_usuario` FOREIGN KEY ( `usuario` )
	REFERENCES `usuarios`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


