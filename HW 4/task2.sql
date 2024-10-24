
-- Task 1:
INSERT INTO petEvent VALUES
    ("Fluffy", "2020-10-15", "vet", "antibiotics");

-- Task 2:
INSERT INTO petPet VALUES
    ("Hammy", "Diane", "hamster", "M", "2010-10-30", NULL);

INSERT INTO petEvent VALUES
    ("Hammy", "2020-10-15", "vet", "antibiotics");

-- Task 3:
UPDATE petEvent 
SET remark = "5 kittens, 3 female, 2 male" 
WHERE petname = "Fluffy" AND eventtype = "litter";

-- Task 4:
UPDATE petEvent
SET petname = "Claws"
WHERE remark = "broken rib";

-- Task 5:
UPDATE petPet
SET death = "2020-09-01"
WHERE petname = "Puffball";

-- Task 6:
DELETE FROM petPet
WHERE owner = "Harold" AND species = "dog";