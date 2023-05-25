## 메일 전송 큐
create table if not exists send_mail_queue (
	send_mail_queue_id bigint(20) unsigned not null auto_increment comment '메일전송큐id',
	from_address varchar(255) not null comment 'from주소',
	to_address varchar(255) default null comment 'to주소',
	cc_address varchar(255) default null comment 'cc주소',
	bcc_address varchar(255) default null comment 'bcc주소',
	subject varchar(255) default null comment '제목',
	body text,
	send_at datetime default null comment '메일전송일자',
	created_at datetime not null comment '등록일시',
	primary key(send_mail_queue_id, created_at),
	key idx_send_mail_queue (send_at)
) comment = '메일 전송 큐'
partition by range (year(created_at)) (
	partition p2023 values less than (2023),
	partition p2024 values less than (2024),
	partition p2025 values less than (2025),
	partition p2026 values less than (2026),
	partition p2027 values less than (2027),
	partition p2028 values less than (2028),
	partition p2029 values less than (2029),
	partition p2030 values less than (2030)
);

## 파티션 타는지 확인. 데이터가 있어야 확인 가능하다.
select * from send_mail_queue;

insert into send_mail_queue (from_address, to_address, subject, body, created_at)
values
('damansa1@naver.com', 'damansa1@naver.com', '안녕1', '안녕하세요1', now()),
('damansa1@naver.com', 'damansa1@naver.com', '안녕2', '안녕하세요2', now());

explain partitions
select * from send_mail_queue
where created_at <= '2023-12-31';









