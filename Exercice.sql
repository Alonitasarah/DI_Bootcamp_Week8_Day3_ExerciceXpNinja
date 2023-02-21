SELECT *
FROM movies
LEFT JOIN rentals 
ON movies.movie_id = rentals.movie_id
WHERE (rating = 'G' OR rating = 'PG') 
AND (rentals.rental_id IS NULL OR rentals.return_date IS NOT NULL);


CREATE TABLE waiting_list (
    waiting_id SERIAL PRIMARY KEY,
    movie_id INTEGER REFERENCES movies.movie_id,
    child_name VARCHAR(255),
    date_added DATE
);



SELECT movies.title, COUNT(waiting_list.waiting_id) AS num_waiting
FROM movies
LEFT JOIN waiting_list ON movies.movie_id = waiting_list.movie_id
GROUP BY movies.title;
