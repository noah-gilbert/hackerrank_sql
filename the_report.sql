select
    if(grade>=8,name,null) name,
    grade,
    marks
from students s
join grades g on if(marks=100,90,floor(marks/10)*10) = g.min_mark
order by g.grade desc, s.name asc, s.marks asc;
