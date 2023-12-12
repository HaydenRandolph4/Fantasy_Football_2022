SELECT *
FROM fantasy_football;
#Reviewing the Data

SELECT *
FROM fantasy_football
WHERE Position = 'QB'
ORDER BY PPR
LIMIT 5;
#Top 5 PPR Fantasy Quarterbacks

SELECT *
FROM fantasy_football
WHERE Position = 'RB'
ORDER BY PPR DESC
LIMIT 5;
#Top 5 PPR Fantasy Runningbacks

SELECT *
FROM fantasy_football
WHERE Position = 'WR'
ORDER BY PPR DESC
LIMIT 5;
#Top 5 PPR Fantasy Wide Receivers

SELECT *
FROM fantasy_football
ORDER BY PPR DESC
LIMIT 5;
#Top 5 PPR Fantasy Players Overall

SELECT *
FROM fantasy_football
ORDER BY PPR DESC;
#ALL Players ordered by PPR Desc

SELECT AGE, COUNT(AGE) AS Players, ROUND(AVG(PPR),1) AS Average_PPR
FROM fantasy_football
GROUP BY AGE
HAVING Players >= 3
ORDER BY Average_PPR DESC;
#Average PPR by Age (Minimum 3 Players in Age Group);

SELECT Position, COUNT(*) AS Players, ROUND(AVG(PPR),1) AS Average_PPR
FROM fantasy_football
GROUP BY Position
ORDER BY Average_PPR DESC;
#Average PPR Scores By Position;

SELECT Name, Pass_Yds/`Games Played` AS Pass_Yds_per_Game, Pass_TD/Pass_Att AS TD_Per_Pass_Att
FROM fantasy_football
WHERE Position = 'QB'
ORDER BY Pass_Yds_per_Game DESC
LIMIT 5;
#QB Yards Per Game and Touchdown Rate By Pass Attempt

SELECT Name, Rec_Rec, Pass_Tgt, Rec_Yds, ROUND(Rec_Yds/Pass_Tgt,1) AS Yds_per_Target
FROM fantasy_football
WHERE Position = 'WR' AND Pass_Tgt >= 50
ORDER BY Yds_per_Target DESC
LIMIT 5;
#Top 5 Receivers with Highest yards per target, minimum 50 targets

SELECT
  Position,
  Name,
  PPR,
  RANK() OVER (PARTITION BY Position ORDER BY PPR DESC) AS Positional_Rank
FROM fantasy_football
WHERE Position IN ('QB', 'RB', 'WR')
ORDER BY Position, Positional_Rank;
#Fantasy Ranking of QB,RB, and WR By Position.


