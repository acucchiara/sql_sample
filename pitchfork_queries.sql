/* Query to find the earliest 10 given by pitchfork */
SELECT artist, title, score, pub_date
FROM reviews
WHERE score = '10'
GROUP BY pub_date
LIMIT 1;

/* Query to determine how many artists have more than 1 score of 10/10 from pitchfork */
SELECT artist, COUNT(*)
FROM reviews
WHERE score = 10
GROUP BY artist
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;


/* Query that sorts the 10/10 reviews by genre reviewed, and changes NULL values to Other */
SELECT COUNT(*), 
    CASE
        WHEN genre IS NULL THEN 'Other' ELSE genre
    END
        AS genre
FROM reviews
FULL JOIN genres
ON reviews.reviewID = genres.reviewID
WHERE reviews.score = 10
GROUP BY genre
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;


/* A query that finds the 10 longest reviews, as well as the content and artist reviewed */
SELECT LENGTH(content.content) AS TotalChars, reviews.artist, reviews.title, reviews.score, reviews.pub_date, content.content
FROM reviews
INNER JOIN content
ON reviews.reviewID = content.reviewID
ORDER BY LENGTH(content.content) DESC
LIMIT 10;

/* A query to determine the frequency of each score given and format the returned data */
SELECT score, COUNT(*) AS Frequency
FROM reviews
GROUP BY score
ORDER BY COUNT(*) DESC;