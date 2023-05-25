## 테이블 생성시 인덱스 추가
create table if not exists holidays (
	holiday_id    int(11)      unsigned not null auto_increment comment '휴일ID',
	holiday_name  varchar(100) not null                         comment '휴일명',
	holiday_date  date         not null                         comment '날짜',
	created_by    varchar(50)  not null                         comment '작성자',
	created_at    datetime     not null                         comment '등록일자',
	updated_by    varchar(50)  default null                     comment '수정자',
	updated_at    datetime     default null                     comment '수정일자',
	deleted_by    varchar(50)  default null                     comment '삭제자',
	deleted_at    datetime     default null                     comment '삭제일자',
	version       int(11)      unsigned not null default 1      comment '개정번호',
	primary key (holiday_id),
	key holidays(holiday_name, deleted_at) ## 삭제가 여러번 된 경우 중복 될 수 있는데 2개를 비교하면 중복 없다
) comment '휴일';

## 이미 생성된 테이블에 인덱스 추가
alter table holidays add index holidays(holiday_name, deleted_at);
alter table holidays add key holidays(holiday_name, deleted_at);


delete from holidays where created_by = 'none';
insert into holidays (holiday_name, holiday_date, created_by, created_at)
values ('신정', '2023/1/1', 'none', now()),
       ('삼일절', '2023/3/1', 'none', now());

select * from holidays;



## full-text (like 대체)
create table if not exists movie (
	id int auto_increment primary key,
	title varchar(15) not null,
	description text
);

insert into movie (title, description)
values
  ('광해, 왕이 된 남자','왕위를 둘러싼 권력 다툼과 당쟁으로 혼란이 극에 달한 광해군 8년'),
  ('간첩','남한 내에 고장간첩 5만 명이 암약하고 있으며 특히 권력 핵심부에도 침투해있다.'),
  ('피에타',' 더 나쁜 남자가 온다! 잔혹한 방법으로 돈을 뜯어내는 악마같은 남자 스토리.'),
  ('레지던트 이블 5','인류 구원의 마지막 퍼즐, 이 여자가 모든 것을 끝낸다.'),
  ('파괴자들','사랑은 모든 것을 파괴한다! 한 여자를 구하기 위한, 두 남자의 잔인한 액션 본능!'),
  ('킹콩을 들다',' 역도에 목숨을 건 시골소녀들이 만드는 기적 같은 신화.'),
  ('테드','지상최대 황금찾기 프로젝트! 500년 전 사라진 황금도시를 찾아라!'),
  ('타이타닉','비극 속에 침몰한 세기의 사랑, 스크린에 되살아날 영원한 감동'),
  ('8월의 크리스마스','시한부 인생 사진사와 여자 주차 단속원과의 미묘한 사랑'),
  ('늑대와 춤을','늑대와 친해져 모닥불 아래서 함께 춤을 추는 전쟁 영웅 이야기'),
  ('국가대표','동계올림픽 유치를 위해 정식 종목인 스키점프 국가대표팀이 급조된다.'),
  ('쇼생크 탈출','그는 누명을 쓰고 쇼생크 감옥에 감금된다. 그리고 역사적인 탈출.'),
  ('인생은 아름다워','귀도는 삼촌의 호텔에서 웨이터로 일하면서 또 다시 도라를 만난다.'),
  ('사운드 오브 뮤직','수녀 지망생 마리아는 명문 트랩가의 가정교사로 들어간다'),
  ('매트릭스',' 2199년.인공 두뇌를 가진 컴퓨터가 지배하는 세계.');

select * from movie
where description like '%사랑%';

create fulltext index movie on movie(description);

select *, match(description) against('사랑*' in boolean mode)
from movie
where match(description) against('사랑*' in boolean mode);

set global innodb_ft_aux_table = 'oraclejava/movie';
select *
from information_schema.innodb_ft_index_table;



## 검색 중지 단어
create table user_stopword (
	value varchar(30)
);

insert into user_stopword
values ('으로'), ('을'), ('의'), ('없다'), ('된다');

set global innodb_ft_server_stopword_table = 'oraclejava/user_stopword';
select * from information_schema.innodb_ft_default_stopword;






















