# Creates the initial DB
# --- !Ups

CREATE TABLE Lab (
    id      SERIAL,
    acronym VARCHAR(255) NOT NULL UNIQUE,
    name    VARCHAR(500) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE Speaker (
    id      SERIAL,
    title     VARCHAR(20) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName  VARCHAR(255) NOT NULL,
    email     VARCHAR(255) NOT NULL,
    team      VARCHAR(255) NOT NULL,
    organisation      VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Conference (
    id        SERIAL,
    title     VARCHAR(255) NOT NULL,
    abstr     VARCHAR(255) NOT NULL,
    speaker   bigint NOT NULL REFERENCES Speaker(id),
    startDate TIMESTAMP NOT NULL,
    length    bigint NOT NULL, -- The duration of the conference in ms
    organizedBy      bigint NOT NULL REFERENCES Lab(id),
    accepted  boolean,
    private   boolean,
    PRIMARY KEY (id)
);

CREATE TABLE AppUser (
    id        SERIAL,
    firstName VARCHAR(255) NOT NULL,
    lastName  VARCHAR(255) NOT NULL,
    email     VARCHAR(255) NOT NULL,
    lab       bigint NOT NULL REFERENCES Lab(id),
    hashedPass VARCHAR(255),
    role      int,
    rememberMeToken VARCHAR(255),
    PRIMARY KEY (id)
)

# --- !Downs

DROP TABLE AppUser;
DROP Table Conference;
DROP TABLE Lab;
DROP TABLE Speaker;

