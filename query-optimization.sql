DROP INDEX IF EXISTS idx_spotify_album;

EXPLAIN ANALYZE
SELECT album, MAX(energy), MIN(energy)
FROM spotify
GROUP BY album;



CREATE INDEX idx_spotify_album
ON spotify(album);


EXPLAIN ANALYZE
SELECT album, MAX(energy), MIN(energy)
FROM spotify
GROUP BY album;