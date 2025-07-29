-- Q1: Who is the senior most employee based on job title?
select employee_id,title,first_name || ' ' || last_name as Name,levels
from employee
order by levels desc
limit 1

-- Q2: Which countries have the most Invoices?
select count(*),billing_country
from invoice
group by billing_country
order by 2 desc

-- Q3: What are top 3 values of total invoice?
select total
from invoice
order by 1 desc
limit 3

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals.
Return both the city name & sum of all invoice totals */
select billing_city,SUM(total) as invoice_totals
from invoice
group by billing_city
order by 2 desc

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money. */
select c.customer_id, c.first_name,c.last_name,sum(i.total) as total
from invoice i
join customer c on i.customer_id=c.customer_id
group by c.customer_id
order by total
limit 1

/* MID:- Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A */

select Distinct c.email, c.first_name,c.last_name,g.name
from customer c
join invoice i on c.customer_id=i.customer_id
join invoice_line il on i.invoice_id=il.invoice_id
join track t on il.track_id=t.track_id
join genre g on t.genre_id=g.genre_id
where g.name like 'Rock'
order by c.email asc

/* Q2: Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock */

select ar.name,count(ar.artist_id) as No_of_songs
from artist ar
join album al on ar.artist_id=al.artist_id
join track t on t.album_id=al.album_id
join genre g on g.genre_id=t.genre_id
where g.name='Rock'
group by ar.name
order by 2 desc
limit 10

/* Q3: Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

WITH average_length AS (
    SELECT AVG(milliseconds) AS avg_length
    FROM track
)
select t.name,t.milliseconds as song_length
from average_length a,track t
where t.milliseconds > a.avg_length
order by 2 desc

/* Q1: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent. */
WITH best_sellingartist AS (
SELECT artist.artist_id AS artist_id, artist.name AS artist_name,
SUM (invoice_line.unit.
[price*invoice_line.quantity) AS total_sales
FROM invoice_ line
JOIN track ON track. track_id = invoice_line. track_id
JOIN album ON album.album_id = track.album_id
JOIN
artist ON artist.artist_id = album.artist_id
GROUP BY 1
ORDER BY 3 DESC
LIMIT 1 )
SELECT c.customer_id, c.first_name, c.last_name, bsa.artist_name, SUM(il.unit_pricexil.quantity)
FROM invoice i
JOIN customer c ON c. customer_id = i. customer_id
JOIN invoice_line il ON il. invoice_id = i. invoice_id
JOIN track t ON t. track_id = il. track_id
JOIN album alb ON alb.album_id = t.album_id
JOIN best_sellingartists bsa ON bsa.artist_id = alb.artist_id
GROUP BY 1,2,3,4
ORDER BY 5 DESC;



/* Q2: We want to find out the most popular music Genre for each country.
We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres. */
with h_genre as
( 
select count(il.quantity) as Purchases,c.country,g.name,g.genre_id ,
  row_number()over (partition by c.country order by count(il.quantity) desc) as rowno
  from invoice_line il 
  join invoice i on il.invoice_id=i.invoice_id
  join customer c on c.customer_id=i.customer_id
  join track t on t.track_id=il.track_id
  join genre g on g.genre_id=t.genre_id
  group by 2,3,4
  order by 2 asc,1 desc
)
select *
from h_genre
where rowno <=1

/* Q3: Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount */

WITH Customter_with_country AS (
SELECT customer.customer_id, first_name, last_name,billing_country,SUM(total) AS total_spending,
ROW_NUMBER () OVER (PARTITION
BY billing_country ORDER BY SUM (total) DESC) AS RowNo
FROM invoice
JOIN customer ON customer.customer_id = invoice.customer_id
GROUP BY 1,2,3,4
ORDER BY 4 ASC, 5 DESC )
SELECT * FROM Customter_with_country WHERE RowNo <= 1





