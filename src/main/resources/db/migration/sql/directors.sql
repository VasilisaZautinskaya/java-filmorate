--Режиссёры
drop table if exists directors CASCADE;

CREATE TABLE IF NOT EXISTS directors
(
    director_id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name varchar(255)
);