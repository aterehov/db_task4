CREATE TABLE "City" (
  "Name" varchar,
  "Region" varchar
);

CREATE TABLE "Station" (
  "Name" varchar PRIMARY KEY,
  "NTracks" varchar,
  "CityName" varchar,
  "Region" varchar
);

CREATE TABLE "Train" (
  "TrainNr" integer PRIMARY KEY,
  "Length" integer,
  "StartStationName" varchar,
  "EndStationName" varchar
);

CREATE TABLE "Connection" (
  "FromStation" varchar,
  "ToStation" varchar,
  "TrainNr" integer,
  "Departure" timestamp,
  "Arrival" timestamp
);

ALTER TABLE "Station" ADD FOREIGN KEY ("CityName") REFERENCES "City" ("Name");

ALTER TABLE "Station" ADD FOREIGN KEY ("Region") REFERENCES "City" ("Region");

ALTER TABLE "Train" ADD FOREIGN KEY ("StartStationName") REFERENCES "Station" ("Name");

ALTER TABLE "Train" ADD FOREIGN KEY ("EndStationName") REFERENCES "Station" ("Name");

ALTER TABLE "Connection" ADD FOREIGN KEY ("TrainNr") REFERENCES "Train" ("TrainNr");

ALTER TABLE "Connection" ADD FOREIGN KEY ("FromStation") REFERENCES "Station" ("Name");

ALTER TABLE "Connection" ADD FOREIGN KEY ("ToStation") REFERENCES "Station" ("Name");
