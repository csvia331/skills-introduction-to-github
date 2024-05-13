SELECT Posts.PostTypeId,
	   CASE WHEN Posts.PostTypeId = 1 THEN 'Question'
            WHEN Posts.PostTypeId = 2 THEN 'Answer'
            WHEN Posts.PostTypeId = 3 THEN 'Orphaned tag wiki'
            WHEN Posts.PostTypeId = 4 THEN 'Tag wiki excerpt'
            WHEN Posts.PostTypeId = 5 THEN 'Tag wiki'
            WHEN Posts.PostTypeId = 6 THEN 'Moderator nomination'
            ELSE 'Wiki placeholder' END AS PostTypes, Tags, Posts.Title, Posts.Body, Posts.CommentCount, Posts.ViewCount 
FROM Posts
JOIN(
SELECT PostTypeId, MAX(CommentCount) AS max_commentcount, ViewCount 
FROM Posts
WHERE CommentCount >0
GROUP BY PostTypeId
ORDER BY PostTypeId
)AS max_comment_post ON Posts.PostTypeId = max_comment_post.PostTypeId
					AND Posts.CommentCount = max_comment_post.max_commentcount
ORDER BY PostTypeId;

