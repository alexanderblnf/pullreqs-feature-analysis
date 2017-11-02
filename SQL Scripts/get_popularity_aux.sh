#!/bin/bash

mysql -u ghtro -h 10.0.0.7 -p'ghtro' ghtorrent -e "
        select 
                (select count(distinct c.project_id)
                        from commits c, pull_requests p
                        where p.base_commit_id = c.id
                        and c.created_at > DATE_SUB(DATE('2017-09-01'), INTERVAL 2 MONTH)
                        and c.created_at < DATE('2017-09-01'))
                as total_pullreq,
                (select count(distinct project_id)
                        from commits c
                        where c.created_at > DATE_SUB(DATE('2017-09-01'), INTERVAL 2 MONTH)
                        and c.created_at < DATE('2017-09-01')
                )
                as total_commits 
        " > 2017-2months.log

