INSERT INTO ACCOM_CODE VALUES ('ac_001','개인실');
INSERT INTO ACCOM_CODE VALUES ('ac_002','다인실');
INSERT INTO ACCOM_CODE VALUES ('ac_003','집전체');
SELECT * FROM ACCOM_CODE;

INSERT INTO BUILDING_CODE VALUES ('bui_001','단독주택');
INSERT INTO BUILDING_CODE VALUES ('bui_002','아파트');
INSERT INTO BUILDING_CODE VALUES ('bui_003','산장');
INSERT INTO BUILDING_CODE VALUES ('bui_004','펜션');
INSERT INTO BUILDING_CODE VALUES ('bui_005','호스텔');
INSERT INTO BUILDING_CODE VALUES ('bui_006','방갈로');
INSERT INTO BUILDING_CODE VALUES ('bui_007','통나무집');
INSERT INTO BUILDING_CODE VALUES ('bui_008','동굴');
INSERT INTO BUILDING_CODE VALUES ('bui_009','기숙사');
INSERT INTO BUILDING_CODE VALUES ('bui_010','게스트하우스');
INSERT INTO BUILDING_CODE VALUES ('bui_011','흙집');
INSERT INTO BUILDING_CODE VALUES ('bui_012','오두막');
INSERT INTO BUILDING_CODE VALUES ('bui_013','이글루');
INSERT INTO BUILDING_CODE VALUES ('bui_014','캠핑카');
INSERT INTO BUILDING_CODE VALUES ('bui_015','텐트');
INSERT INTO BUILDING_CODE VALUES ('bui_016','트리하우스');
INSERT INTO BUILDING_CODE VALUES ('bui_017','기차');
INSERT INTO BUILDING_CODE VALUES ('bui_018','비행기');
INSERT INTO BUILDING_CODE VALUES ('bui_019','등대');
INSERT INTO BUILDING_CODE VALUES ('bui_020','별장');
SELECT * FROM BUILDING_CODE;

INSERT INTO BED_CODE VALUES('bed_001','싱글침대');
INSERT INTO BED_CODE VALUES('bed_002','세미더블침대');
INSERT INTO BED_CODE VALUES('bed_003','더블침대');
INSERT INTO BED_CODE VALUES('bed_004','2층침대');
INSERT INTO BED_CODE VALUES('bed_005','쇼파겸용침대');
INSERT INTO BED_CODE VALUES('bed_006','쇼파');
INSERT INTO BED_CODE VALUES('bed_007','이불');
INSERT INTO BED_CODE VALUES('bed_008','전기장판 + 이불');
INSERT INTO BED_CODE VALUES('bed_009','온돌 + 이불');
SELECT * FROM BED_CODE;

INSERT INTO SUIT_GUEST_CODE VALUES('gue_001','단체 여행');
INSERT INTO SUIT_GUEST_CODE VALUES('gue_002','개인 여행');
INSERT INTO SUIT_GUEST_CODE VALUES('gue_003','가족 여행');
INSERT INTO SUIT_GUEST_CODE VALUES('gue_004','커플');
INSERT INTO SUIT_GUEST_CODE VALUES('gue_005','출장');
INSERT INTO SUIT_GUEST_CODE VALUES('gue_006','all');
SELECT * FROM SUIT_GUEST_CODE;

INSERT INTO BATH_CODE VALUES('bat_001','욕조');
INSERT INTO BATH_CODE VALUES('bat_002','샤워부스');
INSERT INTO BATH_CODE VALUES('bat_003','세면대');
INSERT INTO BATH_CODE VALUES('bat_004','좌변기');
INSERT INTO BATH_CODE VALUES('bat_005','비데');
INSERT INTO BATH_CODE VALUES('bat_006','목욕탕');
SELECT * FROM BATH_CODE;

INSERT INTO CONVIN_CODE VALUES('con_001','수건/비누/화장지');
INSERT INTO CONVIN_CODE VALUES('con_002','무선 인터넷');
INSERT INTO CONVIN_CODE VALUES('con_003','샴푸');
INSERT INTO CONVIN_CODE VALUES('con_004','옷장/서랍장');
INSERT INTO CONVIN_CODE VALUES('con_005','TV');
INSERT INTO CONVIN_CODE VALUES('con_006','난방');
INSERT INTO CONVIN_CODE VALUES('con_007','에어컨');
INSERT INTO CONVIN_CODE VALUES('con_008','조식/커피/차');
INSERT INTO CONVIN_CODE VALUES('con_009','책장/작업공간');
INSERT INTO CONVIN_CODE VALUES('con_010','벽난로');
INSERT INTO CONVIN_CODE VALUES('con_011','다리미');
INSERT INTO CONVIN_CODE VALUES('con_012','헤어 드라이기');
INSERT INTO CONVIN_CODE VALUES('con_013','컴퓨터');
INSERT INTO CONVIN_CODE VALUES('con_014','휴대폰 충전기');

SELECT * FROM CONVIN_CODE;


INSERT INTO SAFETY_CODE VALUES('saf_001','연기 감지기');
INSERT INTO SAFETY_CODE VALUES('saf_002','일산화탄소 감지기');
INSERT INTO SAFETY_CODE VALUES('saf_003','구급상자');
INSERT INTO SAFETY_CODE VALUES('saf_004','안전 정보 카드');
INSERT INTO SAFETY_CODE VALUES('saf_005','소화기');
INSERT INTO SAFETY_CODE VALUES('saf_006','침실 잠금장치');
INSERT INTO SAFETY_CODE VALUES('saf_007','금고');
INSERT INTO SAFETY_CODE VALUES('saf_008','스프링 쿨러');
INSERT INTO SAFETY_CODE VALUES('saf_009','세콤');
INSERT INTO SAFETY_CODE VALUES('saf_010','CCTV');
INSERT INTO SAFETY_CODE VALUES('saf_011','전자 도어락');
SELECT * FROM SAFETY_CODE;

INSERT INTO REGULATION_CODE VALUES('reg_001','실내금연');
INSERT INTO REGULATION_CODE VALUES('reg_002','애완동물 동반 금지');
INSERT INTO REGULATION_CODE VALUES('reg_003','주류 반입 금지');
INSERT INTO REGULATION_CODE VALUES('reg_004','마약류 반입 금지');
INSERT INTO REGULATION_CODE VALUES('reg_005','파티 금지');
INSERT INTO REGULATION_CODE VALUES('reg_006','남녀 혼속 금지');
SELECT * FROM REGULATION_CODE;

INSERT INTO SPACE_CODE VALUES('spa_001','부엌');
INSERT INTO SPACE_CODE VALUES('spa_002','세탁기');
INSERT INTO SPACE_CODE VALUES('spa_003','건조기');
INSERT INTO SPACE_CODE VALUES('spa_004','주차장');
INSERT INTO SPACE_CODE VALUES('spa_005','엘리베이터');
INSERT INTO SPACE_CODE VALUES('spa_006','수영장');
INSERT INTO SPACE_CODE VALUES('spa_007','헬스장');
INSERT INTO SPACE_CODE VALUES('spa_008','서재');
INSERT INTO SPACE_CODE VALUES('spa_009','옥상');
INSERT INTO SPACE_CODE VALUES('spa_010','발코니');
SELECT * FROM SPACE_CODE;
