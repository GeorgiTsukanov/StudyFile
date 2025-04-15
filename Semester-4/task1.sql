CREATE TABLE Auto_sal( 
    id_salon NUMBER(5) PRIMARY KEY,
    city VARCHAR(25) NOT NULL,
    street VARCHAR(25) NOT NULL,
    
    CONSTRAINT check_id_salon CHECK (id_salon >= 10000 AND id_salon <= 99999),
    CONSTRAINT check_city_capital CHECK (city = INITCAP(city))
);

CREATE TABLE Car(
    id_auto NUMBER PRIMARY KEY,
    id_salon NUMBER REFERENCES Auto_sal(id_salon),
    mark_auto VARCHAR(25) NOT NULL,
    made_in VARCHAR(25),
    colour VARCHAR(25) NOT NULL,
    
    CONSTRAINT check_id_auto CHECK (id_auto >= 10000 AND id_auto <= 99999)
);

CREATE TABLE Arendator(
    id_arendator NUMBER(5) PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    birth_day DATE,
    adress VARCHAR(100),
    phone_number VARCHAR(12) NOT NULL,
    
    CONSTRAINT check_id_arendator CHECK (id_arendator >= 10000 AND id_arendator <= 99999),
    CONSTRAINT check_phone_number CHECK (
        LENGTH(phone_number) BETWEEN 12 AND 15 
        AND REGEXP_LIKE(phone_number, '^\+[0-9]+$'))
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
    
    CONSTRAINT check_id_auto_for_rent CHECK (id_auto_for_rent >= 10000 AND id_auto_for_rent <= 99999)
);

--âñòàâêà
INSERT INTO Auto_sal (id_salon, city, street) 
VALUES (10000, 'Moscow', 'Lenina');
INSERT INTO Auto_sal (id_salon, city, street) 
VALUES(10001, 'Saint-Petersburg', 'Nevskiy');
INSERT INTO Auto_sal (id_salon, city, street) 
VALUES(10002, 'Kazan', 'Baumana');


INSERT INTO Arendator (id_arendator, first_name, last_name, birth_day, adress, phone_number)
VALUES (20000, 'Ivan', 'Ivanov', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'st. Kolotushkin, 10', '+79161234567');
INSERT INTO Arendator (id_arendator, first_name, last_name, birth_day, adress, phone_number)
VALUES (20001, 'Petr', 'Petrov', TO_DATE('1985-11-22', 'YYYY-MM-DD'), 'st. Pushkin, 5', '+79262345678');


INSERT INTO Car (id_auto, id_salon, mark_auto, made_in, colour)
VALUES (30000, 10000, 'Toyota Camry', 'Japan', 'Black');
INSERT INTO Car (id_auto, id_salon, mark_auto, made_in, colour)
VALUES(30001, 10001, 'BMW X5', 'Germany', 'White');
INSERT INTO Car (id_auto, id_salon, mark_auto, made_in, colour)
VALUES(30002, 10002, 'Kia Rio', 'Korea', 'Red');

INSERT INTO Auto_for_rent (id_auto_for_rent, id_arendator, id_auto, id_salon, rental_date, return_date, returned, forfeit)
VALUES (40000, 20000, 30000, 10000, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-01-20', 'YYYY-MM-DD'), 'T', 0);
INSERT INTO Auto_for_rent (id_auto_for_rent, id_arendator, id_auto, id_salon, rental_date, return_date, returned, forfeit)
VALUES (40001, 20001, 30001, 10001,  TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2024-02-25', 'YYYY-MM-DD'), 'F', 5000);
