# Création d'un serveur OCpizza avec le mot de passe "root"

# Requête permettant la création d'un utilisateur "admin" mot de passe "root"
CREATE USER admin WITH
	LOGIN
	NOSUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	REPLICATION
	CONNECTION LIMIT -1
	PASSWORD 'xxxxxx';

# Requête permettant la création d'une base de données "db_OCpizza"
CREATE DATABASE "db_OCpizza"
    WITH 
    OWNER = admin
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


# Requête insertion données dans la table etablissement

#INSERT INTO public.etablissement(
#	id_restaurant, gerant_nom, gerant_prenom, mail, num_tel, adresse, code_postale, ville)
#	VALUES (?, ?, ?, ?, ?, ?, ?, ?);

INSERT INTO public.etablissement(
	gerant_nom, gerant_prenom, mail, num_tel, adresse, code_postale, ville)
	VALUES
	('Gandalf', 'Matthéo', 'gandalfmattheo@ocpizza.fr', '0123456789', '1 rue du premier point de vente', 75001, 'Paris'),
	('Guimli', 'Jacob', 'guimlijacob@ocpizza.fr', '0134567891', '1 rue du deuxieme point de vente', 75002, 'Paris'),
	('Aragorne', 'Louisa', 'aragornelouisa@ocpizza.fr', '0145678912', '1 rue du troisieme point de vente', 75003, 'Paris'),
	('Legolas', 'Bernadette', 'legolasbernadette@ocpizza.fr', '0156789123', '1 rue du quatrieme point de vente', 75004, 'Paris'),
	('Golum', 'Raphaël', 'golumraphaël@ocpizza.fr', '0167891234', '1 rue du cienquieme point de vente', 75005, 'Paris');

#Requête insertion données dans la table employe
#INSERT INTO public.employe(
#	num_secu, nom, prenom, poste_fonction, num_tel, adresse, code_postale, ville, id_restaurant)
#	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);

INSERT INTO public.employe(
	num_secu, nom, prenom, poste_fonction, num_tel, adresse, code_postale, ville, id_restaurant)
	VALUES
	(0180017512345678, 'Gandalf', 'Matthéo', 'Responsable site', '1234567890', 'rue du premier chef', 75001, 'Paris', 1),
	(0181027523456789, 'Guimli', 'Jacob', 'Responsable de site', '2345678901', 'rue du second chef', 75002, 'Paris', 2),
	(0282037534567890, 'Aragorne', 'Louisa', 'Responsable de site', '3456789012', 'rue du troisième chef', 75003, 'Paris', 3),
	(0283047545678910, 'Legolas', 'Bernadette', 'Responsable de site', '4567890123', 'rue du quatrième chef', 75004, 'Paris', 4),
	(0184057556789011, 'Golum', 'Raphaël', 'Responsable de site', '5678901234', 'rue du ciquième chef', 75005, 'Paris', 5),
	(0185064867891012, 'Willis', 'Bruce', 'Livreur', '6789012345', 'rue du premier livreur', 75001, 'Paris', 1),
	(0286076878912345, 'Touille', 'Rata', 'Cuisinier', '7890123456', 'rue du premier cuisinier', 75001, 'Paris', 1),
	(0287080189012345, 'Croche', 'Sarah', 'Livreur', '8901234567', 'rue du second livreur', 75002, 'Paris', 2),
	(0186095115975355, 'Etchebest', 'Philippe', 'Cuisinier', '9012345678', 'rue du second cuisinier', 75002, 'Paris', 2),
	(0285107695135709, 'Statane', 'Jason', 'Livreur', '0123456789', 'rue du troisième livreur', 75003, 'Paris', 3);

#Requête insertion données dans la table ingredient
#INSERT INTO public.ingredient(
#	id_ingredient, nom, description, fournisseur, prix)
#	VALUES (?, ?, ?, ?, ?);

INSERT INTO public.ingredient(
	nom, description, fournisseur, prix)
	VALUES
	('Farine', 'Igredient de base', 'TopFarine', 0.15),
	('Tomate', 'Igredient de base', 'MaxiLegume', 0.25),
	('Basilic', 'Igredient de base', 'MaxiLegume', 0.25),
	('Champignon', 'Igredient de base', 'MaxiLegume', 0.50),
	('Pepperoni', 'Igredient de base', 'MaxiLegume', 0.30),
	('Poivron', 'Igredient de base', 'MaxiLegume', 0.75),
	('Gruyère', 'Igredient de base', 'Fondu2Fromton', 1.20),
	('Mozzarella', 'Igredient de base', 'Fromgequipeut', 1.30),
	('Gorgonzola', 'Igredient de base', 'Fromgequipeut', 1.50),
	('Parmesan', 'Igredient de base', 'Fondu2Fromton', 1.30),
	('Jambon', 'Igredient de base', 'Bou-cherie', 2.50),
	('Jambon cuit', 'Igredient de base', 'Bou-cherie', 1.50),
	('Steack hachée', 'Igredient de base', 'Quinté moins', 0.75);


#Requête insertion données dans la table ingredient
#INSERT INTO public.produit(
#	id_produit, nom, description, poids, prix)
#	VALUES (?, ?, ?, ?, ?);

INSERT INTO public.produit(
	nom, description, poids, prix)
	VALUES
	('Reine', 'Existe en version surgelée : La reine des neiges.', 300, 12),
	('4 fromages', '1 fromage + 1 fromage + 1 fromage + 1 fromage = ...', 375, 13),
	('Savoyarde', 'Sent aussi fort que bonne.', 375, 13),
	('Viandard', 'Pour ceux qui qui aime quand ça saigne.', 500, 15),
	('Végétarienne', 'Ca nourrit pas son homme mais hyper tendance', 200, 10);


#Requête insertion données dans la table client
#INSERT INTO public.client(
#	id_client, nom, prenom, mail, num_tel, adresse, code_postale, ville)
#	VALUES (?, ?, ?, ?, ?, ?, ?, ?);

INSERT INTO public.client(
	nom, prenom, mail, num_tel, adresse, code_postale, ville)
	VALUES
	('Pendragon', 'Arthur', 'arthurpendragon@kaamelott.fr', '0000000001', 'Rue du chateau', 75100, 'kaamelott'),
	('Père', 'Blaise', 'pereblaise@kaamelott.fr', '0000000002', 'Eglise du village', 75100, 'kaamelott'),
	('De Gaune', 'Bohort', 'bohortdegaune@kaamelott.fr', '0000000003', 'Rue du pleutre', 75150,'Gaune'),
	('Burgonde', 'Leroy', 'leroyburgonde@kaamelott.fr', '0000000004', 'rue du boufon du roi', 75800,'Bugondie'),
	('Camillus', 'Caius', 'caiuscamillus@kaamelott.fr', '0000000005', 'Place des envahisseurs', 75700,'Rhum'),
	('De Tintagel', 'Cryda', 'crudadetintagel@kaamelott.fr', '0000000006', 'Rue de la famille', 75600,'Tintagel'),
	('Kelliwick', 'Elias', 'eliaskelewick@kaamelott.fr', '0000000007', 'Impasse de la magie', 75300,'Kelliwickville'),
	('Darmenie', 'Hagop', 'hagopdarmenie@kaamelott.fr', '0000000008', 'Rue du défi', 75200,'armenieville'),
	('Jumelle du pecheur', 'Aziliz', 'azilizpecheur@kaamelott.fr', '0000000009', 'route de la plage', 75100,'Kaamelott'),
	('Jumelle du pecheur', 'Tumet', 'tumetpecheur@kaamelott.fr', '0000000010', 'route de la plage', 75100,'Kaamelott');


#Requête insertion données dans la table stock
#INSERT INTO public.stock(
#	id_restaurant, id_ingredient, nom, quantite)
#	VALUES (?, ?, ?, ?);

INSERT INTO public.stock(
	id_restaurant, id_ingredient, nom, quantite)
	VALUES
	(1, 1, 'Farine', 4000),
	(1, 2, 'Tomate', 5000),
	(1, 3, 'Basilic', 1000),
	(1, 4, 'Champignon', 2500),
	(2, 1, 'Farine', 3420),
	(2, 2, 'Tomate', 5482),
	(2, 3, 'Basilic', 3215),
	(2, 13, 'Steack hachée', 8951),
	(3, 5, 'Pepperoni', 6214),
	(3, 6, 'Poivron', 2301),
	(3, 7, 'Gruyère', 2015),
	(3, 8, 'Mozzarella', 8435),
	(4, 9, 'Gorgonzola', 3248),
	(4, 1, 'Farine', 8423),
	(4, 5, 'Pepperoni', 8423),
	(4, 13, 'Steack hachée', 8456),
	(5, 12, 'Jambon cuit', 5423),
	(5, 8, 'Mozzarella', 1234),
	(5, 9, 'Gorgonzola', 7845),
	(5, 5, 'Pepperoni', 3214);


#Requête insertion données dans la table fabrication
#INSERT INTO public.fabrication(
#	id_ingredient, id_produit, nom, quantite)
#	VALUES (?, ?, ?, ?);

INSERT INTO public.fabrication(
	id_ingredient, id_produit, nom, quantite)
	VALUES
	(1, 1, 'Reine', 1),
	(2, 1, 'Reine', 1),
	(7, 1, 'Reine', 1),
	(11, 1, 'Reine', 1),
	(1, 2, '4 fromages', 2),
	(2, 2, '4 fromages', 2),
	(8, 2, '4 fromages', 2),
	(9, 2, '4 fromages', 2),
	(1, 3, 'Savoyarde', 3),
	(2, 3, 'Savoyarde', 3),
	(3, 3, 'Savoyarde', 3),
	(12, 3, 'Savoyarde', 3),
	(1, 4, 'Viandard', 2),
	(2, 4, 'Viandard', 2),
	(12, 4, 'Viandard', 2),
	(13, 4, 'Viandard', 2),
	(1, 5, 'Végétarienne', 0),
	(2, 5, 'Végétarienne', 0),
	(3, 5, 'Végétarienne', 0),
	(6, 5, 'Végétarienne', 0);


#Requête insertion données dans la table etatCommande
#INSERT INTO public.etatcommande(
#	num_commande, fabrication, reglement, livraison)
#	VALUES (?, ?, ?, ?); Fabrication / reglement / livraison

INSERT INTO public.etatcommande(
	fabrication, reglement, livraison)
	VALUES
	(FALSE, FALSE, FALSE), 
	(FALSE, TRUE, FALSE),
	(TRUE, TRUE, TRUE),
	(TRUE, FALSE, FALSE),
	(TRUE, TRUE, FALSE),
	(TRUE, FALSE, TRUE);


#Requête insertion données dans la table commande
#INSERT INTO public.commande(
#	id_commande, num_commande, en_cours, id_produit, id_client, id_restaurant)
#	VALUES (?, ?, ?, ?, ?, ?);

INSERT INTO public.commande(
	num_commande, en_cours, id_produit, id_client, id_restaurant)
	VALUES
	(1, TRUE, 4, 10, 5),
	(2, TRUE, 2, 2, 2),
	(3, FALSE, 3, 7, 1),
	(4, TRUE, 1, 3, 3),
	(5, TRUE, 4, 5, 5),
	(6, TRUE, 3, 6, 3);