/*select distinct t.author_name, t.author_surname
    from (
    select distinct author_name, author_surname, publisher_name
        from publisher
            join book ON book_publisher_id = publisher_id
            join book_author ON ba_author_id = ba_book_id
            join `authors` ON author_id = ba_author_id
        where publisher_name = 'fabryka slow'
        or publisher_name = 'PWN'
    ) as t
*/

/* select author_name, author_surname, publisher_name
    from publisher
        join book on book_publisher_id = publisher_id
        join book_author on ba_author_id = ba_book_id
        join `authors` on author_id = ba_author_id
    where publisher_name = 'fabryka slow'
        
union

select author_name, author_surname, publisher_name
    from publisher
        join book on book_publisher_id = publisher_id
        join book_author on ba_author_id = ba_book_id
        join `authors` on author_id = ba_author_id
    where publisher_name = 'pwn'
*/
    
/*select max(author_id)+1 from `authors`*/

/*select distinct (
    select author_id from `authors` order by author_id desc limit 1
    ) +1
    from `authors`
*/
    
/*select author_name, author_surname, count(book_id) as books_written
    from `authors` 
        join book_author on ba_author_id = author_id
        join book on book_id = ba_book_id
    group by author_id
    order by books_written desc
    limit 1
*/

/*select publisher_name, count(book_id) as books_published
    from publisher 
        join book on book_publisher_id = publisher_id
    group by publisher_name
    order by books_published desc
*/

/*lista autorow ktorzy wydali najwiecej ksiazek w jednym wyd*/
select author_name, author_surname, count(book_id) as books_published, publisher_name
    from `authors`
        join book_author ON ba_author_id = author_id
        join book ON book_id = ba_book_id
        join publisher ON publisher_id = book_publisher_id
    group by author_id, publisher_id
    order by books_published desc
