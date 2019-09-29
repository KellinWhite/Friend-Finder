/*
SELECT *
FROM scores s1
LEFT JOIN (SELECT *
FROM scores s2
WHERE s2.friend_id != s1.friend_id) t2
ON t2.question_id = s1.question_id;
*/

/* ERROR 1054 (42S22): Unknown column 't2.question_id' in 'on clause' */

SELECT question_id, friend_id, t2friend_id, answer_difference FROM 
(SELECT *, (answer-t2answer) AS answer_difference FROM
(SELECT *
FROM scores s1
LEFT JOIN (SELECT question_id AS t2question_id, friend_id AS t2friend_id, answer AS t2answer
FROM scores s2) t2
ON t2question_id = s1.question_id) t3) t4;

