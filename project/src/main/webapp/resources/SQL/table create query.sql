DROP TABLE COUNTRY_CODE;


CREATE TABLE COUNTRY_CODE(
	  country_id 		  VARCHAR2(10)
	, country_name_eng   VARCHAR2(50) NOT NULL
    , country_name_kor    VARCHAR2(50) NOT NULL
    , country_num			VARCHAR2(10) NOT NULL 
	, CONSTRAINT COUNTRY_countryid_pk PRIMARY KEY(country_id)
);


DROP TABLE MEMBER;
CREATE TABLE MEMBER(
    member_id    Varchar2(30)
  , member_first_name    Varchar2(30) 	NOT NULL
  , member_last_name    Varchar2(30) 	NOT NULL
  , country_id    Varchar2(10)
  , member_img    Varchar2(1000) 	NOT NULL
  , member_email    Varchar2(100) 	NOT NULL
  , member_phone    Varchar2(50) 	NOT NULL
  , member_pwd    Varchar2(50) 	NOT NULL
  , member_birthday    DATE 	NOT NULL
  , member_reg_date   DATE 	DEFAULT SYSDATE
  , CONSTRAINT member_countryid_fk FOREIGN KEY(country_id) REFERENCES COUNTRY_CODE (country_id)  ON DELETE SET NULL
  , CONSTRAINT MEMBER_MEMBERID_PK PRIMARY KEY(member_id)
);

DROP TABLE notice;
CREATE TABLE notice(
	notice_seq    NUMBER
  , member_id    Varchar2(30)
  , notice_title    Varchar2(200) not null
  , notice_content    Varchar2(3000) not null
  , notice_regdate    DATE DEFAULT SYSDATE
  , notice_count    NUMBER DEFAULT 0
  , notice_file VARCHAR2(1000)
  , CONSTRAINT notice_memberid_fk FOREIGN KEY(member_id) REFERENCES MEMBER (member_id) ON DELETE CASCADE
  , CONSTRAINT notice_noticeseq_pk PRIMARY KEY(notice_seq)
);


DROP TABLE suit_guest_code;
CREATE TABLE suit_guest_code(
      sguest_id    VARCHAR2(10)
 	, sguest_name    VARCHAR2(50)
	, CONSTRAINT suitguestcode_sguestid_PK PRIMARY KEY(sguest_id)
);

DROP TABLE building_code;
CREATE TABLE building_code(
	  building_id    VARCHAR2(10)
	, building_name    VARCHAR2(50)
	, CONSTRAINT building_buildingcode_PK PRIMARY KEY(building_id)
);

DROP TABLE bed_code;
CREATE TABLE bed_code (
	 bed_id    Varchar2(10)
   , bed_name    Varchar2(50)
   , CONSTRAINT bedcode_bedid_PK PRIMARY KEY(bed_id)
);

DROP TABLE bath_code;
CREATE TABLE bath_code(
	  bath_id    Varchar2(10)
	, bath_name    Varchar2(50)
    , CONSTRAINT bathcode_bathid_PK PRIMARY KEY(bath_id)
);

DROP TABLE accom_code;
CREATE TABLE accom_code(
	  accom_id    Varchar2(10)
	, accom_name    Varchar2(50)
    , CONSTRAINT accomcode_accomid_PK PRIMARY KEY(accom_id)
);

DROP TABLE PRODUCT;
CREATE TABLE PRODUCT(
	  product_seq    NUMBER
    , p_main_img    VARCHAR2 (1000)						 NOT NULL
    , member_id    VARCHAR2 (30) 						   NOT NULL
    , product_name    VARCHAR2 (100) 					NOT NULL
    , product_price    NUMBER    							NOT NULL
    , country_id    VARCHAR2 (30)
    , product_addr    VARCHAR2 (300) 					  NOT NULL
    , product_addr_detail    Varchar2(300) 				 NOT NULL
    , accom_id    VARCHAR2 (10)
    , bed_id    VARCHAR2 (10)
    , building_id    VARCHAR2 (10)
    , sguest_id    VARCHAR2 (10)
    , product_info    VARCHAR2(3000) 					   NOT NULL
    , product_simple_info    VARCHAR2 (1000)
    , product_lat    NUMBER										NOT NULL
    , product_lng    NUMBER    								   NOT NULL
    , product_score    NUMBER  DEFAULT 0
    , product_mindt    NUMBER	DEFAULT 0
    , product_maxdt    NUMBER  DEFAULT 0
    , product_readydt    NUMBER DEFAULT 0
    , product_prepdt    NUMBER   DEFAULT 0
    , product_step    NUMBER 									NOT NULL
    , product_regdt    DATE  										DEFAULT SYSDATE
    , number_of_people NUMBER DEFAULT 0
    , checkin_time VARCHAR2 (30) NULL
    , checkout_time VARCHAR2 (30) NULL
    , CONSTRAINT PRODUCT_memberid_fk FOREIGN KEY(member_id) REFERENCES MEMBER (member_id) ON DELETE CASCADE
    , CONSTRAINT PRODUCT_countryid_fk FOREIGN KEY(country_id) REFERENCES COUNTRY_CODE (country_id)    ON DELETE SET NULL
    , CONSTRAINT PRODUCT_accomid_fk FOREIGN KEY(accom_id) REFERENCES accom_code (accom_id)	 ON DELETE SET NULL
    , CONSTRAINT PRODUCT_bathid_fk FOREIGN KEY(bath_id) REFERENCES bath_code (bath_id)					 ON DELETE SET NULL
    , CONSTRAINT PRODUCT_bedid_fk FOREIGN KEY(bed_id) REFERENCES bed_code (bed_id)						 ON DELETE SET NULL
    , CONSTRAINT PRODUCT_buildingid_fk FOREIGN KEY(building_id) REFERENCES building_code (building_id)  ON DELETE SET NULL
    , CONSTRAINT PRODUCT_sguestid_fk FOREIGN KEY(sguest_id) REFERENCES suit_guest_code (sguest_id)  ON DELETE SET NULL
    , CONSTRAINT PRODUCT_productid_PK PRIMARY KEY(product_seq)
);


DROP TABLE notsales_date;
CREATE TABLE notsales_date(
	  notsales_seq    NUMBER
    , product_seq    NUMBER
    , ns_start_dt    DATE
    , ns_end_dt    DATE
    , CONSTRAINT notsalesdate_productseq_fk FOREIGN KEY(product_seq) REFERENCES product (product_seq) ON DELETE CASCADE
    , CONSTRAINT notsales_prod_notsalesseq_pk  PRIMARY KEY (notsales_seq,product_seq)
);

DROP TABLE product_pic;
CREATE TABLE product_pic (
	  pimg_seq    number
	, product_seq   NUMBER
	, pimg_name    Varchar2(1000) not NULL
    , CONSTRAINT productpic_productseq_fk FOREIGN KEY(product_seq) REFERENCES product (product_seq)	ON DELETE CASCADE
    , CONSTRAINT productpic_pimg_product_seq_PK PRIMARY KEY(pimg_seq, product_seq)
);

DROP TABLE product_reply;
CREATE TABLE product_reply(
	  product_seq    NUMBER
	, member_id    Varchar2(30)
	, preply_content    Varchar2(1000) not null
	, member_score    NUMBER not null
	, preply_regdt    DATE  DEFAULT SYSDATE
    , CONSTRAINT productreply_productseq_fk FOREIGN KEY(product_seq) REFERENCES product (product_seq) ON DELETE CASCADE
    , CONSTRAINT productreply_memberid_fk FOREIGN KEY(member_id) REFERENCES MEMBER (member_id) ON DELETE CASCADE
    , CONSTRAINT productreply_productmemid_PK PRIMARY KEY(member_id,product_seq)
);

DROP TABLE reservation;
CREATE TABLE reservation(
	  reservation_seq NUMBER
    , product_seq    NUMBER
    , member_id    Varchar2(30)
    , reserv_count   NUMBER not null
    , checkin_dt    Date not null
    , checkout_dt    Date not null
    , reg_dt    Date DEFAULT SYSDATE
    , member_intro    Varchar2(1000)
    , reserv_status    number DEFAULT 0
    , CONSTRAINT reservation_productseq_fk FOREIGN KEY(product_seq) REFERENCES product (product_seq) ON DELETE CASCADE
    , CONSTRAINT reservation_memberid_fk FOREIGN KEY(member_id) REFERENCES member (member_id) ON DELETE CASCADE
    , CONSTRAINT reservation_reservationseq_PK PRIMARY KEY(reservation_seq)
);

DROP TABLE payment;
CREATE TABLE payment(
	  pay_seq    number
	, product_seq    Varchar2(30)
	, member_id    Varchar2(30)
	, pay_type    Varchar2(50) not null
	, card_company    Varchar2(30)
    , CONSTRAINT payment_payseq_PK PRIMARY KEY(pay_seq)
);


DROP TABLE admin_code;
CREATE TABLE admin_code(
   	  member_id    Varchar2(30)
    , CONSTRAINT admincode_memberid_fk FOREIGN KEY(member_id) REFERENCES member (member_id) ON DELETE CASCADE
    , CONSTRAINT admincode_memberid_PK PRIMARY KEY(member_id)
);

DROP TABLE convin_code;
CREATE TABLE convin_code(
    convin_id    Varchar2(10)
  , convin_name    Varchar2(50)
  , CONSTRAINT convincode_convinid_PK PRIMARY KEY(convin_id)
);

DROP TABLE regulation_code;
CREATE TABLE regulation_code(
	  regulation_id    Varchar2(10)
	, regulation_name    Varchar2(50)
    , CONSTRAINT regulationcode_regulationid_PK PRIMARY KEY(regulation_id)
);

DROP TABLE safety_code;
CREATE TABLE safety_code(
	  safety_id    Varchar2(10)
	, safety_name    Varchar2(50)
    , CONSTRAINT safetycode_safetyid_PK PRIMARY KEY(safety_id)
);

DROP TABLE space_code;
CREATE TABLE space_code(
    space_id    	  Varchar2(10)
  , space_name    Varchar2(50)
  , CONSTRAINT spacecode_spaceid_PK PRIMARY KEY(space_id)
);

DROP TABLE product_convin;
CREATE TABLE product_convin(
	product_seq    NUMBER
  , convin_id    Varchar2(10)
  , CONSTRAINT productconvin_productseq_fk FOREIGN KEY(product_seq) REFERENCES PRODUCT (product_seq) on delete cascade
  , CONSTRAINT productconvin_convinid_fk FOREIGN KEY(convin_id) REFERENCES CONVIN_CODE (convin_id)
  , CONSTRAINT productconvin_prodconvinid_PK PRIMARY KEY(product_seq,convin_id)
);



DROP TABLE product_regul;
CREATE TABLE product_regul(
	  product_seq    NUMBER
	, regulation_id    Varchar2(10)
 	, CONSTRAINT productregul_productseq_fk FOREIGN KEY(product_seq) REFERENCES PRODUCT (product_seq) on delete cascade
    , CONSTRAINT productregul_regulid_fk FOREIGN KEY(regulation_id) REFERENCES REGULATION_CODE (regulation_id)
  	, CONSTRAINT productregul_prodregulid_PK PRIMARY KEY(product_seq,regulation_id)
);


DROP TABLE product_safety;
CREATE TABLE product_safety(
    product_seq    NUMBER
  , safety_id    Varchar2(10)
  , CONSTRAINT productsafety_productseq_fk FOREIGN KEY(product_seq) REFERENCES PRODUCT (product_seq) on delete cascade
  , CONSTRAINT productsafety_safetyid_fk FOREIGN KEY(safety_id) REFERENCES SAFETY_CODE (safety_id)  
  , CONSTRAINT productsafety_prodsafetyid_PK PRIMARY KEY(product_seq,safety_id)
);

DROP TABLE product_space;
CREATE TABLE product_space(
      product_seq    NUMBER
	, space_id    Varchar2(10)
    , CONSTRAINT productspace_productseq_fk FOREIGN KEY(product_seq) REFERENCES PRODUCT (product_seq) on delete cascade
    , CONSTRAINT productspace_spaceid_fk FOREIGN KEY(space_id) REFERENCES SPACE_CODE (space_id)  
    , CONSTRAINT productspace_prodspaceid_PK PRIMARY KEY(product_seq,space_id)
);

DROP TABLE product_bath;
CREATE TABLE product_bath(
      product_seq    NUMBER
	, bath_id    Varchar2(10)
    , CONSTRAINT productbath_productseq_fk FOREIGN KEY(product_seq) REFERENCES PRODUCT (product_seq) on delete cascade
    , CONSTRAINT productbath_bathid_fk FOREIGN KEY(bath_id) REFERENCES BATH_CODE (bath_id)  
    , CONSTRAINT productbath_prodbathid_PK PRIMARY KEY(product_seq,bath_id)
);



이후 테이블수정코드

ALTER TABLE PRODUCT
add number_of_people NUMBER DEFAULT 0;

ALTER TABLE NOTSALES_DATE
DROP CONSTRAINT NOTSALESDATE_NOTSALESSEQ_PK;

ALTER TABLE NOTSALES_DATE
MODIFY (CONSTRAINT notsales_prod_notsalesseq_pk  PRIMARY KEY (notsales_seq,product_seq));


ALTER TABLE PRODUCT
DROP COLUMN bath_id;


CREATE SEQUENCE product_pic_seq INCREMENT BY 1 ;

ALTER TABLE PRODUCT_PIC
RENAME COLUMN pimg_path TO pimg_name;


ALTER TABLE NOTICE
ADD  notice_file VARCHAR2(1000);


ALTER TABLE PRODUCT
ADD  checkout_time VARCHAR2 (30) NULL;


ALTER TABLE PRODUCT
ADD  checkin_time VARCHAR2 (30) NULL;




















