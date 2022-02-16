-- SELECT *
-- FROM authors
-- WHERE author_id IN (
--   SELECT author_id FROM books WHERE pages > 1000
-- );

-- UPDATE books
-- SET pages = 7
-- WHERE book_id IN (
--   SELECT book_id
--   FROM books
--   WHERE title = 'Tiny Book'
-- );

-- DELETE
-- FROM books
-- WHERE author_id IN (
--   SELECT author_id
--   FROM authors
--   WHERE author = 'Williams'
-- );

-- 1. Get all invoices where the unit_price on the invoice_line is greater than $0.99.

SELECT * FROM invoice
WHERE invoice_id IN(
  SELECT invoice_id FROM invoice_line
  WHERE unit_price > 0.99
);

-- 2. Get all playlist tracks where the playlist name is Music.

SELECT * FROM playlist_track
WHERE playlist_id IN(
    SELECT playlist_id FROM playlist
    WHERE name = 'Music'
);

-- 3. Get all track names for playlist_id 5. (should query 1477 results)

SELECT * FROM track
WHERE track_id IN(
    SELECT track_id FROM playlist_track
    WHERE playlist_id = 5
);

-- 4. Get all tracks where the genre is Comedy. track, genre => genre_id

SELECT * FROM track
WHERE genre_id IN(
    SELECT genre_id FROM genre
    WHERE genre_id = 22
);

-- 5. Get all tracks where the album is Fireball.

SELECT * FROM track
WHERE album_id IN(
    SELECT album_id FROM album
    WHERE album_id = 60
);

-- 6. Get all tracks for the artist Queen (artist_id: 51; name: Queen) ( 2 nested subqueries ). track, artist,

SELECT * FROM track
WHERE album_id IN(
    SELECT album_id FROM album
    WHERE artist_id IN(
        WHERE artist_id FROM artist
        WHERE artist_id = 51
    )
);