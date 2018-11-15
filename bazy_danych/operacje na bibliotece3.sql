/*create table person_name (
    pn_id int auto_increment primary key,
    pn_name varchar(30) not null unique
);

create table person_surname (
    pn_id int auto_increment primary key,
    pn_surname varchar(150) not null unique
);*/

/*insert into person_name(pn_name) select distinct author_name from `authors`
insert into person_surname(pn_surname) select distinct author_surname from `authors`
*/

/*alter table `authors` add author_name_id int, add foreign key (author_name_id) references person_name(pn_id) 
on update cascade on delete restrict; 

alter table `authors` add author_surname_id int, add foreign key (author_surname_id) references person_surname(pn_id) 
on update cascade on delete restrict; */

/*update `authors` set author_name_id = (select pn_id from person_name where pn_name = author_name) */
/*update `authors` set author_surname_id = (select pn_id from person_surname where pn_surname = author_surname) */

/*select t.* from (
select 
(case when author_name <> pn_name or author_surname <> pn_surname then false else true end) as is_correct,
authors.*
from `authors` 
join person_name on author_name_id = pn_id
join person_surname on author_surname_id
) as t
where t.is_correct = false
*/

/*alter table `authors` drop foreign key authors_ibfk_1;
alter table `authors` drop foreign key authors_ibfk_2;*/

/*alter table `authors` modify author_name_id int not null;
alter table `authors` modify author_surname_id int not null
alter table `authors` drop author_name;
alter table `authors` drop author_surname*/

/*alter table `authors` add foreign key (author_name_id) references person_name(pn_id) on update cascade on delete restrict
alter table `authors` add foreign key (author_surname_id) references person_surname(pn_id) on update cascade on delete restrict */

create function f_insert_person_name(personName VARCHAR(30) ) returns integer
begin
    insert ignore into person_name(pn_name) values(personName);
    return (select pn_id from person_name where pn_name = personName);
end;

create function f_insert_person_surname(personSurname VARCHAR(150) ) returns integer
begin
    insert ignore into person_surname(ps_surname) values(personSurname);
    return (select ps_id from person_surname where ps_surname = personSurname);
end; 

/*drop function f_insert_person_surname;*/
    
insert into `authors` (author_name_id, author_surname_id) values (
f_insert_person_name('Anna'),
f_insert_person_surname('Kowalska')
/*(insert ignore into person_surname(pn_name values('Jakaś'); select last insert))*/
);
 
 select author_id, pn_name, ps_surname
 from `authors`
    join person_name ON author_name_id = pn_id
    join person_surname ON author_surname_id = ps_id
    
create view v_authors as
    select author_id, pn_name as author_name, ps_surname as author_surname
    from `authors`
        join person_name ON author_name_id = pn_id
        join person_surname ON author_surname_id = ps_id
        
select * from v_authors

create view v_books as
    select book_title, publisher_name, bd_book_description
    from book
        join publisher ON book_publisher_id = publisher_id
        join book_description ON book_id = bd_book_id
        
select * from v_books