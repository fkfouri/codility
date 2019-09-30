-- write your code in PostgreSQL 9.4
with winners as(
    SELECT m.match_id,  m.host_team team, 3 as point, 'host' who from matches m
    where m.host_goals > m.guest_goals
    union all
    SELECT m.match_id, m.guest_team team, 3 as point, 'guest' who from matches m
    where m.host_goals < m.guest_goals
),
draw as (
  SELECT m.match_id, m.host_team team, 1 as point, 'guest' who from matches m
    where m.host_goals = m.guest_goals
    union all
  SELECT m.match_id, m.guest_team team, 1 as point, 'guest' who from matches m
    where m.host_goals = m.guest_goals    
)
select t.team_id, t.team_name, coalesce(w.point, 0) point from teams t
left join winners w on w.team = t.team_id