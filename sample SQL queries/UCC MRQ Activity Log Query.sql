SELECT WEEK(ale.date) as 'Week Number',ale.date as 'Week Of',la.name as 'Login Account',COUNT(ale.id) as 'Items Resolved' FROM activity_log_entry ale
JOIN login_account la
ON ale.LOGINACCOUNT_ID=la.id
WHERE ale.LOGINACCOUNT_ID in (6215,6820,7045,9525) AND
ale.type='RESOLVE_MRQ' AND 
ale.date>='2022-07-01'
GROUP BY WEEK(ale.date),ale.LOGINACCOUNT_ID;