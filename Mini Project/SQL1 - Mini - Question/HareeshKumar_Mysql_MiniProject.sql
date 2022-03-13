use ipl;

-- 1.	Show the percentage of wins of each bidder in the order of highest to lowest percentage.

select distinct bidder_id from ipl_bidder_details;

select ipd.BIDDER_ID,bidder_name,(bid_won.wins/ibp.no_of_bids)*100 as Percent_of_Wins
from ipl_bidder_details ipd inner join ipl_bidder_points ibp
on ipd.bidder_id = ibp.bidder_id
inner join 
     (select bidder_id,count(bid_status) as wins 
      from ipl_bidding_details ipds
       where BID_STATUS = 'Won'
       group by bidder_id
	) as bid_won
on bid_won.bidder_id = ibp.bidder_id
group by ipd.bidder_id,bidder_name
order by Percent_of_Wins desc; 

-- 2.Display the number of matches conducted at each stadium with stadium name, city from the database.

select ip.STADIUM_ID,STADIUM_NAME,CITY,count(MATCH_ID) as no_of_matches
from ipl_stadium ip INNER JOIN ipl_match_schedule ims on ip.STADIUM_ID = ims.STADIUM_ID
group by STADIUM_ID
order by STADIUM_ID;

-- 3.In a given stadium, what is the percentage of wins by a team which has won the toss?

Select ist.STADIUM_NAME,(sum((Case when Toss_winner=Match_winner then 1 else 0 end))/count(*) )*100 
as 'percentage of wins' from ipl_stadium ist join ipl_match_schedule ms
on ist.stadium_id =ms.STADIUM_ID join ipl_match im on ms.match_id= im.match_id
group by ist.STADIUM_NAME
order by 1;

-- 4.	Show the total bids along with bid team and team name.

select BID_TEAM,Team_name,count(bidder_id) as total_bids 
from ipl_bidding_details bd
join ipl_team t on bd.BID_TEAM=t.team_id
group by bid_team;

-- 5.	Show the team id who won the match as per the win details.

select  match_winner as team_id,win_details from ipl_match
group by win_details;

-- 6.	Display total matches played, total matches won and total matches lost by team along with its team name.

select its.team_id, it.team_name, sum(MATCHES_PLAYED) as total_matches_played, sum(MATCHES_WON) as total_matches_won,
sum(MATCHES_LOST) as total_matches_lost
from ipl_team_standings as its
join ipl_team as it on its.team_id = it.team_id
group by team_ID;

-- 7.	Display the bowlers for Mumbai Indians team.
SELECT player_name
FROM ipl_team_players i1 JOIN ipl_team i2 ON i1.team_id = i2.team_id JOIN ipl_player i3 ON i1.player_id = i3.player_id
WHERE i1.player_role = 'Bowler' AND i2.team_name = 'Mumbai Indians';

-- 8.	How many all-rounders are there in each team, Display the teams with more than 4  all-rounder in descending order.

SELECT COUNT(*) AS 'Number of All Rounders',i1.team_id,i2.team_name
FROM ipl_team_players i1 JOIN ipl_team i2 ON i1.team_id = i2.team_id JOIN ipl_player i3 ON i1.player_id = i3.player_id
WHERE i1.player_role = 'All-Rounder'
GROUP BY team_id
HAVING COUNT(*) > 4
ORDER BY 'Number of All Rounders' DESC;

