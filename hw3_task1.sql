-- Домашнее задание к лекции #3 «Проектирование БД. Связи. 3НФ»
-- Задание состоит из двух частей:
-- Спроектировать и нарисовать схему (как в первой домашней работе). Прислать изображение со схемой.
-- Написать SQL-запросы, создающие спроектированную БД (как во второй домашней работе).
-- Прислать ссылку на файл, содержащий SQL-запросы.
-- Написать SQL-запросы для создания таблиц из схемы, реализованной в предыдущем домашнем задании.
-- Результатом работы является файл, содержащий SQL-запросы.
-- drop table if exists Track cascade ;
-- drop table if exists Album cascade ;
-- drop table if exists Artist cascade ;
-- drop table if exists Collection cascade ;
-- drop table if exists Genre cascade ;
-- drop table if exists ArtistGenre cascade ;
-- drop table if exists ArtistAlbum cascade ;
-- drop table if exists TrackCollection cascade ;

create table if not exists Genre (
    id serial primary key,
    genre_name varchar(100) not null unique
);

create table if not exists Artist (
    id serial primary key,
    name varchar(100) not null unique
);

create table if not exists ArtistGenre (
    artist_id integer references Artist(id),
    genre_id integer references Genre(id),
    constraint pk_ArtistGenre primary key (artist_id, genre_id)
);

create table if not exists Album (
    id serial primary key,
    album_name varchar(100) not null,
    album_year integer not null check (album_year > 0)
);

create table if not exists ArtistAlbum (
    artist_id integer not null references Artist(id),
    album_id integer not null references Album(id),
    constraint pk_ArtistAlbum primary key (artist_id, album_id)
);

create table if not exists Track (
    id serial primary key,
    track_name varchar(100) not null,
--     track_time interval minute to second not null,
    track_time numeric(6,2) not null check ( track_time > 0 ),
    album_id integer not null references Album(id)
);

create table if not exists Collection (
    id serial primary key,
    collection_name varchar(100) not null,
    collection_year numeric(6,2) not null check ( collection_year > 0 )
);

create table if not exists TrackCollection (
    track_id integer not null references Track(id),
    collection_id integer not null references Collection(id),
    constraint pk_TrackCollection primary key (track_id, collection_id)
);
