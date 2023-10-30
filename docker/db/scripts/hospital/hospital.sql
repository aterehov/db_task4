CREATE TABLE "StationsPersonal" (
  "PersNr" integer PRIMARY KEY,
  "Name" varchar,
  "StatNr" integer
);

CREATE TABLE "Station" (
  "StatNr" integer PRIMARY KEY,
  "Name" varchar
);

CREATE TABLE "Doctor" (
  "PersNr" integer PRIMARY KEY,
  "Name" varchar,
  "StatNr" integer,
  "Area" varchar,
  "Rang" integer
);

CREATE TABLE "Caregivers" (
  "PersNr" integer PRIMARY KEY,
  "Name" varchar,
  "StatNr" integer,
  "Qualification" varchar
);

CREATE TABLE "Patient" (
  "PatientNr" integer PRIMARY KEY,
  "Name" varchar,
  "Disease" varchar,
  "RoomNr" integer,
  "from" timestamp,
  "to" timestamp
);

CREATE TABLE "Room" (
  "StatNr" integer,
  "RoomNr" integer,
  "NBeds" integer
);

CREATE TABLE "Treats" (
  "PatientNr" integer,
  "PersNr" integer
);

ALTER TABLE "StationsPersonal" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "StationsPersonal" ADD FOREIGN KEY ("StatNr") REFERENCES "Doctor" ("PersNr");

ALTER TABLE "StationsPersonal" ADD FOREIGN KEY ("Name") REFERENCES "Doctor" ("Name");

ALTER TABLE "StationsPersonal" ADD FOREIGN KEY ("StatNr") REFERENCES "Doctor" ("StatNr");

ALTER TABLE "StationsPersonal" ADD FOREIGN KEY ("PersNr") REFERENCES "Caregivers" ("PersNr");

ALTER TABLE "StationsPersonal" ADD FOREIGN KEY ("Name") REFERENCES "Caregivers" ("Name");

ALTER TABLE "StationsPersonal" ADD FOREIGN KEY ("StatNr") REFERENCES "Caregivers" ("StatNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("RoomNr") REFERENCES "Room" ("RoomNr");

ALTER TABLE "Room" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "Treats" ADD FOREIGN KEY ("PatientNr") REFERENCES "Patient" ("PatientNr");

ALTER TABLE "Treats" ADD FOREIGN KEY ("PersNr") REFERENCES "StationsPersonal" ("PersNr");
