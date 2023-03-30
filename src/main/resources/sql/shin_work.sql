insert into TOP_CATEGORY(top_category_idx,top_name) values(seq_top_category.nextval,'IT');
insert into TOP_CATEGORY(top_category_idx,top_name) values(seq_top_category.nextval,'디자인');
insert into TOP_CATEGORY(top_category_idx,top_name) values(seq_top_category.nextval,'마케팅');
insert into TOP_CATEGORY(top_category_idx,top_name) values(seq_top_category.nextval,'외국어');
insert into TOP_CATEGORY(top_category_idx,top_name) values(seq_top_category.nextval,'기타');

select * from top_category;

insert into MID_CATEGORY(mid_category_idx,mid_name,top_category_idx) values(seq_mid_category.nextval,'프론트엔드',1);
insert into MID_CATEGORY(mid_category_idx,mid_name,top_category_idx) values(seq_mid_category.nextval,'백엔드',1);

insert into MID_CATEGORY(mid_category_idx,mid_name,top_category_idx) values(seq_mid_category.nextval,'CADㆍ3D모델링',2);
insert into MID_CATEGORY(mid_category_idx,mid_name,top_category_idx) values(seq_mid_category.nextval,'사진ㆍ영상',2);

insert into MID_CATEGORY(mid_category_idx,mid_name,top_category_idx) values(seq_mid_category.nextval,'기획ㆍ전략',3);
insert into MID_CATEGORY(mid_category_idx,mid_name,top_category_idx) values(seq_mid_category.nextval,'경영',3);

insert into MID_CATEGORY(mid_category_idx,mid_name,top_category_idx) values(seq_mid_category.nextval,'영어',4);
insert into MID_CATEGORY(mid_category_idx,mid_name,top_category_idx) values(seq_mid_category.nextval,'중국어',4);

insert into MID_CATEGORY(mid_category_idx,mid_name,top_category_idx) values(seq_mid_category.nextval,'자기개발',5);
insert into MID_CATEGORY(mid_category_idx,mid_name,top_category_idx) values(seq_mid_category.nextval,'예술',5);

select * from mid_category

insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'HTML/CSS',1);
insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'JavaScript',1);

insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'JAVA',2);
insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'C',2);

insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'AutoCAD',3);
insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'SketchUp',3);

insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'모션그래픽',4);
insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'영상제작',4);

insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'서비스 기획',5);
insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'PT',5);

insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'회계',6);
insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'재테크',6);

insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'토익',7);
insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'OPIc',7);

insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'HSK',8);
insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'회화',8);

insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'교양',9);
insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'출간출판',9);

insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'뜨개질',10);
insert into SUB_CATEGORY(sub_category_idx,sub_name,mid_category_idx) values(seq_sub_category.nextval,'캘리그라피',10);


insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/807359667','테스트용1',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812881740','테스트용2',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812882243','테스트용3',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812884421','테스트용4',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812884594','테스트용5',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812884702','테스트용6',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812885138','테스트용7',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812885599','테스트용8',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812886408','테스트용9',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812887153','테스트용10',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812887401','테스트용11',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812887665','테스트용12',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812888022','테스트용13',2);
insert into video(video_idx,video_link,video_name,teacher_idx) values(seq_video.nextval,'/812888114','테스트용14',2);

delete video where video_idx != 1

select * from video order by video_idx

select * from video where teacher_idx=2 and video_access=1 order by video_idx



select * from sub_category
---------------------------------------------------------     aws          ----------------------------------------------------------------------
select table_name from user_tables

CREATE TABLE top_category (
	top_category_idx	number primary key,
	top_name	varchar2(30)		NULL
);
drop table top_category

CREATE TABLE mid_category (
	mid_category_idx	number	 primary key,
	mid_name	varchar2(30)		NULL,
	top_category_idx	number		NOT NULL
);
drop table mid_category

CREATE TABLE sub_category (
	sub_category_idx	number	 primary key,
	sub_name	varchar2(30)		NULL,
	mid_category_idx	number		NOT NULL
);
drop table sub_category

CREATE TABLE section (
	section_idx	number primary key,
	section_name	varchar2(200)		NULL,
	subject_idx	number		NOT NULL
);
drop table section

CREATE TABLE movie (
	movie_idx	number	 primary key,
	movie_name	varchar2(100)		NULL,
	section_idx	number		NOT NULL,
	video_idx number null
);

CREATE TABLE goal (
	goal_idx	number	 primary key,
	goal_name	varchar2(200)		NULL,
	subject_idx	number		NOT NULL
);

drop table goal

CREATE TABLE requirement (
	requirement_idx	number	 primary key,
	requirement_name	varchar2(200)		NULL,
	subject_idx	number		NOT NULL
);

drop table requirement

CREATE TABLE subject (
	subject_idx	number	 primary key,
	subject_title	varchar2(200),
	subject_subTitle	clob,
	subject_pic	varchar2(30),
	subject_price	number	,
	subject_access number default 0,
	subject_detail	clob,
	subject_permission number default 0,
	teacher_idx	number		NOT NULL,
	sub_category_idx	number		NULL
);
alter table subject modify sub_category_idx null

select * from teacher

drop table subject

create table video(
	video_idx number primary key,
	video_link varchar2(30) not null,
	video_name varchar2(50) not null,
	video_access number default 1,
	teacher_idx number not null
);
drop table subject

select * from teacher

select * from member

select * from section
select * from movie
select * from subject
delete subject
select * from video

select * from TOP_CATEGORY
select * from mid_category
select * from subject where sub_category_idx = (select sub_category_idx from mid_category where mid_category_idx= (select mid_category_idx from mid_category where top_category_idx=1)) 




select * from sub_category where mid_category_idx=

select rowNum, subject_idx, subject_title, subject_subTitle, subject_pic, subject_price, subject_detail, teacher_idx, sub_category_idx
		from (select * from subject where (subject_access = 0 or subject_access = 1) AND subject_permission = 1 order by subject_idx desc) 
		where rowNum >=1 and rowNum <=10
