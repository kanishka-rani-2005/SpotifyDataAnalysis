# SpotifyDataAnalysis
## Overview

This project analyzes a Spotify music dataset using **PostgreSQL** to extract meaningful insights about artists, tracks, albums, audio features, engagement, and streaming performance.

The project covers SQL queries from basic data retrieval to advanced analysis using **aggregation, CTEs, window functions, filtering, and query optimization**.


## Objectives

- Analyze tracks, artists, and albums.
- Identify highly streamed tracks.
- Analyze engagement through views, likes, and comments.
- Compare Spotify streams with YouTube views.
- Analyze audio characteristics such as danceability and energy.
- Find top tracks for each artist.
- Practice advanced SQL concepts such as CTEs and window functions.
- Understand query optimization and indexing using `EXPLAIN ANALYZE`.

## Dataset

The dataset contains **20,594 records** and includes information such as:

- Artist
- Track
- Album
- Album Type
- Danceability
- Energy
- Loudness
- Speechiness
- Acousticness
- Instrumentalness
- Liveness
- Valence
- Tempo
- Duration
- Title
- Channel
- Views
- Likes
- Comments
- Licensed
- Official Video
- Stream
- Energy/Liveness
- Most Played On

## Database & Technologies

- **Database:** PostgreSQL 18.6
- **Tool:** pgAdmin 4 / psql
- **Language:** SQL
- **Dataset:** Spotify / YouTube music dataset


## Query Optimization
Objective

To understand the impact of indexing and compare query execution performance using PostgreSQL's EXPLAIN ANALYZE.

The following query groups the dataset by album and calculates the maximum and minimum energy for each album.

Query
```bash
SELECT
    album,
    MAX(energy) AS max_energy,
    MIN(energy) AS min_energy
FROM spotify
GROUP BY album;
```

Index Created
```bash
CREATE INDEX idx_spotify_album
ON spotify(album);
```
EXPLAIN ANALYZE

The query was executed before and after creating the index.

## Performance Improvement

The execution time decreased from:

16.273 ms → 10.600 ms

Difference:

5.673 ms

Approximate improvement:

34.9%

The EXPLAIN ANALYZE output is useful because it shows both the actual execution time and the execution plan chosen by PostgreSQL.

## Key Insights

This project demonstrates how SQL can be used to:

Find highly streamed tracks.
Analyze artist and album performance.
Measure audience engagement.
Compare Spotify streams with YouTube views.
Analyze audio characteristics.
Rank tracks within individual artists.
Compare energy levels across albums.
Optimize and evaluate SQL queries using execution plans.

## Learning Outcomes

Through this project, I strengthened my understanding of:

PostgreSQL
SQL data analysis
Aggregation and grouping
Filtering and sorting
CTEs
Window functions
Ranking
Subqueries
Data type handling
Indexing
EXPLAIN ANALYZE
Query execution plans
Performance analysis


## Conclusion

This project demonstrates practical SQL skills by analyzing a real-world music dataset with PostgreSQL.

The analysis combines fundamental SQL operations with advanced techniques such as CTEs, window functions, ranking, and query optimization. The indexing experiment also provided practical experience with PostgreSQL execution plans and demonstrated that an index is not always selected by the query planner.

Overall, the project shows how SQL can be used to transform raw music data into meaningful insights while also understanding database performance and optimization.

## Author

Kanishka Rani

Computer Science Engineering Student
Thapar Institute of Engineering and Technology

Email: kanishka22043@gmail.com
