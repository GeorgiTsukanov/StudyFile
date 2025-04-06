CREATE TABLE Auto_sal( 
    id_salon NUMBER(5) PRIMARY KEY,
    city VARCHAR(25) NOT NULL,
    street VARCHAR(25) NOT NULL,
    
    CONSTRAINT check_id_salon CHECK (id_salon >=10000 and id_salon<= 99999)
);

CREATE TABLE Car(
    id_auto NUMBER PRIMARY KEY,
    id_salon NUMBER REFERENCES Auto_sal(id_salon),
    mark_auto VARCHAR(25) NOT NULL,
    made_in VARCHAR(25),
    colour VARCHAR(25) NOT NULL
    
    CONSTRAINT check_id_auto CHECK (id_auto >=10000 and id_auto<= 99999)
);



CREATE TABLE Arendator(
    id_arendator NUMBER(5) PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name  VARCHAR(30) NOT NULL,
    birth_day DATE,
    adress VARCHAR(100),
    phone_number VARCHAR(12) NOT NULL,
    
    CONSTRAINT check_id_arendator CHECK (id_arendator >=10000 and id_arendator<= 99999),
    CONSTRAINT check_phone_number CHECK (LENGTH(phone_number) BETWEEN 12 AND 15 AND
    REGEXP_LIKE(phone_number, '^\+[0-9]+$')
        
);



CREATE TABLE Auto_for_rent(
    id_auto_for_rent NUMBER(5) PRIMARY KEY,
    id_arendator NUMBER(5) REFERENCES Arendator(id_arendator),
    id_auto NUMBER(5) REFERENCES Car(id_auto),
    id_salon NUMBER(5) REFERENCES Auto_sal(id_salon),
    rental_date DATE NOT NULL,
    return_date DATE NOT NULL,
    returned CHAR(1),
    forfeit NUMBER,
    
    CONSTRAINT check_id_auto_for_rent CHECK (id_auto_for_rent >=10000 and id_auto_for_rent<= 99999)
);

DROP TABLE Auto_sal;
DROP TABLE Auto_for_rent;
DROP TABLE Arendator;
DROP TABLE Car;

