SELECT PostTypeId,
	   CASE WHEN PostTypeId = 1 THEN 'Question'
            WHEN PostTypeId = 2 THEN 'Answer'
            WHEN PostTypeId = 3 THEN 'Orphaned tag wiki'
            WHEN PostTypeId = 4 THEN 'Tag wiki excerpt'
            WHEN PostTypeId = 5 THEN 'Tag wiki'
            WHEN PostTypeId = 6 THEN 'Moderator nomination'
            ELSE 'Wiki placeholder' END AS PostTypes,
            COUNT(*) AS number
FROM Posts
GROUP BY PostTypeId
ORDER BY PostTypeId;

