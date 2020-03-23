use raum_spring;

show databases like '%raum_spring%';


-- 메뉴 아이템 systemComponents
-- 메뉴 아이템 systemComponents

start transaction;
delete from systemComponents WHERE 1=1;
INSERT INTO systemComponents (  componentName , definitionUrl )
	values
		('InfoRaum','/info,/info/main,/info/raum'),
		('InfoStory','/info/story'),
		('InfoFactory','/info/factory'),

        ('ConsultingMain','/consulting,/consulting/main'),
        ('ConsultingFaQ','/consulting/faq'),
        ('ConsultingAS','/consulting/as'),
        ('Custom','/custom,/custom/main'),
        ('Main','/main,/'),
        ('Object','/object,/object/main'),
        ('ShowRoom','/showRoom/:type');

UPDATE systemComponents t1 SET  t1.isExact = false WHERE t1.componentName = 'ShowRoom';
commit;




-- 메뉴 아이템 systemMenus
-- 메뉴 아이템 systemMenus

start transaction;
delete from systemMenus where 1=1;

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