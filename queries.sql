-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

SELECT movies.title, movies.rating
  FROM movies
  ORDER BY rating
  LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

SELECT movies.title
  FROM movies
  WHERE movies.rating IS NULL;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

SELECT movies.title, movies.synopsis
  FROM movies
  WHERE movies.synopsis LIKE '%thrilling%';

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

SELECT movies.title, movies.year, movies.rating, genres.name
  FROM movies
  LEFT JOIN genres
  ON movies.genre_id = genres.id
  WHERE genres.name LIKE '%Science Fiction%' AND movies.year BETWEEN 1980 AND 1989
  ORDER BY movies.rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

SELECT actors.name, movies.title, movies.year
  FROM movies
  LEFT JOIN cast_members ON cast_members.movie_id = movies.id
  LEFT JOIN actors ON cast_members.actor_id = actors.id
  WHERE cast_members.character LIKE '%James Bond%'
  ORDER BY movies.year;


-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

SELECT movies.title, movies.year, genres.name AS genres, actors.name AS actors
  FROM movies
  LEFT JOIN cast_members ON cast_members.movie_id = movies.id
  LEFT JOIN genres ON genres.id = movies.genre_id
  LEFT JOIN actors ON cast_members.actor_id = actors.id
  WHERE actors.name LIKE '%Julianne Moore%'
  ORDER BY movies.genre_id, movies.title;


-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

SELECT movies.title, movies.year, studios.name AS studio
  FROM movies
  LEFT JOIN genres ON genres.id = movies.genre_id
  LEFT JOIN studios ON studios.id = movies.studio_id
  WHERE genres.name LIKE '%Horror%'
  ORDER BY movies.year
  LIMIT 5;
