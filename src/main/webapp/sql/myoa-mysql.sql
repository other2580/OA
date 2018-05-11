/* 建库建表 */
DROP DATABASE IF EXISTS myoa;
CREATE DATABASE myoa;

USE myoa;

/*** HR部分 ***/

#部门
CREATE TABLE Department(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(50) UNIQUE NOT NULL,
	FixedPhone VARCHAR(20) NOT NULL,
	MovePhone VARCHAR(20) NOT NULL,
	Fax VARCHAR(20) NOT NULL,
	Description VARCHAR(256) NOT NULL,
	`Status` TINYINT NOT NULL
)ENGINE INNODB;
INSERT INTO Department(NAME,FixedPhone,MovePhone,Fax,Description,STATUS) VALUES('人事部','086-66771199','13132211125','0591-11112222','HR',1);
INSERT INTO Department(NAME,FixedPhone,MovePhone,Fax,Description,STATUS) VALUES('市场部','086-66772288','13155667812','0592-22223333','Martket',1);
INSERT INTO Department(NAME,FixedPhone,MovePhone,Fax,Description,STATUS) VALUES('研发部','086-66773377','13162369854','0593-33334444','Development',1);
INSERT INTO Department(NAME,FixedPhone,MovePhone,Fax,Description,STATUS) VALUES('运维部','086-66774466','13122001505','0594-44445555','Maintaince',1);
INSERT INTO Department(NAME,FixedPhone,MovePhone,Fax,Description,STATUS) VALUES('综合部','086-66775555','13199846305','0595-55556666','Other',1);

SELECT * FROM Department;

#员工
CREATE TABLE Employee(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Nr VARCHAR(30) NOT NULL,
	PASSWORD VARCHAR(60) NOT NULL,
	NAME VARCHAR(30) NOT NULL,
	Gender BIT NOT NULL,
	EntryDate DATETIME,
	Email VARCHAR(30) NOT NULL,
	DepartmentId INT,
	IsManager BIT NOT NULL,
	STATUS TINYINT
)ENGINE INNODB;
ALTER TABLE Employee ADD CONSTRAINT uq_Employee_Nr UNIQUE(Nr);
ALTER TABLE Employee ADD CONSTRAINT fk_Employee_Department FOREIGN KEY(DepartmentId) REFERENCES Department(Id);

INSERT INTO Employee(Id,Nr,PASSWORD,NAME,Gender,EntryDate,Email,DepartmentId,IsManager,STATUS) VALUES(1,'Nr001','aa20b73011f39edf393c7c23ee65ce1d','张三',1,'2016-01-03','1429153268@qq.com',1,1,1);
INSERT INTO Employee(Id,Nr,PASSWORD,NAME,Gender,EntryDate,Email,DepartmentId,IsManager,STATUS) VALUES(2,'Nr002','5dd2886477078a3002569e9bfe8bafbf','李四',1,'2017-11-07','1429163568@qq.com',1,0,1);
INSERT INTO Employee(Id,Nr,PASSWORD,NAME,Gender,EntryDate,Email,DepartmentId,IsManager,STATUS) VALUES(3,'Nr003','123','王五',1,'2016-07-23','1459153268@qq.com',1,0,1);
INSERT INTO Employee(Id,Nr,PASSWORD,NAME,Gender,EntryDate,Email,DepartmentId,IsManager,STATUS) VALUES(4,'Nr004','123','赵六',1,'2018-08-27','1427153868@qq.com',2,0,1);
INSERT INTO Employee(Id,Nr,PASSWORD,NAME,Gender,EntryDate,Email,DepartmentId,IsManager,STATUS) VALUES(5,'Nr005','123','Zoe',0,'2014-10-04','1429153268@qq.com',3,1,1);
INSERT INTO Employee(Id,Nr,PASSWORD,NAME,Gender,EntryDate,Email,DepartmentId,IsManager,STATUS) VALUES(6,'Nr006','123','John',1,'2017-06-11','1329153768@qq.com',3,0,1);

SELECT * FROM Employee;

/*** 权限部分 ***/

#角色
CREATE TABLE Role(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	`Name` VARCHAR(50) NOT NULL
)ENGINE INNODB;
ALTER TABLE Role ADD CONSTRAINT uq_Role_Name UNIQUE(NAME);
INSERT INTO Role VALUES(1,'Admin');
INSERT INTO Role VALUES(2,'Junior');
INSERT INTO Role VALUES(3,'Common');

#员工与角色多对多关系
CREATE TABLE EmployeeRole(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	EmployeeId INT NOT NULL,
	RoleId INT NOT NULL
)ENGINE INNODB;
ALTER TABLE EmployeeRole ADD CONSTRAINT fk_EmployeeRole_Employee FOREIGN KEY(EmployeeId) REFERENCES Employee(Id) ON DELETE CASCADE;
ALTER TABLE EmployeeRole ADD CONSTRAINT fk_EmployeeRole_Role FOREIGN KEY(RoleId) REFERENCES Role(Id) ON DELETE CASCADE;
INSERT INTO EmployeeRole VALUES(1,1,1);
INSERT INTO EmployeeRole VALUES(2,1,3);
INSERT INTO EmployeeRole VALUES(3,2,2);
INSERT INTO EmployeeRole VALUES(4,3,3);

#功能
CREATE TABLE FUNCTION(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	`Name` VARCHAR(50) NOT NULL,
	`Code` VARCHAR(50) NOT NULL,
	IsMenuItem BIT NOT NULL,
	MenuLogo VARCHAR(50) NULL,
	MenuEntry VARCHAR(512) NULL,
	ParentId INT
)ENGINE INNODB;
ALTER TABLE FUNCTION ADD CONSTRAINT uq_FUNCTION_Name UNIQUE(NAME);
ALTER TABLE FUNCTION ADD CONSTRAINT uq_FUNCTION_Code UNIQUE(`Code`);
INSERT INTO FUNCTION VALUES(10,'组织机构','organization',1,'','',NULL);
INSERT INTO FUNCTION VALUES(11,'部门管理','organization-department',1,'','organization/department',10);
INSERT INTO FUNCTION VALUES(12,'员工管理','organization-employee',1,'','organization/employee',10);
INSERT INTO FUNCTION VALUES(20,'内部邮件','message',1,'','',NULL);
INSERT INTO FUNCTION VALUES(21,'收件箱','message-inbox',1,'','message/inbox',20);
INSERT INTO FUNCTION VALUES(22,'发件箱','message-outbox',1,'','message/outbox',20);
INSERT INTO FUNCTION VALUES(23,'草稿箱','message-draft',1,'','message/draft',20);
INSERT INTO FUNCTION VALUES(30,'日程管理','activity',1,'','',NULL);
INSERT INTO FUNCTION VALUES(31,'我的日历','activity-calendar',1,'','activity/calendar',30);
INSERT INTO FUNCTION VALUES(32,'日程列表','activity-list',1,'','activity/list',30);
INSERT INTO FUNCTION VALUES(40,'公告','announcement',1,'','',NULL);
INSERT INTO FUNCTION VALUES(41,'查看公告','announcement-list',1,'','announcement/list',40);
INSERT INTO FUNCTION VALUES(42,'我的公告','announcement-mine',1,'','announcement/mine',40);
INSERT INTO FUNCTION VALUES(43,'公告审批','announcement-approve',1,'','announcement/approve',40);
INSERT INTO FUNCTION VALUES(50,'文档共享','document',1,'','',NULL);
INSERT INTO FUNCTION VALUES(51,'文档管理器','document-manager',1,'','document/manager',50);
INSERT INTO FUNCTION VALUES(60,'权限管理','security',1,'','',NULL);
INSERT INTO FUNCTION VALUES(61,'角色权限管理','security-role',1,'','security/role',60);
INSERT INTO FUNCTION VALUES(62,'用户角色管理','security-user',1,'','security/user',60);

#角色功能多对多关系
CREATE TABLE RoleFunction(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	RoleId INT REFERENCES Roles(Id),
	FunctionId INT REFERENCES Functions(Id)
)ENGINE INNODB;
ALTER TABLE RoleFunction ADD CONSTRAINT fk_RoleFunction_Role FOREIGN KEY(RoleId) REFERENCES Role(Id)ON DELETE CASCADE;
ALTER TABLE RoleFunction ADD CONSTRAINT fk_RoleFunction_Function FOREIGN KEY(FunctionId) REFERENCES FUNCTION(Id);
INSERT INTO RoleFunction VALUES(1,1,30);
INSERT INTO RoleFunction VALUES(2,1,31);
INSERT INTO RoleFunction VALUES(3,1,32);
INSERT INTO RoleFunction VALUES(4,2,20);
INSERT INTO RoleFunction VALUES(5,2,21);
INSERT INTO RoleFunction VALUES(6,2,22);
INSERT INTO RoleFunction VALUES(7,3,10);
INSERT INTO RoleFunction VALUES(8,3,11);
INSERT INTO RoleFunction VALUES(9,3,12);
INSERT INTO RoleFunction VALUES(10,1,60);
INSERT INTO RoleFunction VALUES(11,1,61);
INSERT INTO RoleFunction VALUES(12,1,62);


/*** 业务部分 ***/

#公告
CREATE TABLE Announcement(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Title VARCHAR(256)  NOT NULL,
	Content TEXT NOT NULL,
	CreatorId INT NOT NULL,
	CreateTime DATETIME NOT NULL,
	LastEditTime DATETIME NOT NULL,
	ApproverId INT,
	ApproveTime DATETIME,
	STATUS TINYINT NOT NULL
);
ALTER TABLE Announcement ADD CONSTRAINT fk_Document_Employee_Creator FOREIGN KEY(CreatorId) REFERENCES Employee(Id) ON DELETE CASCADE;
ALTER TABLE Announcement ADD CONSTRAINT fk_Document_Employee_Approver FOREIGN KEY(ApproverId) REFERENCES Employee(Id) ON DELETE CASCADE;
INSERT INTO Announcement(Title,Content,CreatorId,CreateTime,LastEditTime,ApproverId,ApproveTime,STATUS) 
	VALUES('关于加强考勤管理的决定','鉴于最近公司考勤率有下降趋势，人事部决定加强考勤管理，在公司前台设置指纹打卡系统，望各位知照。',2,'2017-03-06','2017-03-06',1,'2017-03-06',3);
INSERT INTO Announcement(Title,Content,CreatorId,CreateTime,LastEditTime,ApproverId,ApproveTime,STATUS) 
	VALUES('关于加班补休的申报问题','请各位申报本月的加班时长。',2,'2017-03-06','2017-03-06',1,'2017-03-06',2);
INSERT INTO Announcement(Title,Content,CreatorId,CreateTime,LastEditTime,ApproverId,ApproveTime,STATUS) 
	VALUES('关于2017年新入职员工的培训工作','请各位新员工于本月28号上午10点到人事部会议室参加新员工培训启动大会',2,'2017-03-06','2017-03-06',1,'2017-03-06',0);


#文档
CREATE TABLE Document(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(256) NOT NULL,
	Description TEXT,
	CreatorId INT NOT NULL,
	CreateTime DATETIME NOT NULL,
	TYPE VARCHAR(30) NOT NULL,
	FileUrl VARCHAR(512),
	ParentId INT
);
ALTER TABLE Document ADD CONSTRAINT fk_Document_Employee FOREIGN KEY(CreatorId) REFERENCES Employee(Id) ON DELETE CASCADE;
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(1,'人事部共享资料','人事部共享资料...',2,'2017-03-06','FOLDER',NULL,0);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(2,'研发部共享资料','开发部共享资料...',2,'2017-03-06','FOLDER',NULL,0);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(3,'市场部共享资料','市场部共享资料...',2,'2017-03-06','FOLDER',NULL,0);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(4,'新员工资料','新员工资料...',1,'2017-03-06','FOLDER',NULL,1);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(5,'请假条模板','请假条模板...',1,'2017-03-06','docx','Upload/00001.docx',1);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(6,'报销单模板','报销单模板...',2,'2017-03-06','docx','Upload/00002.docx',1);	
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(7,'报销单模板','报销单模板...',2,'2017-03-06','docx','Upload/00002.docx',1);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(8,'OA系统项目资源','OA系统项目资源...',5,'2017-04-08','FOLDER',NULL,2);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(9,'门户网站系统资源','门户网站系统资源...',5,'2017-04-08','FOLDER',NULL,2);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(10,'手机商城系统资源','手机商城系统资源...',5,'2017-04-08','FOLDER',NULL,2);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(11,'权限通用模块资料','权限通用模块资料...',5,'2017-04-08','FOLDER',NULL,8);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(12,'页面素材','页面素材...',5,'2017-04-08','FOLDER',NULL,11);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(13,'OA数据库脚本','OA系统MySQL数据库脚本...',5,'2017-04-08','txt','Upload/0003.sql',8);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(14,'OA数据库ER图','OA系统数据库ER图...',5,'2017-04-08','jpg','Upload/0004.jpg',8);
INSERT INTO Document(Id,NAME,Description,CreatorId,CreateTime,TYPE,FileUrl,ParentId)
	VALUES(15,'通用权限模块设计文档','通用权限模块设计文档...',5,'2017-04-08','FOLDER','Upload/0004.jpg',11);

#内部邮件
CREATE TABLE Message(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Title VARCHAR(256) NOT NULL,
	Content TEXT NOT NULL,
	CreatorId INT NOT NULL,
	SendTime DATETIME,
	Receivers VARCHAR(512),
	LEVEL TINYINT NOT NULL,
	STATUS TINYINT NOT NULL,
	IsSent BIT NOT NULL	
);
ALTER TABLE Message ADD CONSTRAINT fk_Message_Employee FOREIGN KEY(CreatorId) REFERENCES Employee(Id)ON DELETE CASCADE;

#邮件附件
CREATE TABLE MessageAttachment(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(256) NOT NULL,
	FileUrl VARCHAR(256) NOT NULL,
	MessageId INT NOT NULL
);
ALTER TABLE MessageAttachment ADD CONSTRAINT fk_MessageAttachment_Message FOREIGN KEY(MessageId) REFERENCES Message(Id) ON DELETE CASCADE;


#邮件接收记录
CREATE TABLE MessageReception(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	MessageId INT NOT NULL,
	ReceiverId INT NOT NULL,
	IsRead BIT NOT NULL,
	STATUS TINYINT NOT NULL
);
ALTER TABLE MessageReception ADD CONSTRAINT fk_MessageReception_Message FOREIGN KEY(MessageId) REFERENCES Message(Id) ON DELETE CASCADE;
ALTER TABLE MessageReception ADD CONSTRAINT fk_MessageReception_Employee FOREIGN KEY(ReceiverId) REFERENCES Employee(Id)ON DELETE CASCADE;

#日程
CREATE TABLE Activity(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	CreatorId INT NOT NULL,
	CreateTime DATETIME NOT NULL,
	Title VARCHAR(50) NOT NULL,
	Description VARCHAR(256) NOT NULL,
	Location VARCHAR(50) NOT NULL,
	StartTime DATETIME,
	EndTime DATETIME
);
ALTER TABLE Activity ADD CONSTRAINT fk_Activity_Employee FOREIGN KEY(CreatorId) REFERENCES Employee(Id) ON DELETE CASCADE;

INSERT INTO Activity(Id,CreatorId,CreateTime,Title,Description,Location,StartTime,EndTime)
	VALUES(1,1,NOW(),'跟李总交接项目','跟李总交接项目并演示项目功能','广州广力科技有限公司','2018-4-15','2018-4-15');
INSERT INTO Activity(Id,CreatorId,CreateTime,Title,Description,Location,StartTime,EndTime)
	VALUES(2,2,NOW(),'制作年底总结表','总结全年的收入、支出等状况记录信息','广州广力科技有限公司','2018-4-15','2018-4-15');
INSERT INTO Activity(Id,CreatorId,CreateTime,Title,Description,Location,StartTime,EndTime)
	VALUES(3,1,NOW(),'全年金融规划','规划资金使用情况信息','广州广力科技有限公司','2018-4-15','2018-4-15');
INSERT INTO Activity(Id,CreatorId,CreateTime,Title,Description,Location,StartTime,EndTime)
	VALUES(4,1,NOW(),'规划','规划资金使用情况信息','广州广力科技有限公司','2018-4-19','2018-4-20');
INSERT INTO Activity(Id,CreatorId,CreateTime,Title,Description,Location,StartTime,EndTime)
	VALUES(5,2,NOW(),'规划2','规划资金使用情况信息','广州广力科技有限公司','2018-4-24','2018-4-27');


CREATE TABLE ActivityActor(
	Id INT PRIMARY KEY AUTO_INCREMENT,
	ActivityId INT NOT NULL,
	ActorId INT NOT NULL
);
ALTER TABLE ActivityActor ADD CONSTRAINT fk_ActivityActor_Activity FOREIGN KEY(ActivityId) REFERENCES Activity(Id)ON DELETE CASCADE;
ALTER TABLE ActivityActor ADD CONSTRAINT fk_ActivityActor_Employee FOREIGN KEY(ActorId) REFERENCES Employee(Id) ON DELETE CASCADE;

INSERT INTO ActivityActor(Id,ActivityId,ActorId)
	VALUES(1,1,1);
INSERT INTO ActivityActor(Id,ActivityId,ActorId)
	VALUES(2,1,2);
INSERT INTO ActivityActor(Id,ActivityId,ActorId)
	VALUES(3,1,3);
INSERT INTO ActivityActor(Id,ActivityId,ActorId)
	VALUES(4,2,2);
INSERT INTO ActivityActor(Id,ActivityId,ActorId)
	VALUES(5,3,1);
INSERT INTO ActivityActor(Id,ActivityId,ActorId)
	VALUES(6,4,1);	
INSERT INTO ActivityActor(Id,ActivityId,ActorId)
	VALUES(7,5,1);	
INSERT INTO ActivityActor(Id,ActivityId,ActorId)
	VALUES(8,5,2);	
	


INSERT INTO Message(title,content,creatorId,sendTime,Receivers,`level`,`status`,isSent)
VALUES('哈哈哈','开心就好',1,'2018-05-01','李四',1,0,0); /*草稿*/
INSERT INTO Message(title,content,creatorId,sendTime,Receivers,`level`,`status`,isSent)
VALUES('啊啊啊','哦哦',1,'2018-05-02','赵六',1,0,0); /*草稿*/
INSERT INTO Message(title,content,creatorId,sendTime,Receivers,`level`,`status`,isSent)
VALUES('项目5','请尽快完成项目5',3,'2018-03-13','张三',1,0,1);/*已发送普通*/
INSERT INTO Message(title,content,creatorId,sendTime,Receivers,`level`,`status`,isSent)
VALUES('项目6','请尽快完成项目6',3,'2018-03-14','张三',3,0,1);/*已发送普通*/
INSERT INTO Message(title,content,creatorId,sendTime,Receivers,`level`,`status`,isSent)
VALUES('项目7','请尽快完成项目6',4,'2018-03-15','张三',1,0,1);/*已发送普通*/
INSERT INTO Message(title,content,creatorId,sendTime,Receivers,`level`,`status`,isSent)
VALUES('项目8','请尽快完成项目7',5,'2018-03-16','张三',3,0,1);/*已发送普通*/

INSERT INTO MessageReception(MessageId,ReceiverId,IsRead,`status`)
VALUES(2,2,1,0);
INSERT INTO MessageReception(MessageId,ReceiverId,IsRead,`status`)
VALUES(6,1,0,0);
INSERT INTO MessageReception(MessageId,ReceiverId,IsRead,`status`)
VALUES(7,1,1,0);
INSERT INTO MessageReception(MessageId,ReceiverId,IsRead,`status`)
VALUES(8,1,0,0);
INSERT INTO MessageReception(MessageId,ReceiverId,IsRead,`status`)
VALUES(9,1,0,0);
INSERT INTO MessageReception(MessageId,ReceiverId,IsRead,`status`)
VALUES(10,1,1,0);
INSERT INTO MessageReception(MessageId,ReceiverId,IsRead,`status`)
VALUES(11,1,1,0);
INSERT INTO MessageReception(MessageId,ReceiverId,IsRead,`status`)
VALUES(12,1,0,0);
	

SELECT * FROM Employee;
	
SELECT * FROM Document;
SELECT * FROM ActivityActor;
SELECT * FROM Activity;
SELECT * FROM Department;
SELECT * FROM FUNCTION;
SELECT * FROM Announcement;	
SELECT * FROM Message;
SELECT * FROM MessageReception;
SELECT * FROM Role;
SELECT * FROM EmployeeRole;
SELECT * FROM FUNCTION;
SELECT * FROM RoleFunction;
	

SELECT f.`Id` FROM `FUNCTION` f
LEFT JOIN RoleFunction rf ON rf.`FunctionId` = f.`Id`
LEFT JOIN Role r ON r.Id = rf.`RoleId`
WHERE r.`Id` = 1 AND f.`ParentId` IS NOT NULL
	


SELECT a.*, e.id AS e_id, e.nr AS e_nr, e.name AS e_name  FROM Announcement a LEFT JOIN Employee e ON a.CreatorId = e.id

SELECT a.*, 
	e.id AS e_id,=
	e.nr AS e_nr,
	e.password AS e_password,
	e.name AS e_name,
	e.gender AS e_gender,
	e.email AS e_email,
	e.isManager AS e_isManager,
	e.status AS e_status
FROM Activity a
JOIN Employee e ON e.id=a.creatorId
WHERE a.`CreatorId` = 1;



SELECT a.*, 
	e.id AS e_id,
	e.nr AS e_nr,
	e.password AS e_password,
	e.name AS e_name,
	e.gender AS e_gender,
	e.email AS e_email,
	e.departmentId AS e_departmentId,
	e.isManager AS e_isManager,
	e.status AS e_status
FROM Activity a
LEFT JOIN Employee e ON e.id=a.creatorId



SELECT * FROM Document WHERE id=2;




SELECT d.*, 
	e.id AS e_id,
	e.nr AS e_nr,
	e.password AS e_password,
	e.name AS e_name,
	e.gender AS e_gender,
	e.email AS e_email,
	e.isManager AS e_isManager,
	e.status AS e_status
FROM Document d
JOIN Employee e ON e.id=d.creatorId
WHERE d.parentId = 11;


SELECT parentId FROM Document WHERE Id=1

SELECT a.*,e.name AS e_name FROM Announcement a
INNER JOIN Employee e



