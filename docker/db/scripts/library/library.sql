CREATE TABLE "Reader" (
  "ID" integer PRIMARY KEY,
  "LastName" varchar,
  "FirstName" varchar,
  "Address" varchar,
  "BirthDate" timestamp
);

CREATE TABLE "Book" (
  "ISBN" integer,
  "Title" varchar,
  "Author" varchar,
  "PagesNum" integer,
  "PubYear" timestamp,
  "PubName" varchar
);

CREATE TABLE "Publisher" (
  "PubName" varchar PRIMARY KEY,
  "PubAddress" varchar
);

CREATE TABLE "Category" (
  "CategoryName" varchar PRIMARY KEY,
  "ParentCat" varchar
);

CREATE TABLE "Copy" (
  "ISBN" integer,
  "CopyNumber" integer,
  "ShelfPosition" integer,
  PRIMARY KEY ("ISBN", "CopyNumber")
);

CREATE TABLE "Borrowing" (
  "ReaderNr" integer,
  "ISBN" integer,
  "CopyNumber" integer,
  "ReturnDate" timestamp
);

CREATE TABLE "BookCat" (
  "ISBN" integer,
  "CategoryName" varchar
);

ALTER TABLE "Borrowing" ADD FOREIGN KEY ("ReaderNr") REFERENCES "Reader" ("ID");

ALTER TABLE "Copy" ADD FOREIGN KEY ("CopyNumber") REFERENCES "Borrowing" ("CopyNumber");

ALTER TABLE "Copy" ADD FOREIGN KEY ("ISBN") REFERENCES "Borrowing" ("ISBN");

ALTER TABLE "Copy" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Category" ADD FOREIGN KEY ("ParentCat") REFERENCES "Category" ("CategoryName");

ALTER TABLE "BookCat" ADD FOREIGN KEY ("CategoryName") REFERENCES "Category" ("CategoryName");

ALTER TABLE "BookCat" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Book" ADD FOREIGN KEY ("PubName") REFERENCES "Publisher" ("PubName");
