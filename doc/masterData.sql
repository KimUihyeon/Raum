SELECT * FROM systemComponent;

--  메뉴 아이템 systemComponent 

Start transaction;
DELETE FROM systemComponent;
insert into systemComponent (displayName , menuType , etc , componentName , definitionUrl, url, isMenu) 
				values  ('홈', 'FOLDER', '', 'Main', '/main' , '/main' , true );

insert into systemComponent (displayName , menuType , etc , componentName , definitionUrl, url, isMenu) 
	values ('라움쇼룸', 'FOLDER', '', 'Object', '/showroom/' , '/showroom' , true );
    
insert into systemComponent (displayName , menuType , etc , componentName , definitionUrl, url, isMenu) 
	values ('오브젝트', 'FOLDER', '', 'Obejct', '/object/' , '/object' , true );
commit;



