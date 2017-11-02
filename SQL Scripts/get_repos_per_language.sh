#!/bin/bash

if [ -z "$1" ] 
then
	echo "Not enough arguments supplied"
else
LANGUAGE=$1

nohup mysql -u ghtro -h 10.0.0.7 -p'ghtro' ghtorrent -e "
	select p.id, u.login, p.name,
 		(select count(*) from pull_requests where base_repo_id = p.id) / (select count(*) from commits where project_id = p.id) * 100 as percentage, 
		(select count(*) from pull_requests where base_repo_id = p.id) as pull_rs,
		(select count(*) from commits c
			where  c.project_id = p.id
			and c.created_at > DATE_SUB(DATE('2017-09-01'), INTERVAL 6 MONTH) 
		limit 1) as commits
	from projects p, users u 
		where p.owner_id = u.id
			and p.forked_from is null
			and p.language = '"$LANGUAGE"'
		having percentage >= 50
			and percentage is not null 
			and pull_rs > 200 
			and commits >= 1
		;"
fi
