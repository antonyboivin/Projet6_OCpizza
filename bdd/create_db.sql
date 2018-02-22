
CREATE SEQUENCE public.etatcommande_num_commande_seq;

CREATE TABLE public.etatCommande (
                num_commande INTEGER NOT NULL DEFAULT nextval('public.etatcommande_num_commande_seq'),
                fabrication BOOLEAN NOT NULL,
                reglement BOOLEAN NOT NULL,
                livraison BOOLEAN NOT NULL,
                CONSTRAINT etatcommande_pk PRIMARY KEY (num_commande)
);


ALTER SEQUENCE public.etatcommande_num_commande_seq OWNED BY public.etatCommande.num_commande;

CREATE SEQUENCE public.client_id_client_seq;

CREATE TABLE public.client (
                id_client INTEGER NOT NULL DEFAULT nextval('public.client_id_client_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                identifiant VARCHAR(50) NOT NULL,
                mot_de_passe VARCHAR(32) NOT NULL,
                mail VARCHAR(100),
                num_tel VARCHAR(10) NOT NULL,
                adresse VARCHAR(150) NOT NULL,
                code_postale INTEGER NOT NULL,
                ville VARCHAR(50) NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (id_client)
);


ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;

CREATE SEQUENCE public.produit_id_produit_seq;

CREATE TABLE public.produit (
                id_produit INTEGER NOT NULL DEFAULT nextval('public.produit_id_produit_seq'),
                nom VARCHAR(100) NOT NULL,
                description VARCHAR(250),
                poids INTEGER NOT NULL,
                prix INTEGER NOT NULL,
                CONSTRAINT produit_pk PRIMARY KEY (id_produit)
);


ALTER SEQUENCE public.produit_id_produit_seq OWNED BY public.produit.id_produit;

CREATE SEQUENCE public.ingredient_id_ingredient_seq;

CREATE TABLE public.ingredient (
                id_ingredient INTEGER NOT NULL DEFAULT nextval('public.ingredient_id_ingredient_seq'),
                nom VARCHAR(150) NOT NULL,
                description VARCHAR(250),
                fournisseur VARCHAR(100) NOT NULL,
                prix INTEGER NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id_ingredient)
);


ALTER SEQUENCE public.ingredient_id_ingredient_seq OWNED BY public.ingredient.id_ingredient;

CREATE TABLE public.fabrication (
                id_ingredient INTEGER NOT NULL,
                id_produit INTEGER NOT NULL,
                nom VARCHAR(100) NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT fabrication_pk PRIMARY KEY (id_ingredient, id_produit)
);


CREATE SEQUENCE public.etablissement_id_restaurant_seq;

CREATE TABLE public.etablissement (
                id_restaurant INTEGER NOT NULL DEFAULT nextval('public.etablissement_id_restaurant_seq'),
                gerant_nom VARCHAR(100) NOT NULL,
                gerant_prenom VARCHAR(50) NOT NULL,
                mail VARCHAR(100) NOT NULL,
                num_tel VARCHAR(10) NOT NULL,
                adresse VARCHAR(150) NOT NULL,
                code_postale INTEGER NOT NULL,
                ville VARCHAR(50) NOT NULL,
                CONSTRAINT etablissement_pk PRIMARY KEY (id_restaurant)
);


ALTER SEQUENCE public.etablissement_id_restaurant_seq OWNED BY public.etablissement.id_restaurant;

CREATE SEQUENCE public.commande_id_commande_seq;

CREATE TABLE public.commande (
                id_commande INTEGER NOT NULL DEFAULT nextval('public.commande_id_commande_seq'),
                num_commande INTEGER NOT NULL,
                en_cours BOOLEAN NOT NULL,
                id_produit INTEGER NOT NULL,
                id_client INTEGER NOT NULL,
                id_restaurant INTEGER NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (id_commande, num_commande)
);


ALTER SEQUENCE public.commande_id_commande_seq OWNED BY public.commande.id_commande;

CREATE TABLE public.employe (
                num_secu BIGINT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                identifiant VARCHAR(50) NOT NULL,
                mot_de_passe VARCHAR(32) NOT NULL,
                poste_fonction VARCHAR(50) NOT NULL,
                num_tel VARCHAR(10),
                adresse VARCHAR(150) NOT NULL,
                code_postale INTEGER NOT NULL,
                ville VARCHAR(50) NOT NULL,
                id_restaurant INTEGER NOT NULL,
                CONSTRAINT employe_pk PRIMARY KEY (num_secu)
);


CREATE TABLE public.stock (
                id_restaurant INTEGER NOT NULL,
                id_ingredient INTEGER NOT NULL,
                nom VARCHAR(150) NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (id_restaurant, id_ingredient)
);


ALTER TABLE public.commande ADD CONSTRAINT etatcommande_commande_fk
FOREIGN KEY (num_commande)
REFERENCES public.etatCommande (num_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (id_client)
REFERENCES public.client (id_client)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fabrication ADD CONSTRAINT produit_fabrication_fk
FOREIGN KEY (id_produit)
REFERENCES public.produit (id_produit)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT produit_commande_fk
FOREIGN KEY (id_produit)
REFERENCES public.produit (id_produit)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (id_ingredient)
REFERENCES public.ingredient (id_ingredient)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.fabrication ADD CONSTRAINT ingredient_fabrication_fk
FOREIGN KEY (id_ingredient)
REFERENCES public.ingredient (id_ingredient)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT etablissement_stock_fk
FOREIGN KEY (id_restaurant)
REFERENCES public.etablissement (id_restaurant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.employe ADD CONSTRAINT etablissement_employe_fk
FOREIGN KEY (id_restaurant)
REFERENCES public.etablissement (id_restaurant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT etablissement_commande_fk
FOREIGN KEY (id_restaurant)
REFERENCES public.etablissement (id_restaurant)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
