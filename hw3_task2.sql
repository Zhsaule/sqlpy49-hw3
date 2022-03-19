-- Домашнее задание к лекции #3 «Проектирование БД. Связи. 3НФ»
-- Дополнительное (необязательное) задание
-- Спроектировать отношение (или схему из нескольких отношений) "Сотрудник".
-- У каждого сотрудника есть следующие параметры:
-- Имя
-- Отдел
-- Начальник (ссылка на начальника)
-- Примечание: начальник - тоже сотрудник. Отдел можно хранить строкой, можно идентификатором (не принципиально).
-- Необходимо написать SQL-запрос, создающий таблицу "Сотрудник",
-- и прислать ссылку на файл с этим запросом.
drop table if exists Employee cascade;

create table if not exists  Employee (
    id serial primary key,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    department varchar(100) not null,
    head_of_department_id integer references Employee(id)
);

