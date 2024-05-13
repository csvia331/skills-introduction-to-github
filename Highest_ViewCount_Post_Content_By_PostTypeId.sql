SELECT Posts.PostTypeId,
	   CASE WHEN Posts.PostTypeId = 1 THEN 'Question'
            WHEN Posts.PostTypeId = 2 THEN 'Answer'
            WHEN Posts.PostTypeId = 3 THEN 'Orphaned tag wiki'
            WHEN Posts.PostTypeId = 4 THEN 'Tag wiki excerpt'
            WHEN Posts.PostTypeId = 5 THEN 'Tag wiki'
            WHEN Posts.PostTypeId = 6 THEN 'Moderator nomination'
            ELSE 'Wiki placeholder' END AS PostTypes, Tags, Posts.Title, Posts.Body, Posts.CommentCount, Posts.AnswerCount, Posts.ViewCount 
FROM Posts
JOIN(
SELECT PostTypeId, CommentCount, MAX(ViewCount) AS max_viewcount
FROM Posts
WHERE ViewCount IS NOT NULL
GROUP BY PostTypeId
ORDER BY PostTypeId
)AS max_view_post ON Posts.PostTypeId = max_view_post.PostTypeId
				 AND Posts.ViewCount = max_view_post.max_viewcount
ORDER BY PostTypeId;

