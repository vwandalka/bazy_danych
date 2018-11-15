/*dodanie daty wprowadzenia ostatniej zmiany*/
alter table book add change_date datetime;

create trigger trg_book_before_update
before update ON book for EACH row
set NEW.change_date = now();
end;

alter table book_description add change_date datetime;

create trigger trg_book_description_before_update
before update ON book_description for EACH row
set NEW.change_date = now();
end;

/*tabela zapisująca historię zmian*/ 
alter table book_history add updated_book INT, add foreign key (updated_book) references book(book_id) ON update cascade ON delete cascade;
/*update book set book_isbn = '808592401l' where book_id = 2*/

/*drop trigger trg_book_before_update*/

create trigger trg_book_before_update
before update ON book for EACH row
begin
insert book_history (book_title, book_isbn, book_publisher_id, updated_book, change_date)
values (old.book_title, old.book_isbn, old.book_publisher_id, old.book_id, now());
set NEW.change_date = now();
end;

create table users (
user_id INT AUTO_INCREMENT, 
user_name VARCHAR(30) not null unique, 
user_name_id INT not null, 
user_surname_id INT not null, 

primary key (user_id), 
foreign key (user_name_id) references person_name(pn_id) ON update cascade ON delete restrict, 
foreign key (user_surname_id) references person_surname(ps_id) ON update cascade ON delete restrict
);

create table book_status (
bs_id INT AUTO_INCREMENT,
bs_name VARCHAR(150) not null,

primary key (bs_id)
);

create table book_copy (
bc_id INT AUTO_INCREMENT,
bc_book_id INT not null, 
bc_library_number INT not null,
bc_book_status INT not null, 

primary key (bc_id),
foreign key (bc_book_id) references book(book_id) ON update cascade ON delete restrict,
foreign key (bc_book_status) references book_status(bs_id) ON update cascade ON delete restrict
);

create table category (
category_id INT AUTO_INCREMENT primary key,
category_name VARCHAR(30) not null unique,
category_parent_id INT null, 

foreign key (category_parent_id) references category(category_id) ON update cascade ON delete restrict
)

create table category_book (
cb_book_id INT not null,
cb_category_id INT not null, 

primary key (cb_book_id, cb_category_id),
foreign key (cb_book_id) references book(book_id) ON update cascade ON delete restrict,
foreign key (cb_category_id) references category(category_id) ON update cascade ON delete restrict
);

create table rent_history (
rh_id INT AUTO_INCREMENT primary key,
rh_user_id INT not null,
rh_book_copy_id INT not null, 
rh_rent_date datetime not null default now(),
rh_return_date datetime null, 

foreign key (rh_book_copy_id) references book_copy(bc_id) ON update cascade ON delete restrict,
foreign key (rh_user_id) references users(user_id) ON update cascade ON delete restrict
);

create function f_rent_a_book(userId INT, bookCopy INT) returns bool
begin 
    select bc_book_status into @bookStatus from book_copy where bc_id = bookCopy;
    if (@bookStatus > 1) then
        return false;
    end if;
        insert rent_history (rh_book_copy_id, rh_user_id)
        values (bookCopy, userId);
        update book_copy set bc_book_status = 3 where bc_id = bookCopy;
        return true;
end;

/*select f_rent_a_book(8, 5)*/

create function f_return_a_book(bookCopy INT) returns bool
begin
    if (select bc_id from book_copy where bc_id = bookCopy) is null then
        return false;
    end if; 
    select bc_book_status into @bookStatus from book_copy where bc_id = bookCopy;
    if (@bookStatus < 3) then
        return false;
    end if;
        update book_copy set bc_book_status = 1 where bc_id = bookCopy;
        update rent_history set rh_return_date = now() where rh_book_copy_id = bookCopy and rh_return_date is null;
        return true;
end;

/*select f_return_a_book(3)*/

select book_id, book_title, book_isbn, count(bc_id) 
    from book
        join book_copy ON book_id = bc_book_id and bc_book_status = 1
    group by book_id
    
    