-- Easy Level
-- Retrieve the names of all tracks that have more than 1 billion streams.

SELECT track
FROM spotify
WHERE stream > 1000000000;


-- List all albums along with their respective artists.


SELECT DISTINCT album, artist
FROM spotify;


-- Get the total number of comments for tracks where licensed = TRUE.

SELECT SUM(comments) AS total_comments
FROM spotify
WHERE licensed = TRUE;

-- Find all tracks that belong to the album type single.

SELECT track
FROM spotify
WHERE album_type = 'single';

-- Count the total number of tracks by each artist.

SELECT artist, COUNT(*) AS total_tracks
FROM spotify
GROUP BY artist
ORDER BY total_tracks DESC;

-- Medium Level
-- Calculate the average danceability of tracks in each album.

SELECT 
    album,
    AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY album
ORDER BY avg_danceability DESC;

-- Find the top 5 tracks with the highest energy values.

SELECT 
    track,
    energy
FROM spotify
ORDER BY energy DESC
LIMIT 5;

-- List all tracks along with their views and likes where official_video = TRUE.

SELECT 
    track,
    views,
    likes
FROM spotify
WHERE official_video = TRUE;


-- For each album, calculate the total views of all associated tracks.

SELECT 
    album,
    SUM(views) AS total_views
FROM spotify
GROUP BY album
ORDER BY total_views DESC;


-- Retrieve the track names that have been streamed on Spotify more than YouTube.
-- stream for Spotify and views for YouTube.

SELECT 
    track,
    stream,
    views
FROM spotify
WHERE stream > views;

-- Advanced Level
-- Find the top 3 most-viewed tracks for each artist using window functions.

WITH ranked_tracks AS (
    SELECT 
        artist,
        track,
        views,
        RANK() OVER (
            PARTITION BY artist
            ORDER BY views DESC
        ) AS rank
    FROM spotify
)
SELECT 
    artist,
    track,
    views
FROM ranked_tracks
WHERE rank <= 3
ORDER BY artist, views DESC;


-- Write a query to find tracks where the liveness score is above the average.

SELECT 
    track,
    liveness
FROM spotify
WHERE liveness > (
    SELECT AVG(liveness)
    FROM spotify
);


-- Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
WITH album_energy AS (
    SELECT 
        album,
        MAX(energy) AS max_energy,
        MIN(energy) AS min_energy
    FROM spotify
    GROUP BY album
)

SELECT 
    album,
    max_energy,
    min_energy,
    ROUND((max_energy - min_energy)::NUMERIC, 2) AS energy_difference
FROM album_energy
ORDER BY energy_difference DESC;


