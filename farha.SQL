CREATE TABLE utilisateur (
    id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    nom_utilisateur VARCHAR(100) NOT NULL,
    prenom_utilisateur VARCHAR(100) NOT NULL,
    email_utilisateur VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE reservation (
    id_reservation INT PRIMARY KEY AUTO_INCREMENT,
    quantite_reduit INT NOT NULL CHECK (quantite_reduit >= 0),
    quantite_normal INT NOT NULL CHECK (quantite_normal >= 0),
    id_edition INT NOT NULL,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY (id_edition) REFERENCES edition(id_edition) ON DELETE CASCADE,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur) ON DELETE CASCADE
);
CREATE TABLE salle (
    id_salle INT PRIMARY KEY,
    capacite INT,
    description TEXT
);
CREATE TABLE evenement (
    id_evenement INT PRIMARY KEY,
    type_evenement VARCHAR(255),
    description TEXT,
    categorie VARCHAR(100),
    tarif_reduit DECIMAL(10, 2),
    tarif_normal DECIMAL(10,2)
);
CREATE TABLE billet (
    id_billet INT PRIMARY KEY,
    type_billet VARCHAR(100),
    prix_billet DECIMAL(10, 2),
    nombre_billet INT,
    id_reservation INT,
    FOREIGN KEY (id_reservation) REFERENCES reservation(id_reservation)
);
CREATE TABLE edition (
    id_edition INT PRIMARY KEY,
    heure TIME,
    date DATE,
    id_evenement INT,
    FOREIGN KEY (id_evenement) REFERENCES evenement(id_evenement)
);
