/*książki wraz z opisami przez pwn*/
select book_id,book_title,bd_book_description
    from publisher
    join book ON book_publisher_id=publisher_id
    left join book_description ON bd_book_id=book_id
    where publisher_name='pwn';
/*lista wydawców, którzy wydali książki Grzędowiacza*/
select publisher_name
    from authors
    join book_author on ba_author_id=author_id
    join book on book_id=ba_book_id
    join publisher on publisher_id=book_publisher_id
    where author_surname='Grzędowicz';
/*lista autorów, których książki zostały wydane przez PWN*/
select author_name, author_surname
    from publisher
    join book on book_publisher_id=publisher_id
    join book_author on ba_book_id=book_id
    join authors on author_id=ba_author_id
    where publisher_name='pwn';



 
