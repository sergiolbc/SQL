# View movie info

DROP PROCEDURE if exists show_mov_info;

delimiter $
CREATE PROCEDURE show_mov_info(user_entry varchar(255))
	BEGIN
		SELECT video_id, video_rented, video_name, video_genre, video_release_date, video_director
        FROM video
        WHERE user_entry LIKE video_id OR user_entry LIKE video_rented OR user_entry LIKE video_name OR user_entry LIKE video_genre OR user_entry LIKE video_release_date OR user_entry LIKE video_director;
        
        END$
delimiter ;
