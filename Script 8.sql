use vk;
desc profiles;
select * from profiles;

alter table profiles
	add constraint profiles_user_id_fk
		foreign key (user_id) references users(id)
			on delete cascade,
	add constraint profiles_photo_id_fk
		foreign key (photo_id) references media(id)
			on delete set null;
		
			
alter table profiles modify column photo_id int(10) unsigned;
alter table users modify column id int(10) unsigned;
