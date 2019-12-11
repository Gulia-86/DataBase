-- Задание 2:
-- Хорошо, но не учтено что нам интересны только друзья.
-- 2.	Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

SELECT CONCAT(
    'Заданный пользователь ',
       'больше всех общался с ',
       first_name,' ', last_name) as qwe
       FROM users 
       where id =
             (select max(total_messages) from
                    (SELECT COUNT(*) AS total_messages FROM messages 
    WHERE to_user_id = 4 
      AND from_user_id IN (
        SELECT friend_id AS id 
          FROM friendship 
            WHERE user_id = messages.to_user_id
        UNION
        SELECT user_id AS id 
          FROM friendship 
            WHERE friend_id = messages.to_user_id    
        )
         group by from_user_id) as cht
);

-- Задание 3:
-- Верное направление, но likes.user_id это тот кто поставил лайк а не получил.
-- 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей


SELECT target_id AS user, (SELECT first_name FROM users WHERE id = target_id) AS first_name, (SELECT last_name FROM users WHERE id = target_id) AS last_name, COUNT(*) AS likes FROM likes
	WHERE target_id IN (
		SELECT * FROM ( 
			SELECT id FROM users 
  			ORDER BY created_at_old DESC
 			LIMIT 10
 		) as ch)
 	GROUP BY target_id;
  
 
 -- В целом очень хорошо, жаль нет пятого задания.
 -- 5.	Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
 
SELECT CONCAT(first_name, ' ', last_name) AS user, 
	(SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) + 
	(SELECT COUNT(*) FROM media WHERE media.user_id = users.id) + 
	(SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) 
	AS overall_activity 
	FROM users
	ORDER BY overall_activity
	LIMIT 10;
	
 
 
 
 
