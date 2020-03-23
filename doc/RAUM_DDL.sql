SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `members`;
DROP TABLE IF EXISTS `memberLevels`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `postsFaQ`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `carts`;
DROP TABLE IF EXISTS `suppliers`;
DROP TABLE IF EXISTS `productCategories`;
DROP TABLE IF EXISTS `productDetails`;
DROP TABLE IF EXISTS `payments`;
DROP TABLE IF EXISTS `orderProducts`;
DROP TABLE IF EXISTS `systemMenus`;
DROP TABLE IF EXISTS `systemMenuRules`;
DROP TABLE IF EXISTS `systemLogs`;
DROP TABLE IF EXISTS `commnet`;
DROP TABLE IF EXISTS `postsQnA`;
DROP TABLE IF EXISTS `showroom`;
DROP TABLE IF EXISTS `showroomProducts`;
DROP TABLE IF EXISTS `postsFaQCategories`;
DROP TABLE IF EXISTS `commentReal`;
DROP TABLE IF EXISTS `delivery`;
DROP TABLE IF EXISTS `systemFiles`;
DROP TABLE IF EXISTS `systemComponents`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `systemFiles` (
    `id` BIGINT NOT NULL,
    `fileType` VARCHAR(25) NOT NULL,
    `path` TEXT NOT NULL,
    `fileSize` DOUBLE NOT NULL,
    `orgFileName` TEXT NOT NULL,
    `extension` VARCHAR(20) NOT NULL,
    `regDate` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE systemComponents(
	id BIGINT auto_increment NOT NULL PRIMARY KEY,
	componentName varchar(50),
	isExact boolean default true,
	definitionUrl varchar(50),
	etc TEXT default null,
	isUsed boolean default true
);

CREATE TABLE `memberLevels` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `title` VARCHAR(30) NOT NULL,
    `description` TEXT
);

CREATE TABLE `suppliers` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `companyName` VARCHAR(50) NOT NULL,
    `ceoName` VARCHAR(50) NOT NULL,
    `tel` VARCHAR(50) NOT NULL,
    `etc` TEXT,
    `address1` VARCHAR(100) NOT NULL,
    `address2` VARCHAR(100) NOT NULL,
    `address3` VARCHAR(100),
    `postNumber` VARCHAR(20) NOT NULL
);

CREATE TABLE `productCategories` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `name` VARCHAR(50) NOT NULL,
    `etc` TEXT
);



CREATE TABLE `members` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `memberLevelId` BIGINT NOT NULL,
    `userId` varchar(200) NOT NULL,
    `userPw` TEXT NOT NULL,
    `tel` VARCHAR(50)  NOT NULL,
    `emailSuffix` VARCHAR(50)  NOT NULL,
    `emailPrefix` VARCHAR(50)  NOT NULL,
    `address1` VARCHAR(100) NOT NULL,
    `address2` VARCHAR(100) NOT NULL ,
    `address3` VARCHAR(100) ,
    `postNumber` VARCHAR(20)  NOT NULL,
    `regDate` DATETIME default CURRENT_TIMESTAMP,
    `singupType` VARCHAR(30) DEFAULT '직접가입',
    UNIQUE (`userId`),
    foreign key (`memberLevelId`) references memberLevels (`id`)
);


CREATE TABLE `products` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `supplierId` BIGINT NOT NULL,
    `categoryId` BIGINT,
    `thumbnailPath` TEXT,
    `memberId` BIGINT NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `price` DOUBLE DEFAULT 9999999,
    `sale` DOUBLE Default 0 ,
    `isUse` BOOLEAN default true,
    `hit` INT default 0,
    FOREIGN KEY (`supplierId`) references suppliers (`id`),
    foreign key (`categoryId`) references productCategories (`id`),
    Foreign key (`memberId`) references  members (`id`)
);


CREATE TABLE systemMenus (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    parentId bigint default NULL,
    displayName varchar(30),
    url varchar(50),
    etc text,

    foreign key (parentId) references systemMenus (id)
);



CREATE TABLE `productDetails` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `productId` BIGINT NOT NULL,
    `objectFileId` BIGINT default null,
    `regDate` DATETIME NOT NULL,
    `delDate` DATETIME NOT NULL,
    `context` TEXT default null,
    foreign key (`productId`) references products (`id`),
    foreign key (`objectFileId`) references systemFiles (`id`)
);

CREATE TABLE `systemLogs` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `regDate` DATETIME default CURRENT_TIMESTAMP,
    `exception` TEXT NOT NULL,
    `message` TEXT NOT NULL
);


CREATE TABLE `postsFaQCategories` (
    `id` BIGINT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `postsFaQ` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `faqCategoryId` BIGINT NOT NULL,
    `memberId` BIGINT NOT NULL,
    `answer` TEXT NOT NULL,
    `question` TEXT NOT NULL,
    `hit` INT default 0,
    `regDate` DATETIME default CURRENT_TIMESTAMP,
    `editDate` DATETIME default CURRENT_TIMESTAMP,
    Foreign key (`faqCategoryId`) references postsFaQCategories (`id`)
);

CREATE TABLE `delivery` (
    `id` BIGINT NOT NULL,
    `orderId` BIGINT NOT NULL,
    `postCompanyNumber` TEXT NOT NULL,
    `postCompany` VARCHAR(50) NOT NULL,
    `deliveryType` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`id`)
);


CREATE TABLE `systemMenuRules` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `menuId` BIGINT NOT NULL,
    `memberLevelId` BIGINT NOT NULL
);

--


CREATE TABLE `orders` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `orderSerialNumber` varchar(100) NOT NULL,
    `memberId` BIGINT NOT NULL,
    `ect` TEXT,
    `productTotalPrice` DOUBLE NOT NULL,
    `paymentPrice` DOUBLE NOT NULL,
    `deliveryPrice` double NOT NULL default 1,
    `orderDate` DATETIME NOT NULL default CURRENT_TIMESTAMP,
    UNIQUE (`orderSerialNumber`),
    foreign key (`memberId`) REFERENCES members (`id`)
);

CREATE TABLE `carts` (
    `memberId` BIGINT NOT NULL,
    `productId` BIGINT NOT NULL
);

CREATE TABLE `payments` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `orderId` BIGINT NOT NULL,
    `paymentType` VARCHAR(30) NOT NULL,
    `paymentDate` DATETIME default CURRENT_TIMESTAMP,
    FOREIGN KEY (`orderId`) references orders (`id`)
);

CREATE TABLE `orderProducts` (
    `productId` BIGINT NOT NULL,
    `orderId` BIGINT NOT NULL
);



CREATE TABLE `comment` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `commentId` BIGINT DEFAULT null,
    `memberId` BIGINT NOT NULL,
    `goodScore` INT default 0,
    `badScore` INT default 0,
    `regDate` DATETIME default CURRENT_TIMESTAMP,
    `editDate` DATETIME  default CURRENT_TIMESTAMP,
    `delDate` DATETIME  default CURRENT_TIMESTAMP,
    foreign key (`commentId`) references comment (`id`),
    foreign key (`memberId`) references members (`id`)
);

CREATE TABLE `postsQnA` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `memberId` BIGINT NOT NULL,
    `regDate` DATETIME default CURRENT_TIMESTAMP,
    `question` TEXT NOT NULL,
    `contact` TEXT NOT NULL,
    `contactWay` VARCHAR(20) NOT NULL,
    foreign key (`memberId`) references members (`id`)
);

CREATE TABLE `showroom` (
    `id` BIGINT primary key AUTO_INCREMENT NOT NULL ,
    `thumbnailPath` BIGINT NOT NULL,
    `title` VARCHAR(100) NOT NULL,
    `bundlePrice` DOUBLE default  999999
);

CREATE TABLE `showroomProducts` (
    `id` BIGINT NOT NULL,
    `showroomId` BIGINT NOT NULL,
    `productId` BIGINT NOT NULL,
    `url` VARCHAR(50) NOT NULL,
    `regDate` DATETIME  default CURRENT_TIMESTAMP,
    `delDate` DATETIME  default CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    foreign key (`showroomId`) references showroom (`id`),
    foreign key (`productId`) references  products (`id`)
);


CREATE TABLE `commentReal` (
    `id` BIGINT NOT NULL,
    `memberId` BIGINT NOT NULL,
    `goodScore` INT NOT NULL,
    `badScore` INT NOT NULL,
    `redDate` DATETIME NOT NULL,
    `editDate` DATETIME NOT NULL,
    `delDate` DATETIME NOT NULL,
    `isUse` BOOLEAN NOT NULL,
    `imageFIleId` BIGINT NOT NULL,
    PRIMARY KEY (`id`)
);

