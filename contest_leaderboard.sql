/*
Oracle SQL
*/
with
max_scores as (
    select
        distinct 
        hacker_id,
        name,
        challenge_id,
        max(score) over (partition by hacker_id,challenge_id) max_score
    from hackers h
    join submissions s using (hacker_id)
)
select 
    hacker_id,
    name,
    sum(max_score) total_score
from max_scores
group by hacker_id, name
having sum(max_score) > 0
order by sum(max_score) desc, hacker_id asc;
