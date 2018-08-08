-- ��ǰ��ŷ
ALTER TABLE `Rank`
	DROP PRIMARY KEY; -- ��ǰ��ŷ �⺻Ű

-- ��ǰ
ALTER TABLE `items`
	DROP PRIMARY KEY; -- ��ǰ �⺻Ű

-- �±�
ALTER TABLE `tags`
	DROP PRIMARY KEY; -- �±� �⺻Ű

-- ����
ALTER TABLE `Review`
	DROP PRIMARY KEY; -- ���� �⺻Ű

-- ���
ALTER TABLE `Comment`
	DROP PRIMARY KEY; -- ��� �⺻Ű

-- �������ƿ�
ALTER TABLE `Likes`
	DROP PRIMARY KEY; -- �������ƿ� �⺻Ű

-- ��������
ALTER TABLE `Notice`
	DROP PRIMARY KEY; -- �������� �⺻Ű

-- ��������
ALTER TABLE `Members`
	DROP PRIMARY KEY; -- �������� �⺻Ű

-- ����
ALTER TABLE `User`
	DROP PRIMARY KEY; -- ���� �⺻Ű

-- ���
ALTER TABLE `Companys`
	DROP PRIMARY KEY; -- ��� �⺻Ű

-- �̺�Ʈ�ּ�
ALTER TABLE `Eve_addr`
	DROP PRIMARY KEY; -- �̺�Ʈ�ּ� �⺻Ű

-- �̺�Ʈ
ALTER TABLE `Event`
	DROP PRIMARY KEY; -- �̺�Ʈ �⺻Ű

-- ���Ǽ���
ALTER TABLE `Qna`
	DROP PRIMARY KEY; -- ���Ǽ��� �⺻Ű

-- �Ű���
ALTER TABLE `magazine`
	DROP PRIMARY KEY; -- �Ű��� �⺻Ű

-- ��ǰ��ŷ
DROP TABLE IF EXISTS `Rank` RESTRICT;

-- ��ǰ
DROP TABLE IF EXISTS `items` RESTRICT;

-- �±�
DROP TABLE IF EXISTS `tags` RESTRICT;

-- ����
DROP TABLE IF EXISTS `Review` RESTRICT;

-- ���
DROP TABLE IF EXISTS `Comment` RESTRICT;

-- �������ƿ�
DROP TABLE IF EXISTS `Likes` RESTRICT;

-- ��������
DROP TABLE IF EXISTS `Notice` RESTRICT;

-- ��������
DROP TABLE IF EXISTS `Members` RESTRICT;

-- ����
DROP TABLE IF EXISTS `User` RESTRICT;

-- ���
DROP TABLE IF EXISTS `Companys` RESTRICT;

-- �̺�Ʈ�ּ�
DROP TABLE IF EXISTS `Eve_addr` RESTRICT;

-- �̺�Ʈ
DROP TABLE IF EXISTS `Event` RESTRICT;

-- ���Ǽ���
DROP TABLE IF EXISTS `Qna` RESTRICT;

-- �Ű���
DROP TABLE IF EXISTS `magazine` RESTRICT;

-- �ӽ� ���̺�
DROP TABLE IF EXISTS `Temporary` RESTRICT;

-- ��ǰ��ŷ
CREATE TABLE `Rank` (
	`item`  INT NOT NULL COMMENT '��ǰ�ڵ�', -- ��ǰ�ڵ�
	`one`   INT NULL     DEFAULT 0 COMMENT '1��', -- 1��
	`two`   INT NULL     DEFAULT 0 COMMENT '2��', -- 2��
	`three` INT NULL     DEFAULT 0 COMMENT '3��', -- 3��
	`four`  INT NULL     DEFAULT 0 COMMENT '4��', -- 4��
	`five`  INT NULL     DEFAULT 0 COMMENT '5��' -- 5��
)
COMMENT '��ǰ��ŷ';

-- ��ǰ��ŷ
ALTER TABLE `Rank`
	ADD CONSTRAINT `PK_Rank` -- ��ǰ��ŷ �⺻Ű
		PRIMARY KEY (
			`item` -- ��ǰ�ڵ�
		);

-- ��ǰ
CREATE TABLE `items` (
	`item`  INT         NOT NULL COMMENT '��ǰ�ڵ�', -- ��ǰ�ڵ�
	`name`  TEXT        NOT NULL COMMENT '��ǰ��', -- ��ǰ��
	`img`   TEXT        NOT NULL COMMENT '��ǰ����', -- ��ǰ����
	`brand` VARCHAR(10) NOT NULL COMMENT '�귣��', -- �귣��
	`vol`   VARCHAR(30) NULL     DEFAULT 0 COMMENT '�뷮', -- �뷮
	`price` INT         NULL     DEFAULT 0 COMMENT '����', -- ����
	`tot`   DOUBLE      NULL     DEFAULT 0 COMMENT '����', -- ����
	`oil`   INT         NULL     DEFAULT 0 COMMENT '������', -- ������
	`dry`   INT         NULL     DEFAULT 0 COMMENT '�Ǽ�', -- �Ǽ�
	`sen`   INT         NULL     DEFAULT 0 COMMENT '�ΰ���', -- �ΰ���
	`comp`  INT         NULL     COMMENT '��ɼ� ����', -- ��ɼ� ����
	`cate`  INT         NOT NULL COMMENT 'ī�װ�', -- ī�װ�
	`tags`  TEXT        NULL     COMMENT '�ؽ��±�', -- �ؽ��±�
	`open`  TINYINT     NOT NULL DEFAULT 1 COMMENT '��������' -- ��������
)
COMMENT '��ǰ';

-- ��ǰ
ALTER TABLE `items`
	ADD CONSTRAINT `PK_items` -- ��ǰ �⺻Ű
		PRIMARY KEY (
			`item` -- ��ǰ�ڵ�
		);

ALTER TABLE `items`
	MODIFY COLUMN `item` INT NOT NULL AUTO_INCREMENT COMMENT '��ǰ�ڵ�';

ALTER TABLE `items`
	AUTO_INCREMENT = 0;

-- �±�
CREATE TABLE `tags` (
	`tag`   VARCHAR(20) NOT NULL COMMENT '�±׳���', -- �±׳���
	`pop`   INT         NULL     COMMENT '�α⵵', -- �α⵵
	`nalja` TIMESTAMP   NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '������'  -- ������
		 COLUMN_FORMAT DEFAULT STORAGE DEFAULT,
	`cnt`   INT         NULL     DEFAULT 0 COMMENT '����Ƚ��' -- ����Ƚ��
)
COMMENT '�±�';

-- �±�
ALTER TABLE `tags`
	ADD CONSTRAINT `PK_tags` -- �±� �⺻Ű
		PRIMARY KEY (
			`tag` -- �±׳���
		);

-- ����
CREATE TABLE `Review` (
	`rev_no` INT         NOT NULL COMMENT '�۹�ȣ', -- �۹�ȣ
	`item`   INT         NOT NULL COMMENT '��ǰ�ڵ�', -- ��ǰ�ڵ�
	`img`    TEXT        NULL     COMMENT '����', -- ����
	`writer` VARCHAR(10) NOT NULL COMMENT '�ۼ���', -- �ۼ���
	`good`   TEXT        NOT NULL COMMENT '������', -- ������
	`bad`    TEXT        NOT NULL COMMENT '������', -- ������
	`tip`    TEXT        NOT NULL COMMENT '����', -- ����
	`nalja`  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�ۼ���', -- �ۼ���
	`pop`    INT         NULL     COMMENT '���ƿ�', -- ���ƿ�
	`star`   INT         NOT NULL COMMENT '����', -- ����
	`open`   TINYINT     NOT NULL DEFAULT 1 COMMENT '��������' -- ��������
)
COMMENT '����';

-- ����
ALTER TABLE `Review`
	ADD CONSTRAINT `PK_Review` -- ���� �⺻Ű
		PRIMARY KEY (
			`rev_no` -- �۹�ȣ
		);

ALTER TABLE `Review`
	MODIFY COLUMN `rev_no` INT NOT NULL AUTO_INCREMENT COMMENT '�۹�ȣ';

ALTER TABLE `Review`
	AUTO_INCREMENT = 0;

-- ���
CREATE TABLE `Comment` (
	`co_no`   INT                            NOT NULL COMMENT '�۹�ȣ', -- �۹�ȣ
	`writer`  VARCHAR(10)                    NOT NULL COMMENT '�ۼ���', -- �ۼ���
	`email`   VARCHAR(100)                   NOT NULL COMMENT '�̸���', -- �̸���
	`nalja`   TIMESTAMP                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�ۼ���', -- �ۼ���
	`content` TEXT                           NOT NULL COMMENT '����', -- ����
	`co_type` ENUM('�Ű���','����','�̺�Ʈ') NULL     COMMENT 'Ÿ�԰�', -- Ÿ�԰�
	`p_no`    INT                            NULL     COMMENT '�θ������' -- �θ������
)
COMMENT '���';

-- ���
ALTER TABLE `Comment`
	ADD CONSTRAINT `PK_Comment` -- ��� �⺻Ű
		PRIMARY KEY (
			`co_no` -- �۹�ȣ
		);

ALTER TABLE `Comment`
	MODIFY COLUMN `co_no` INT NOT NULL AUTO_INCREMENT COMMENT '�۹�ȣ';

ALTER TABLE `Comment`
	AUTO_INCREMENT = 0;

-- �������ƿ�
CREATE TABLE `Likes` (
	`like_no` INT                            NOT NULL COMMENT '�۹�ȣ', -- �۹�ȣ
	`email`   VARCHAR(100)                   NOT NULL COMMENT '�̸���', -- �̸���
	`nalja`   TIMESTAMP                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ƿ䳯¥', -- ���ƿ䳯¥
	`type`    ENUM('�Ű���','����','�̺�Ʈ') NULL     COMMENT 'Ÿ�԰�', -- Ÿ�԰�
	`p_no`    INT                            NULL     COMMENT '�θ������' -- �θ������
)
COMMENT '�������ƿ�';

-- �������ƿ�
ALTER TABLE `Likes`
	ADD CONSTRAINT `PK_Likes` -- �������ƿ� �⺻Ű
		PRIMARY KEY (
			`like_no` -- �۹�ȣ
		);

ALTER TABLE `Likes`
	MODIFY COLUMN `like_no` INT NOT NULL AUTO_INCREMENT COMMENT '�۹�ȣ';

ALTER TABLE `Likes`
	AUTO_INCREMENT = 0;

-- ��������
CREATE TABLE `Notice` (
	`no_no`   INT          NOT NULL COMMENT '�۹�ȣ', -- �۹�ȣ
	`title`   VARCHAR(100) NOT NULL COMMENT '����', -- ����
	`content` TEXT         NULL     COMMENT '����', -- ����
	`nalja`   TIMESTAMP    NULL     DEFAULT Current_timestamp COMMENT '��¥' -- ��¥
)
COMMENT '��������';

-- ��������
ALTER TABLE `Notice`
	ADD CONSTRAINT `PK_Notice` -- �������� �⺻Ű
		PRIMARY KEY (
			`no_no` -- �۹�ȣ
		);

ALTER TABLE `Notice`
	MODIFY COLUMN `no_no` INT NOT NULL AUTO_INCREMENT COMMENT '�۹�ȣ';

ALTER TABLE `Notice`
	AUTO_INCREMENT = 0;

-- ��������
CREATE TABLE `Members` (
	`email`  VARCHAR(100)                 NOT NULL COMMENT '�̸���', -- �̸���
	`nick`   VARCHAR(10)                  NOT NULL COMMENT '�г���', -- �г���
	`gender` ENUM('����','����')          NOT NULL COMMENT '����', -- ����
	`age`    INT                          NOT NULL COMMENT '����', -- ����
	`skin`   ENUM('����','�Ǽ�','�ΰ���') NOT NULL COMMENT '�Ǻ�Ÿ��', -- �Ǻ�Ÿ��
	`phone`  VARCHAR(20)                  NOT NULL COMMENT '��ȭ��ȣ', -- ��ȭ��ȣ
	`cart`   TEXT                         NULL     COMMENT '����', -- ����
	`exp`    INT                          NULL     COMMENT '����������', -- ����������
	`nalja`  TIMESTAMP                    NOT NULL DEFAULT Current_timestamp COMMENT 'ȸ������ ��¥' -- ȸ������ ��¥
)
COMMENT '��������';

-- ��������
ALTER TABLE `Members`
	ADD CONSTRAINT `PK_Members` -- �������� �⺻Ű
		PRIMARY KEY (
			`email` -- �̸���
		);

-- ����
CREATE TABLE `User` (
	`email`      VARCHAR(100)                           NOT NULL COMMENT '�̸���', -- �̸���
	`password`   TEXT                                   NULL     COMMENT '��й�ȣ', -- ��й�ȣ
	`user_type`  ENUM('CEO','������','����','�Ϲ�')     NOT NULL COMMENT '����', -- ����
	`join_route` SET('google','kakao','naver','normal') NOT NULL COMMENT '���԰��' -- ���԰��
)
COMMENT '����';

-- ����
ALTER TABLE `User`
	ADD CONSTRAINT `PK_User` -- ���� �⺻Ű
		PRIMARY KEY (
			`email` -- �̸���
		);

-- ���
CREATE TABLE `Companys` (
	`email`    VARCHAR(100) NOT NULL COMMENT '�̸���', -- �̸���
	`company`  VARCHAR(100) NOT NULL COMMENT '����̸�', -- ����̸�
	`bisnum`   INT          NOT NULL COMMENT '����ڹ�ȣ', -- ����ڹ�ȣ
	`manager`  VARCHAR(20)  NOT NULL COMMENT '�����', -- �����
	`postcode` INT          NOT NULL COMMENT '��������ȣ', -- ��������ȣ
	`address`  TEXT         NOT NULL COMMENT '����ּ�', -- ����ּ�
	`phone`    VARCHAR(20)  NOT NULL COMMENT '��ȭ��ȣ' -- ��ȭ��ȣ
)
COMMENT '���';

-- ���
ALTER TABLE `Companys`
	ADD CONSTRAINT `PK_Companys` -- ��� �⺻Ű
		PRIMARY KEY (
			`email` -- �̸���
		);

-- �̺�Ʈ�ּ�
CREATE TABLE `Eve_addr` (
	`add_no`   INT          NOT NULL COMMENT '�۹�ȣ', -- �۹�ȣ
	`eve_no`   INT          NOT NULL COMMENT '�̺�Ʈ��ȣ', -- �̺�Ʈ��ȣ
	`email`    VARCHAR(100) NOT NULL COMMENT '�̸���', -- �̸���
	`name`     VARCHAR(5)   NOT NULL COMMENT '�̸�', -- �̸�
	`address`  TEXT         NOT NULL COMMENT '�ּ�', -- �ּ�
	`phone`    VARCHAR(20)  NOT NULL COMMENT '��ȭ��ȣ', -- ��ȭ��ȣ
	`postcode` INT          NOT NULL COMMENT '�����ȣ' -- �����ȣ
)
COMMENT '�̺�Ʈ�ּ�';

-- �̺�Ʈ�ּ�
ALTER TABLE `Eve_addr`
	ADD CONSTRAINT `PK_Eve_addr` -- �̺�Ʈ�ּ� �⺻Ű
		PRIMARY KEY (
			`add_no` -- �۹�ȣ
		);

ALTER TABLE `Eve_addr`
	MODIFY COLUMN `add_no` INT NOT NULL AUTO_INCREMENT COMMENT '�۹�ȣ';

ALTER TABLE `Eve_addr`
	AUTO_INCREMENT = 0;

-- �̺�Ʈ
CREATE TABLE `Event` (
	`eve_no`    INT          NOT NULL COMMENT '�۹�ȣ', -- �۹�ȣ
	`img`       TEXT         NOT NULL COMMENT '��ǥ�̹���', -- ��ǥ�̹���
	`title`     VARCHAR(100) NOT NULL COMMENT '����', -- ����
	`con`       TEXT         NOT NULL COMMENT '����', -- ����
	`com_email` VARCHAR(100) NULL     COMMENT '����̸���', -- ����̸���
	`nalja`     TIMESTAMP    NOT NULL DEFAULT current_timestamp COMMENT '�۾���¥', -- �۾���¥
	`pop`       INT          NULL     DEFAULT 0 COMMENT '���ƿ�', -- ���ƿ�
	`view`      INT          NULL     DEFAULT 0 COMMENT '��ȸ��', -- ��ȸ��
	`open`      TINYINT      NOT NULL DEFAULT 1 COMMENT '��������' -- ��������
)
COMMENT '�̺�Ʈ';

-- �̺�Ʈ
ALTER TABLE `Event`
	ADD CONSTRAINT `PK_Event` -- �̺�Ʈ �⺻Ű
		PRIMARY KEY (
			`eve_no` -- �۹�ȣ
		);

ALTER TABLE `Event`
	MODIFY COLUMN `eve_no` INT NOT NULL AUTO_INCREMENT COMMENT '�۹�ȣ';

ALTER TABLE `Event`
	AUTO_INCREMENT = 0;

-- ���Ǽ���
CREATE TABLE `Qna` (
	`qa_no`   INT          NOT NULL COMMENT '�۹�ȣ', -- �۹�ȣ
	`nalja`   TIMESTAMP    NOT NULL DEFAULT current_timestamp COMMENT '�ۼ���', -- �ۼ���
	`con`     TEXT         NOT NULL COMMENT '����', -- ����
	`qa_type` INT          NOT NULL COMMENT '��������', -- ��������
	`email`   VARCHAR(100) NOT NULL COMMENT '�亯 ���� �̸���', -- �亯 ���� �̸���
	`answer`  TEXT         NULL     COMMENT '�亯' -- �亯
)
COMMENT '���Ǽ���';

-- ���Ǽ���
ALTER TABLE `Qna`
	ADD CONSTRAINT `PK_Qna` -- ���Ǽ��� �⺻Ű
		PRIMARY KEY (
			`qa_no` -- �۹�ȣ
		);

ALTER TABLE `Qna`
	MODIFY COLUMN `qa_no` INT NOT NULL AUTO_INCREMENT COMMENT '�۹�ȣ';

ALTER TABLE `Qna`
	AUTO_INCREMENT = 0;

-- �Ű���
CREATE TABLE `magazine` (
	`mag_no`    INT          NOT NULL COMMENT '�۹�ȣ', -- �۹�ȣ
	`img`       TEXT         NOT NULL COMMENT '��ǥ�̹���', -- ��ǥ�̹���
	`title`     VARCHAR(100) NOT NULL COMMENT '����', -- ����
	`con`       TEXT         NOT NULL COMMENT '����', -- ����
	`cate`      INT          NULL     COMMENT 'ī�װ�', -- ī�װ�
	`com_email` VARCHAR(100) NULL     COMMENT '����̸���', -- ����̸���
	`writer`    VARCHAR(10)  NOT NULL COMMENT '�ۼ���', -- �ۼ���
	`nalja`     TIMESTAMP    NOT NULL DEFAULT current_timestamp COMMENT '�ۼ���', -- �ۼ���
	`pop`       INT          NULL     DEFAULT 0 COMMENT '�α⵵', -- �α⵵
	`view`      INT          NULL     DEFAULT 0 COMMENT '��ȸ��', -- ��ȸ��
	`open`      TINYINT      NOT NULL DEFAULT 1 COMMENT '��������' -- ��������
)
COMMENT '�Ű���';

-- �Ű���
ALTER TABLE `magazine`
	ADD CONSTRAINT `PK_magazine` -- �Ű��� �⺻Ű
		PRIMARY KEY (
			`mag_no` -- �۹�ȣ
		);

ALTER TABLE `magazine`
	MODIFY COLUMN `mag_no` INT NOT NULL AUTO_INCREMENT COMMENT '�۹�ȣ';

ALTER TABLE `magazine`
	AUTO_INCREMENT = 0;

-- �ӽ� ���̺�
CREATE TABLE `Temporary` (
	`mag_no` INT NULL COMMENT '�۹�ȣ' -- �۹�ȣ
)
COMMENT '�ӽ� ���̺�';