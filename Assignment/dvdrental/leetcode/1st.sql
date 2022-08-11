-- manager with ar least 5 direct report
-- 570
--employee(id, name , department, managerId)
-- query 
select name 
from employee
where id in 
         (SELECT managerId 
         from employee
         group by managerId
         having count(DISTINCT id) >= 5)


--get highest answer rate question 
-- 578
-- input(uid, action, question_id, answer_id, q_num, timestamp)
SELECT question_id as survey_log
from (SELECT question_id,
    sum (case when action = 'show' then 1 else 0 end) as show_count, 
    sum (case when action = 'answer' then 1 else 0 end) as answer_count
    from survey_log
    GROUP by question_id) as t
ORDER by answer_count/show_count desc limit 1 ;

-- project employees i
-- 1075
--project(project_id, employee_id)
--employee(employee_id,name , exp_year)
SELECT 
   p.project_id, 
   round(avg(e.exp_year), 2) average_years
from project p join employee e  on 
     p.employee_id = e.employee_id
group BY 
     p.project_id
    