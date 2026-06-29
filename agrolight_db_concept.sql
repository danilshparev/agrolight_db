create table user_ (
user_id serial primary key,
first_name varchar not null,
last_name varchar,
phone_number varchar unique not null,
emaelpupu varchar,
rating real default 5.00,
created_at timestamp default current_timestamp
)

select current_timestamp

select*from user_

alter table user_ 
add constraint phone_number_check check (phone_number similar to '\+7\(\d{3}\)\d{3}\-\d{2}\-\d{2}')

alter table user_
rename column emaelpupu to email;

insert into user_ (first_name,last_name,email,phone_number)
values ('Сергей','Ковалев',null,'+7(920)765-43-21'),
('Елена', 'Сергеева',null, '+7(890)123-45-67'),
('Александр', 'Николаев', 'nikolaev@mail.ru', '+7(998)765-43-21'),
('Марина', 'Васильева', 'vasilyeva@gmail.com', '+7(956)432-17-89'),
('Дмитрий', 'Леонов', 'leonov@yandex.ru', '+7(976)543-21-09'),
('Ольга', 'Романова', 'romanova@gmail.com', '+7(932)456-78-90'),
('Максим', 'Гордеев', 'gordeev@mail.ru', '+7(965)123-45-67'),
('Татьяна', 'Смирнова',null, '+7(945)678-90-12'),
('Михаил', 'Павлов', 'pavlov@example.com', '+7(912)345-67-89'),
('Наталья', 'Зайцева',null, '+7(956)452-31-78'),
('Андрей', 'Федоров', 'fedorovgmail.com', '+7(999)987-65-43'),
('Виктория', 'Михайловская', 'mikhaylovskaya@example', '+7(987)654-32-19');


insert into user_ (first_name, last_name, email, phone_number)
values ('Даниил', 'Шпарев', null, '+7(917)671-73-55')

create table driver_ (
driver_id serial primary key,
first_name varchar not null ,
last_name varchar not null,
inn varchar not null check (inn similar to '\d{12}'),
driving_passport varchar not null,
data_license_number date not null,
grade grade not null,
is_active boolean default true,
created_at timestamp default current_timestamp
)

create type grade as enum ('bronze', 'silver', 'gold')

insert into driver_ (first_name,last_name,inn,driving_passport,data_license_number,grade)
values ('Алексей', 'Кузнецов', '111222333444', '11 11 2224', '2018-07-11','bronze'),
('Елена', 'Смирнова', '555666777888', '55 56 6667', '2019-03-20','silver'),
('Дмитрий', 'Попов', '999000111222', '99 90 0008', '2020-09-25','gold'),
('Ольга', 'Захарова', '333444555666', '33 34 4446', '2014-02-18','gold'),
('Сергей', 'Орлов', '777888999000', '77 78 8878', '2017-04-06','silver'),
('Марина', 'Васильева', '444555666777', '44 45 8555', '2018-11-13','bronze'),
('Андрей', 'Федоров', '666777888999', '66 67 3777', '2019-08-29','bronze'),
('Татьяна', 'Петрова', '222333444555', '22 23 6333', '2020-05-14','gold'),
('Владимир', 'Леонов', '888999000111', '88 89 4999', '2016-12-21','silver'),
('Михаил', 'Соколов', '987654321098', '98 76 3543', '2019-10-17','gold'),
('Инна', 'Павлова', '345678901234', '34 56 5789', '2020-06-24','silver'),
('Николай', 'Ковалев', '567890123456', '56 78 3901', '2012-01-05','gold'),
('Евгений', 'Антонов', '789012345678', '89 01 2123', '2018-09-19','silver'),
('Валентина', 'Романова', '901234567890', '90 12 6345', '2015-12-31','bronze');

select*from driver_

create table tariff_ ( 
tariff_id serial primary key, 
name varchar not null, 
description varchar,
created_date timestamp default CURRENT_TIMESTAMP
);

insert into tariff_ (name,description)
values ('Эконом','Для коротких поездок'),
('Комфорт','На работу и по делам'),
('Комфорт+','Расслабиться в долгой поездке'),
('Бизнес','Особый случай'),
('Минивэн','Для большой компании');

create table car_ (
car_id serial primary key,
model varchar not null,
year int not null check (year>1700), -- год больше 1700
color varchar not null,
plate_number varchar not null check (plate_number similar to '[A-Z]{1}\d{3}[A-Z]{2}\d{1,3}'),
seats integer,
personal_driver int references  driver_(driver_id),
tariff int references tariff_ (tariff_id),
create_date timestamp default current_timestamp
)

insert into car_ (model,year,color,plate_number,seats,personal_driver,tariff)
values ('Lada Vesta', 2019, 'Black','A001AA77',4, null,1),
('Hyundai Solaris', 2020, 'White', 'B002BB88',4,12,3),
('Kia Rio', 2018, 'Silver', 'C003CC99', 4,13,2),
('Volkswagen Polo', 2021, 'Blue', 'D004DD00', 4,12,2),
('Renault Logan', 2017, 'Red', 'E005EE11',4,null,1),
('Skoda Octavia', 2020, 'Gray', 'F006FF22', 4,null,3),
('Nissan Almera', 2019, 'Green', 'G007GG33', 4,null,4),
('Toyota Camry', 2021, 'Yellow', 'H008HH44', 4,10,3),
('Ford Focus', 2018, 'Orange', 'I009II55', 4,null,2),
('Mazda CX-5', 2020, 'Purple', 'J010JJ66', 4,null,3),
('Audi A4', 2021, 'Pink', 'K011KK77', 4,8,4),
('BMW X5', 2019, 'Brown', 'L012LL88', 4,null,4),
('Mercedes-Benz E-Class', 2018, 'Gold', 'M013MM99', 4,13,4),
('Lexus RX', 2020, 'Turquoise', 'N014NN00', 4,5,4),
('Land Rover Discovery', 2021, 'Beige', 'O015OO11', 4,4,3),
('Toyota Hiace', 2022, 'White', 'P016PP22', 8,null, 5),
('Mercedes-Benz Vito', 2021, 'Silver', 'Q017QQ33', 8,null,5);

select*from car_

select model,year,color, first_name, last_name, name from car_ join driver_ on personal_driver=driver_id
join tariff_ on tariff=tariff_id 

update car_ 
set personal_driver=4
where car_id=14


