SELECT * FROM systemMenus t1 ORDER BY t1.parentId ASC ;
-- 컴포넌트 아이템 systemComponents
-- 컴포넌트 아이템 systemComponents
CREATE TABLE systemComponents(
	id BIGINT auto_increment NOT NULL PRIMARY KEY,
	componentName varchar(50),
	isExact boolean default true,
	definitionUrl varchar(50),
	etc TEXT default null,
	isUsed boolean default true
);

start transaction;
delete from systemComponents WHERE 1=1;
INSERT INTO systemComponents (  componentName , definitionUrl )
	values
		('Main','/,/main'),
		('InfoRaum','/info,/info/main,/info/raum'),
		('InfoStory','/info/story'),
		('InfoFactory','/info/factory');
commit;

SELECT * FROM systemComponents;



-- 메뉴 아이템 systemMenus
-- 메뉴 아이템 systemMenus
CREATE TABLE systemMenus (
	id BIGINT auto_increment NOT NULL PRIMARY KEY,
    parentId bigint default NULL,
    displayName varchar(30),
    url varchar(50),
    etc text,
    
    foreign key (parentId) references systemMenus (id)
);

start transaction;
delete from systemMenus;

INSERT INTO systemMenus ( id , parentId ,  displayName , url) 
	values
		(1, null , '라움소개' , '/info'),
		(2, null , '라움쇼룸' , '/showroom'),
		(3, null , '오브젝트' , '/object'),
		(4, null , '제작의뢰' , '/custom'),
		(5, null , '고객센터' , '/consulting'),
        
		(6, 1 , 'RAUM' , '/info/raum'),
		(7, 1 , '배송이야기' , '/info/story'),
		(8, 1 , '공방체험' , '/info/factory'),
        
		(9, 2 , '모던형' , '/showroom/modern'),
		(10, 2 , '클래식' , '/showroom/calssic'),
        
		(11, 3 , '홈오피스' , '/object/office'),
		(12, 3 , '침실/서랍장' , '/object/bedroom'),
		(13, 3 , '거실/소파' , '/object/sofa'),
		(14, 3 , '서제/책장' , '/object/lib'),
		(15, 3 , '소품/조명' , '/object/light'),
        
        
		(16, 5 , '1:1 문의' , '/consulting/oneToone'),
		(17, 5 , '자주찾는 질문' , '/consulting/faq'),
		(18, 5 , 'AS 문의' , '/consulting/as');
        
commit;

SELECT * FROM systemMenus;


