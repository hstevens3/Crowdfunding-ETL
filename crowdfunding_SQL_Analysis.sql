-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select backers_count, cf_id
	from campaign
	where outcome='live'
	ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select count(*)
from backers
where cf_id=65;

select count(b.backer_id), c.backers_count, c.cf_id
from backers as b 
inner join campaign as c
On b.cf_id=c.cf_id
where c.outcome='live'
group by c.cf_id, c.backers_count
ORDER BY backers_count DESC;



-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

select co.first_name, co.last_name, co.email, (ca.goal-ca.pledged) as Remaining_Goal_Amount
into email_contacts_remaining_goal_amount
from contacts as co
inner join campaign as ca
On ca.contact_id=co.contact_id
where ca.outcome='live'
ORDER BY Remaining_Goal_Amount DESC;

-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

Write a SQL query that creates a new table named email_backers_remaining_goal_amount 
that contains the 
the cf_id, the company name, the description, the end date of the campaign, 
and the remaining amount of the campaign goal as "Left of Goal". 
Sort the table by the last name of each backer, in descending order.

select ba.email, ba.first_name, ba.last_name, ba.cf_id, ca.company_name,
	ca.description, ca.end_date, (ca.goal-ca.pledged) as Left_of_Goal
	into email_backers_remaining_goal_amount
from backers as ba
inner join campaign as ca
On ba.cf_id=ca.cf_id
where ca.outcome='live'
ORDER BY ba.last_name, ba.first_name;


-- Check the table


