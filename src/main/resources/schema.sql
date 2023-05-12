drop table if exists genre_film, films, filmes, users, friends, likes, genres, status_friendship;

CREATE TABLE IF NOT EXISTS films
(
    film_id
    integer
    GENERATED
    BY
    DEFAULT AS
    IDENTITY
    PRIMARY
    KEY,
    name
    varchar,
    description
    varchar,
    release_date
    date,
    duration
    integer,
    genre_id
    integer,
    mpa_rating_id
    integer
);

CREATE TABLE IF NOT EXISTS users
(
    user_id
    integer
    GENERATED
    BY
    DEFAULT AS
    IDENTITY
    PRIMARY
    KEY,
    email
    varchar,
    login
    varchar,
    name
    varchar,
    birthday
    date
);

CREATE TABLE IF NOT EXISTS friends
(
    friend_id
    integer,
    user_id
    integer,
    friendship
    integer
);

CREATE TABLE IF NOT EXISTS likes
(
    user_id
    integer,
    film_id
    integer
);

CREATE TABLE IF NOT EXISTS genres
(
    genre_id
    integer
    PRIMARY
    KEY,
    name
    varchar
);

CREATE TABLE IF NOT EXISTS status_friendship
(
    status_friendship_id
    integer
    PRIMARY
    KEY,
    status
    varchar
);
CREATE TABLE IF NOT EXISTS mpa_rating
(
    mpa_rating_id
    integer
    PRIMARY
    KEY,
    name
    varchar,
    description
    varchar
);
CREATE TABLE IF NOT EXISTS genre_film
(
    genre_id
    integer,
    film_id
    integer
);

ALTER TABLE friends
    ADD FOREIGN KEY (user_id) REFERENCES users (user_id);

ALTER TABLE friends
    ADD FOREIGN KEY (friend_id) REFERENCES users (user_id);

ALTER TABLE films
    ADD FOREIGN KEY (genre_id) REFERENCES genres (genre_id);

ALTER TABLE films
    ADD FOREIGN KEY (mpa_rating_id) REFERENCES mpa_rating (mpa_rating_id);

ALTER TABLE likes
    ADD FOREIGN KEY (user_id) REFERENCES users (user_id);

ALTER TABLE likes
    ADD FOREIGN KEY (film_id) REFERENCES films (film_id);

ALTER TABLE friends
    ADD FOREIGN KEY (friendship) REFERENCES status_friendship (status_friendship_id);

ALTER TABLE genre_film
    ADD FOREIGN KEY (genre_id) REFERENCES genres (genre_id);

ALTER TABLE genre_film
    ADD FOREIGN KEY (film_id) REFERENCES films (film_id);
