#!/bin/bash

mysql -u ghtro -h 10.0.0.7 -p'ghtro' ghtorrent -e "
	select 
		(select count(*)
			from commits c, pull_requests p
			where p.base_commit_id = c.id
			and c.created_at > DATE_SUB(DATE('2017-09-01'), INTERVAL 6 MONTH)
			and c.created_at < DATE('2017-09-01')
			)
		as total_commits,
		(select count(*)
			from commits
			where created_at > DATE_SUB(DATE('2017-09-01'), INTERVAL 6 MONTH)
			and created_at < DATE('2017-09-01')
			)
		as total_pullreq 
	" > 2017.log
mysql -u ghtro -h 10.0.0.7 -p'ghtro' ghtorrent -e "
        select
                (select count(*)
                        from commits c, pull_requests p
                        where p.base_commit_id = c.id
                        and c.created_at > DATE_SUB(DATE('2017-03-01'), INTERVAL 6 MONTH)
			and c.created_at < DATE('2017-03-01')
		)
                as total_commits,
                (select count(*)
                        from commits
                        where created_at > DATE_SUB(DATE('2017-03-01'), INTERVAL 6 MONTH)
			and created_at < DATE('2017-03-01')
		)
                as total_pullreq
        " > 2016-2017.log;
mysql -u ghtro -h 10.0.0.7 -p'ghtro' ghtorrent -e "
        select
                (select count(*)
                        from commits c, pull_requests p
                        where p.base_commit_id = c.id
                        and c.created_at > DATE_SUB(DATE('2016-09-01'), INTERVAL 6 MONTH)
			and c.created_at < DATE('2016-09-01')

		)
                as total_commits,
                (select count(*)
                        from commits
                        where created_at > DATE_SUB(DATE('2016-09-01'), INTERVAL 6 MONTH)
			and created_at < DATE('2016-09-01')
		)
                as total_pullreq
        " > 2016.log;
mysql -u ghtro -h 10.0.0.7 -p'ghtro' ghtorrent -e "
        select
                (select count(*)
                        from commits c, pull_requests p
                        where p.base_commit_id = c.id
                        and c.created_at > DATE_SUB(DATE('2016-03-01'), INTERVAL 6 MONTH)
			and c.created_at < DATE('2016-03-01')
		)
                as total_commits,
                (select count(*)
                        from commits
                        where created_at > DATE_SUB(DATE('2016-03-01'), INTERVAL 6 MONTH)
			and created_at < DATE('2016-03-01')
			)
                as total_pullreq
        " > 2015-2016.log;
mysql -u ghtro -h 10.0.0.7 -p'ghtro' ghtorrent -e "
        select
                (select count(*)
                        from commits c, pull_requests p
                        where p.base_commit_id = c.id
                        and c.created_at > DATE_SUB(DATE('2015-09-01'), INTERVAL 6 MONTH)
			and c.created_at < DATE('2015-09-01')
		)
                as total_commits,
                (select count(*)
                        from commits
                        where created_at > DATE_SUB(DATE('2015-09-01'), INTERVAL 6 MONTH)
			and created_at < DATE('2015-09-01')
		)
                as total_pullreq
        " > 2015.log;







	
