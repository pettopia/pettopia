ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH:MI:SS';

----------------------------------------------------------------------------------------
-- AdminMain.jsp
--�ܡܡܡܡܡ� �����ڸ��� - �ű�ȸ������ ���


--�� �� ȸ����(totMember)
SELECT COUNT(*) AS COUNT
FROM MEMBER_REG;

--�� ���� �ű԰��� ȸ����(todayNewMember)
SELECT COUNT(*) AS COUNT
FROM MEMBER_CODE
WHERE REGDATE=TO_DATE(SYSDATE, 'YYYY-MM-DD');

--�� ���� Ż���� ȸ����(todayWithdrawMember)
SELECT COUNT(*) AS COUNT
FROM MEMBER_WITHDRAW
WHERE WITHDRAW_DATE=TO_DATE(SYSDATE, 'YYYY-MM-DD');

--�� �ű� ����ȸ�� ��� �� ����
-- ��ȣ, ȸ������ڵ�, ���̵�, �г���, �ֹι�ȣ, ����ó, �̸���, �ּ�
CREATE OR REPLACE VIEW NEW_MEMBER_VIEW_B
AS
SELECT M.SEQ AS CODE
     , M.ID AS ID
     , M.NICK AS NICK
     , SUBSTR(M.SSN,1,6)||'-'||SUBSTR(M.SSN,7,1)||'******' AS SSN
     , M.PHONENUMBER AS TEL
     , M.EMAIL AS EMAIL
     , '['||M.ADDRNUMBER||'] '||M.ADDR1||' '||M.ADDR2||' '||M.ADDR3 AS ADDR
FROM MEMBER_REG M LEFT JOIN MEMBER_CODE MC
ON M.MEMBER_CODE_SEQ = MC.SEQ
WHERE TO_CHAR(MC.REGDATE, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
ORDER BY MC.SEQ DESC;

--�� �ű� ����ȸ�� ��� ��ȸ(newMemberList)
SELECT ROWNUM AS NUM, CODE, ID, NICK, SSN, TEL, EMAIL, ADDR
FROM NEW_MEMBER_VIEW_B;


--�� ����� ��û ��� �� ����
-- ����ͽ�û�ڵ�, ȸ�������ڵ�, ���̵�, �г���, ����, ����, ��û��, �ɻ���, ó���Ͻ�, ó�����, �ڱ�Ұ�
CREATE OR REPLACE VIEW PS_REQ_VIEW_B
AS
SELECT PSREQ.SEQ AS REQCODE
     , MC.SEQ AS CODE
     , MR.ID AS ID
     , MR.NICK AS NICK
     , CASE WHEN SUBSTR(SSN, 7, 1) IN(1,2)
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(SSN, 1, 2)) + 1899)
            WHEN SUBSTR(SSN, 7, 1) IN(3,4)
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(SSN, 1, 2)) + 1999)
       ELSE -1 END AS AGE
     , CASE WHEN SUBSTR(SSN, 7, 1) IN(1,3) THEN '��'
            WHEN SUBSTR(SSN, 7, 1) IN(2,4) THEN '��'
            ELSE '�����ǵ��Ұ�' END AS SEX
     , PSREQ.PSREQDATE AS REQDATE
     , CASE WHEN PSREG.PSREGDATE IS NOT NULL THEN '����'
            WHEN PSREF.PSREGREFDATE IS NOT NULL THEN '�ݷ�'
       ELSE 'ó���ϱ�' END AS STATE
     , PSREG.PSREGDATE AS APPROVAL_DATE
     , REG_MG.NICK AS APPROVAL_MG
     , PSREF.PSREGREFDATE AS DISAPPROVAL_DATE
     , REF_MG.NICK AS DISAPPROVAL_MG
     , PSREQ.PSCAREER AS CONTENT
FROM PS_REQ PSREQ LEFT JOIN MEMBER_CODE MC
ON PSREQ.MEMBER_CODE_SEQ = MC.SEQ
    LEFT JOIN MEMBER_REG MR
    ON MC.SEQ = MR.MEMBER_CODE_SEQ
        LEFT JOIN PS_REG PSREG
        ON PSREQ.SEQ = PSREG.PS_REQ_SEQ
            LEFT JOIN MANAGER REG_MG
            ON PSREG.MANAGER_SEQ = REG_MG.SEQ
                LEFT JOIN PS_REG_REF PSREF
                ON PSREQ.SEQ = PSREF.PS_REQ_SEQ
                    LEFT JOIN MANAGER REF_MG
                    ON PSREF.MANAGER_SEQ = REF_MG.SEQ
ORDER BY REQCODE
;

--�� ����� ��û ��� ��ȸ(petsitterRegList)
-- ���ȣ, ����ͽ�û�ڵ�, ���̵�, �г���, ����, ��û��, �ɻ���, ó���Ͻ�, ó�����
SELECT ROWNUM AS NUM, REQCODE, ID, NICK, AGE, REQDATE, STATE, APPROVAL_DATE, APPROVAL_MG, DISAPPROVAL_DATE, DISAPPROVAL_MG
FROM PS_REQ_VIEW_B
--WHERE TO_CHAR(REQDATE, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
ORDER BY REQCODE DESC;


--�� ȸ�� �Ű� ���� ��� �� ����
-- �����ڵ�, ���̵�, �Ű���, �Ű���ID, �Ű��Ͻ�, ó�����, ����ó���Ͻ�, ����ó�����, �ݷ�ó���Ͻ�, �ݷ�ó�����
CREATE OR REPLACE VIEW MEMBER_REPORT_REG_VIEW_B
AS
SELECT MREPORT.SEQ AS CODE
     , MR2.ID AS DEFENDANTID
     , MR2.NICK AS NICK
     , RR.REPORT_REASON AS REASON
     , MR1.ID AS DECLARANTID
     , MREPORT.REG_DATE AS REPORT_DATE
     , CASE WHEN RES.COM_DATE IS NOT NULL THEN '����' 
            WHEN REF.COM_DATE IS NOT NULL THEN '�ݷ�'
            ELSE 'ó���ϱ�'
       END AS STATE
     , RES.COM_DATE AS REG_DATE
     , RESMG.NICK AS REG_MG
     , REF.COM_DATE AS REF_DATE
     , REFMG.NICK AS REF_MG
     , MREPORT.CONTENT AS CONTENT
FROM MEMBER_REPORT MREPORT JOIN MEMBER_CODE MC2
ON MREPORT.MEMBER_CODE_SEQ2=MC2.SEQ
    JOIN MEMBER_REG MR2
    ON MC2.SEQ = MR2.MEMBER_CODE_SEQ
        JOIN MEMBER_CODE MC1
        ON MREPORT.MEMBER_CODE_SEQ1=MC1.SEQ
            JOIN MEMBER_REG MR1
            ON MC1.SEQ = MR1.MEMBER_CODE_SEQ
                JOIN REPORT_REASON RR
                ON MREPORT.REPORT_REASON_SEQ = RR.SEQ
                    LEFT JOIN MEMBER_REPORT_RES RES
                    ON MREPORT.SEQ = RES.MEMBER_REPORT_SEQ
                        LEFT JOIN MEMBER_REPORT_REF REF
                        ON MREPORT.SEQ = REF.MEMBER_REPORT_SEQ
                            LEFT JOIN MANAGER RESMG
                            ON RES.MANAGER_SEQ = RESMG.SEQ
                                LEFT JOIN MANAGER REFMG
                                ON REF.MANAGER_SEQ = REFMG.SEQ
ORDER BY CODE
;

--�� ȸ�� �Ű� ���� ��� ��ȸ(memberReportRegList)
SELECT ROWNUM AS NUM, CODE, DEFENDANTID, REASON, DECLARANTID, REPORT_DATE, STATE, REG_DATE, REG_MG, REF_DATE, REF_MG
FROM MEMBER_REPORT_REG_VIEW_B
--WHERE TO_CHAR(REPORT_DATE, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
ORDER BY CODE DESC
;

--�� �Խñ� �Ű� ���� ��� �� ����
-- �����ڵ�, �Խñ��ڵ�, �ۼ���ID, �Ű���, �Ű���ID, �Ű��Ͻ�, ó�����, ����ó���Ͻ�, ����ó�����, �ݷ�ó���Ͻ�, �ݷ�ó�����
CREATE OR REPLACE VIEW BOARD_REPORT_REG_VIEW_B
AS
SELECT BREPORT.SEQ AS CODE
     , BREPORT.BOARD_SEQ AS BOARD_CODE
     , RR.SEQ AS REPORT_CODE
     , RR.REPORT_REASON AS REASON
     , DMR.ID AS DECLARANTID
     , BREPORT.REG_DATE AS REPORT_DATE
     , BREPORT.CONTENT AS CONTENT
     , CASE WHEN BLIND.COM_DATE IS NOT NULL THEN '����' 
            WHEN REF.COM_DATE IS NOT NULL THEN '�ݷ�'
            ELSE 'ó���ϱ�'
       END AS STATE
     , BLIND.COM_DATE AS BLIND_DATE
     , BLINDMG.NICK AS BLIND_MG
     , REF.COM_DATE AS REF_DATE
     , REFMG.NICK AS REF_MG
FROM BOARD_REPORT BREPORT JOIN MEMBER_CODE DMC
ON BREPORT.MEMBER_CODE_SEQ = DMC.SEQ
    JOIN MEMBER_REG DMR
    ON DMC.SEQ = DMR.MEMBER_CODE_SEQ
        JOIN REPORT_REASON RR
        ON BREPORT.REPORT_REASON_SEQ = RR.SEQ
            LEFT JOIN BOARD_REPORT_BLIND BLIND
            ON BREPORT.SEQ = BLIND.BOARD_REPORT_SEQ
                LEFT JOIN BOARD_REPORT_REF REF
                ON BREPORT.SEQ = REF.BOARD_REPORT_SEQ
                    LEFT JOIN MANAGER BLINDMG
                    ON BLIND.MANAGER_SEQ = BLINDMG.SEQ
                        LEFT JOIN MANAGER REFMG
                        ON REF.MANAGER_SEQ = REFMG.SEQ
ORDER BY CODE
;


--�� �Խñ� �Ű� ���� ��� ��ȸ(boardReportRegList)
SELECT ROWNUM AS NUM, CODE, BOARD_CODE, REASON, DECLARANTID, REPORT_DATE, STATE, BLIND_DATE, BLIND_MG, REF_DATE, REF_MG
FROM BOARD_REPORT_REG_VIEW_B
--WHERE TO_CHAR(REPORT_DATE, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
ORDER BY CODE DESC
;


--�� ��� �Ű� ���� ��� �� ����
-- �����ڵ�, ����ڵ�, �Ű���, �Ű���ID, �Ű��Ͻ�, ó�����, ����ó���Ͻ�, ����ó�����, �ݷ�ó���Ͻ�, �ݷ�ó�����
CREATE OR REPLACE VIEW REPLY_REPORT_REG_VIEW_B
AS
SELECT RREPORT.SEQ AS CODE
     , RREPORT.REPLY_SEQ AS REPLY_CODE
     , RR.SEQ AS REPORT_CODE
     , RR.REPORT_REASON AS REASON
     , DMR.ID AS DECLARANTID
     , RREPORT.REG_DATE AS REPORT_DATE
     , RREPORT.CONTENT AS CONTENT
     , CASE WHEN BLIND.COM_DATE IS NOT NULL THEN '����' 
            WHEN REF.COM_DATE IS NOT NULL THEN '�ݷ�'
            ELSE 'ó���ϱ�'
       END AS STATE
     , BLIND.COM_DATE AS BLIND_DATE
     , BLINDMG.NICK AS BLIND_MG
     , REF.COM_DATE AS REF_DATE
     , REFMG.NICK AS REF_MG
FROM REPLY_REPORT RREPORT JOIN MEMBER_CODE DMC
ON RREPORT.MEMBER_CODE_SEQ = DMC.SEQ
    JOIN MEMBER_REG DMR
    ON DMC.SEQ = DMR.MEMBER_CODE_SEQ
        JOIN REPORT_REASON RR
        ON RREPORT.REPORT_REASON_SEQ = RR.SEQ
            LEFT JOIN REPLY_REPORT_BLIND BLIND
            ON RREPORT.SEQ = BLIND.REPLY_REPORT_SEQ
                LEFT JOIN REPLY_REPORT_REF REF
                ON RREPORT.SEQ = REF.REPLY_REPORT_SEQ
                    LEFT JOIN MANAGER BLINDMG
                    ON BLIND.MANAGER_SEQ = BLINDMG.SEQ
                        LEFT JOIN MANAGER REFMG
                        ON REF.MANAGER_SEQ = REFMG.SEQ
ORDER BY CODE
;


--�� ��� �Ű� ���� ��� ��ȸ(boardReportRegList)
SELECT ROWNUM AS NUM, CODE, REPLY_CODE, REASON, DECLARANTID, REPORT_DATE, STATE, BLIND_DATE, BLIND_MG, REF_DATE, REF_MG
FROM REPLY_REPORT_REG_VIEW_B
--WHERE TO_CHAR(REPORT_DATE, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
ORDER BY CODE DESC
;



--�� 1:1 ���� ���� ��� �� ����
-- �����ڵ�, ID, �г���, ��������, �����Ͻ�, ó�����, ó���Ͻ�, ó�����
CREATE OR REPLACE VIEW INQUIRY_REG_VIEW_B
AS
SELECT IQ.SEQ AS CODE
     , MC.SEQ AS MEMBER_CODE
     , MR.SEQ AS REGCODE
     , MR.ID AS ID
     , MR.NICK AS NICK
     , CASE WHEN SUBSTR(SSN, 7, 1) IN(1,2)
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(SSN, 1, 2)) + 1899)
            WHEN SUBSTR(SSN, 7, 1) IN(3,4)
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(SSN, 1, 2)) + 1999)
       ELSE -1 END AS AGE
     , IQ.TITLE AS TITLE
     , IQ.CONTENT AS CONTENT
     , IQ.REG_DATE AS REG_DATE
     , CASE WHEN ANS.SEQ IS NOT NULL THEN 'ó���Ϸ�'
            ELSE 'ó���ϱ�'
       END AS STATE
     , ANS.REG_DATE AS COM_DATE
     , MG.NICK AS MG
     , ANS.CONTENT AS MGCONTENT
FROM INQUIRY IQ JOIN MEMBER_CODE MC
ON IQ.MEMBER_CODE_SEQ = MC.SEQ
    JOIN MEMBER_REG MR
    ON MC.SEQ = MR.MEMBER_CODE_SEQ
    LEFT JOIN INQUIRY_ANS ANS
        ON IQ.SEQ = ANS.INQUIRY_SEQ
            LEFT JOIN MANAGER MG
            ON ANS.MANAGER_SEQ = MG.SEQ
ORDER BY CODE
;


--�� 1:1 ���� ���� ��� ��ȸ(boardReportRegList)
SELECT ROWNUM AS NUM, CODE, ID, NICK, TITLE, REG_DATE, STATE, COM_DATE, MG
FROM INQUIRY_REG_VIEW_B
--WHERE TO_CHAR(REG_DATE, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD')
ORDER BY CODE DESC
;

----------------------------------------------------------------------------------------
-- AdminLogin.jsp
SELECT *
FROM master;

--�� ������ �α��� ������ ����(adminLogin)
-- �Ŵ�����ȣ, ���̵�, ��й�ȣ, �г���
SELECT SEQ
FROM MANAGER
WHERE ID = 'bokyung1'
AND PW = CRYPTPACK.ENCRYPT('bk1004', 'bk1004')
;


--�� ������ �α��� ������ ����(masterLogin)
-- �����͹�ȣ, ���̵�, ��й�ȣ
SELECT SEQ
FROM MASTER
WHERE ID = 'master'
AND PW = CRYPTPACK.ENCRYPT('mas1004', 'mas1004')
;

----------------------------------------------------------------------------------------
-- AdminMain.jsp ���� �������� ����

--�� ȸ�� �� ���� ��
-- ȸ������ڵ�, ȸ�������ڵ�, ������ڵ�, ���̵�, �г���, �������, ����, 
-- ����ó, �̸���, �ּ�, ȸ��������, �α⵵, ����� ����, �����ʻ������
CREATE OR REPLACE VIEW USER_INFO_VIEW_B
AS
SELECT MR.SEQ AS REGCODE -- ȸ������ڵ�
     , MC.SEQ AS CODE    -- ȸ�������ڵ�
     , (SELECT PS_CODE
        FROM
        (SELECT REG.SEQ AS PS_CODE
             , MC3.SEQ AS MEMBER_CODE
        FROM PS_REG REG LEFT JOIN PS_REQ REQ
        ON REG.PS_REQ_SEQ = REQ.SEQ
            LEFT JOIN MEMBER_CODE MC3
            ON REQ.MEMBER_CODE_SEQ = MC3.SEQ)
        WHERE MEMBER_CODE = MC.SEQ) AS PS_CODE --������ڵ�
     , MR.ID AS ID
     , MR.NICK AS NICK
     , CASE WHEN SUBSTR(MR.SSN, 7, 1) IN ('1','2')
            THEN '19'||SUBSTR(MR.SSN, 1, 2)||'-'||SUBSTR(MR.SSN, 3, 2)||'-'||SUBSTR(MR.SSN, 5, 2)
            WHEN SUBSTR(MR.SSN, 7, 1) IN ('3','4')
            THEN '20'||SUBSTR(MR.SSN, 1, 2)||'-'||SUBSTR(MR.SSN, 3, 2)||'-'||SUBSTR(MR.SSN, 5, 2)
            ELSE '�߸����ֹι�ȣ'
            END AS BIRTHDAY
     , CASE WHEN SUBSTR(MR.SSN, 7, 1) IN ('1','3') THEN '��'
            WHEN SUBSTR(MR.SSN, 7, 1) IN ('2','4') THEN '��'
            ELSE '�߸����ֹι�ȣ'
            END AS SEX
     , MR.PHONENUMBER AS TEL
     , MR.EMAIL AS EMAIL
     , '['||MR.ADDRNUMBER||'] '||MR.ADDR1||' '||MR.ADDR2||' '||MR.ADDR3 AS ADDR
     , MC.REGDATE AS REGDATE
     , (SELECT NVL(SUM(SCORE)/COUNT(*), 0)
        FROM WALK_SCORE_VIEW_B
        WHERE RECEIVER = MC.SEQ) AS AVG_SCORE -- �α⵵
     , (SELECT NVL(SUM(SCORE)/COUNT(*), 0)
        FROM
        (SELECT RE.SID AS PS_PROFILE_CODE
             , PSSCORE AS SCORE
             , PRO.PS_REG_SEQ AS PS_REG_CODE
        FROM PETSITTER_REVIEW RE LEFT JOIN PS_PROFILE PRO
        ON RE.SID = PRO.SEQ)
        WHERE PS_REG_CODE=(SELECT PS_CODE
        FROM
        (SELECT REG.SEQ AS PS_CODE
             , MC3.SEQ AS MEMBER_CODE
        FROM PS_REG REG LEFT JOIN PS_REQ REQ
        ON REG.PS_REQ_SEQ = REQ.SEQ
            LEFT JOIN MEMBER_CODE MC3
            ON REQ.MEMBER_CODE_SEQ = MC3.SEQ)
        WHERE MEMBER_CODE = MC.SEQ)) AS PS_SCORE -- ����� ����
     , (SELECT FILEPATH
        FROM
        (SELECT MEMBER_REG_SEQ, FILEPATH
        FROM MEMBER_PRO_IMG)
        WHERE MEMBER_REG_SEQ=MR.SEQ) AS FILEPATH-- �����ʻ������
FROM MEMBER_REG MR LEFT JOIN MEMBER_CODE MC
ON MR.MEMBER_CODE_SEQ = MC.SEQ
;


--�� ȸ�� �� ���� ��ȸ ������ ����(userInfo)
SELECT REGCODE, CODE, PS_CODE, ID, NICK, BIRTHDAY, SEX, TEL, EMAIL, ADDR, REGDATE, AVG_SCORE, PS_SCORE, FILEPATH
FROM USER_INFO_VIEW_B
WHERE ID='haer524'
;


--�� ��å �α⵵ �� ��(����α⵵ ���ϴ� �뵵)
-- �α⵵���ڵ�, ����ȸ��, �򰡹���ȸ��, ������(�α⵵), ����
CREATE OR REPLACE VIEW WALK_SCORE_VIEW_B
AS
SELECT WS.SEQ AS CODE   -- �α⵵���ڵ�
     , MC1.SEQ AS SENDER -- ����ȸ�������ڵ�
     , MC2.SEQ AS RECEIVER  -- �򰡹���ȸ�������ڵ�
     , WS.SCORE AS SCORE    -- �α⵵
     , WS.SCOREDATE AS REG_DATE -- ����
FROM WALK_SCORE WS LEFT JOIN WALK_JOIN WJ1  -- ���� ���
ON WS.WALK_JOIN_SEQ1 = WJ1.SEQ
    LEFT JOIN PET_CON_REG PCREG1
    ON WJ1.PET_CON_REG_SEQ = PCREG1.SEQ
        LEFT JOIN PET_CON_REQ PCREQ1
        ON PCREG1.PET_CON_REQ_SEQ = PCREQ1.SEQ
            LEFT JOIN MEMBER_CODE MC1
            ON PCREQ1.MEMBER_CODE_SEQ = MC1.SEQ
                LEFT JOIN WALK_JOIN WJ2  -- �򰡹��� ���
                ON WS.WALK_JOIN_SEQ2 = WJ2.SEQ
                    LEFT JOIN PET_CON_REG PCREG2
                    ON WJ2.PET_CON_REG_SEQ = PCREG2.SEQ
                        LEFT JOIN PET_CON_REQ PCREQ2
                        ON PCREG2.PET_CON_REQ_SEQ = PCREQ2.SEQ
                            LEFT JOIN MEMBER_CODE MC2
                            ON PCREQ2.MEMBER_CODE_SEQ = MC2.SEQ;


--�� ����� ��û �󼼳��� ��ȸ ������ ����
-- ����ͽ�û�ڵ�, ȸ�������ڵ�, ���̵�, �г���, ����, ����, ��û��, �ڱ�Ұ�(��¼Ұ�)
SELECT REQCODE, CODE, ID, NICK, AGE, SEX, REQDATE, CONTENT
FROM PS_REQ_VIEW_B
WHERE REQCODE='PSREQ-000008'
;

--�� ����� ��û �������� ÷�γ��� ��
CREATE OR REPLACE VIEW PET_REQ_DOC_VIEW_B
AS
SELECT PD.PS_REQ_SEQ AS REQCODE
     , D.DOCUMENTNAME AS DOC_TYPE
     , PD.FILEPATH AS FILEPATH
FROM PS_DOCUMENT PD LEFT JOIN DOCUMENT D
ON PD.DOCUMENT_SEQ = D.SEQ;


--�� ����� ��û �������� ÷�γ��� ������ ����(psDocList)
SELECT REQCODE, DOC_TYPE, FILEPATH
FROM PET_REQ_DOC_VIEW_B
WHERE REQCODE = 'PSREQ-000039';


--�� ����� ��û ���� ������ = ����� ��� ���̺� INSERT(psReqApproval)
-- ������ڵ�, �������ڵ�, ����ͽ�û�ڵ�, �����
INSERT INTO PS_REG
VALUES('PST-'||LPAD(PS_REG_SEQ.NEXTVAL,6,'0'), '�Ŵ����ڵ�', '����ͽ�û�ڵ�', SYSDATE);

--�� ����� ��û �ݷ� ������ = ����� �ݷ� ��� ���̺� INSERT(psReqDisapproval)
INSERT INTO PS_REG_REF
VALUES('����ͽ�û�ڵ�', '�ݷ������ڵ�', SYSDATE, '�ݷ�����', '�Ŵ����ڵ�');

--�� ����� ��� �ݷ� ���� �ڵ� ��� ��ȸ ������(psRefReasonList)
SELECT SEQ, REASONNAME AS CONTENT
FROM PS_REF_REASON;

--�� ����� ��ȸ-����ó�� ��
-- ����ͽ�û�ڵ�, ����ͽ�û��, ������ڵ�, ���̵�, �г���, ����, ����, ó���Ͻ�, �����, ��¼Ұ�
CREATE OR REPLACE VIEW PET_REG_VIEW_B
AS
SELECT REQCODE, REQDATE
     , PR.SEQ AS REGCODE
     , V.ID, V.NICK, V.AGE, V.SEX
     , PR.PSREGDATE AS REGDATE
     , MG.NICK AS MGNICK
     , CONTENT
FROM PS_REQ_VIEW_B V LEFT JOIN PS_REG PR
ON V.REQCODE = PR.PS_REQ_SEQ
    LEFT JOIN MANAGER MG
    ON PR.MANAGER_SEQ = MG.SEQ;
    
    
--�� ����� ��ȸ-������ ��
-- ������������ڵ�, ��������, ������ּ�, �����ʰ�������
-- �������ڱ�Ұ�
-- �����, �����ָ�, ���¹�ȣ, �������ۼ���
CREATE OR REPLACE VIEW PET_PROFILE_VIEW_B
AS
SELECT PP.SEQ AS PROFILE_CODE-- ������������ڵ�
     , REQ.SEQ AS REQCODE -- ����ͽ�û�ڵ�
     , REG.SEQ AS REGCODE -- ������ڵ�
     , PCT.TYPENAME AS CARE -- ��������
     , '['||PP.PSADDRNUMBER||']'||' '||PP.PSADDR1||' '||PP.PSADDR2||' '||PP.PSADDR3 AS PS_ADDR
     , PO.OPENOPTION AS OPEN_TYPE -- �����ʰ�������
     , PP.PSCONTENT AS CONTENT -- �������ڱ�Ұ�
     , B.BANKNAME AS BANK -- �����
     , PP.PSACCOUNTNAME AS DEPOSITOR -- �����ָ�
     , PP.PSACCOUNTNUMBER AS ACCOUNT_NUM -- ���¹�ȣ
     , PP.PSDATE AS WRITEDATE -- �������ۼ���
FROM PS_PROFILE PP LEFT JOIN PS_CARE_TYPE PCT
ON PP.PS_CARE_TYPE_SEQ = PCT.SEQ
    LEFT JOIN PS_OPEN PO
    ON PP.PS_OPEN_SEQ = PO.SEQ
        LEFT JOIN BANK B
        ON PP.BANK_SEQ = B.SEQ
            LEFT JOIN PS_REG REG
            ON PP.PS_REG_SEQ = REG.SEQ
                LEFT JOIN PS_REQ REQ
                ON REG.PS_REQ_SEQ = REQ.SEQ;

--�� ����� ��ȸ-����ó�� �� ������ ����(psReg)
-- ����ͽ�û�ڵ�, ��û��, ������ڵ�, ���̵�, �г���, ����, ����, ������, ���δ��, 
SELECT REQCODE, REQDATE, REGCODE, ID, NICK, AGE, SEX
     , REGDATE AS APPROVAL_DATE
     , MGNICK AS APPROVAL_MG, CONTENT
FROM PET_REG_VIEW_B
WHERE REQCODE = 'PSREQ-000001';

--�� ����� ��ȸ-������ �� ������ ����(psProfile)
-- ������������ڵ�, ����ͽ�û�ڵ�, ��������, ������ּ�, ��������, ����, ����, ������, ���¹�ȣ, �ۼ���
SELECT PROFILE_CODE, REQCODE, REGCODE, CARE, PS_ADDR, OPEN_TYPE, CONTENT, BANK, DEPOSITOR, ACCOUNT_NUM, WRITEDATE
FROM PET_PROFILE_VIEW_B
WHERE REQCODE = 'PSREQ-000039';

--�� �̿� ���� ����(����� ���� ����)(psServiceList)
SELECT PS.SERVICECONTENT AS SERVICE
FROM PS_SERVICE_INFO S LEFT JOIN PS_SERVICE PS
ON S.PS_SERVICE_SEQ = PS.SEQ
WHERE PS_PROFILE_SEQ = 'PSPRO-000037';

--�� ����ȯ���̹������, ����ȯ���̹��������(����� ���� ����)(psImgList)
SELECT FILEPATH, PSREGDATE AS REGDATE
FROM PS_IMG_REG
WHERE PS_PROFILE_SEQ = 'PSPRO-000037';

delete
from PS_reg
where seq='PSREG-000021';
commit;

--�� ����� ��ȸ-�ݷ�ó�� �� ����
-- ����ͽ�û�ڵ�, ��û��, ȸ�������ڵ�, ���̵�, �г���, ����, ����, ��¼Ұ�
-- ������, �������
CREATE OR REPLACE VIEW PET_REF_VIEW_B
AS
SELECT REQCODE, REQDATE
     , V.CODE AS CODE
     , V.ID, V.NICK, V.AGE, V.SEX
     , V.CONTENT
     , PR.PSREGREFDATE AS REFDATE
     , MG.NICK AS MGNICK
     , PRR.SEQ AS REF_REASON_CODE
     , PRR.REASONNAME AS REF_REASON
     , PR.PSREFCONTENT AS PSCONTENT
FROM PS_REQ_VIEW_B V LEFT JOIN PS_REG_REF PR
ON V.REQCODE = PR.PS_REQ_SEQ
    LEFT JOIN MANAGER MG
    ON PR.MANAGER_SEQ = MG.SEQ
        LEFT JOIN PS_REF_REASON PRR
        ON PR.PS_REF_REASON_SEQ = PRR.SEQ
WHERE V.DISAPPROVAL_DATE IS NOT NULL;

--�� ����� ��ȸ-�ݷ�ó�� �� ������ ����(psRef)
SELECT REQCODE, REQDATE, CODE, ID, NICK, AGE, SEX, CONTENT
     , REFDATE AS DISAPPROVAL_DATE, MGNICK AS DISAPPROVAL_MG
     , REF_REASON_CODE, REF_REASON, PSCONTENT
FROM PET_REF_VIEW_B
WHERE REQCODE = 'PSREQ-000008';


----------------------------------------------------------------------------------------------------------------
--�� ȸ�� �Ű� ���� �󼼳��� ��ȸ ������ ����(usReportInfo)
-- ȸ���Ű������ڵ�, �Ű���id, �г���, �Ű��Ͻ�, ����, �Ű���id, �󼼳���, ÷���ڷ�
SELECT CODE, DEFENDANTID, NICK, REASON, DECLARANTID, REPORT_DATE, STATE, REG_DATE, REG_MG, REF_DATE, REF_MG, CONTENT
FROM MEMBER_REPORT_REG_VIEW_B
WHERE CODE = 'MRPT-000003';

--�� ȸ�� �Ű� ���� ÷������ ��� ������ ����(UsDocList)
SELECT MEMBER_REPORT_SEQ AS CODE, FILEPATH
FROM MEMBER_REPORT_FILE
WHERE MEMBER_REPORT_SEQ = 'MRPT-000003';

--�� ȸ�� �Ű� ���� ó�� ������ ����(usReqApproval)
INSERT INTO MEMBER_REPORT_RES
VALUES('MRPR-'||LPAD(MEMBER_REPORT_RES_SEQ.NEXTVAL, 6, 0), 'MRPT-000003', SYSDATE, '����', 'MNG-000001');
             
--�� ȸ�� �Ű� �ݷ� ó�� ������ ����(usReqDisapproval)
-- ȸ���Ű������ڵ�, �ݷ������ڵ�, ó���Ͻ�, ó������, �������ڵ�
INSERT INTO MEMBER_REPORT_REF
VALUES(code, restrict_reason_code, SYSDATE, mscontent, mg_code);

--�� ��� ȸ�� �� ����-ȸ�� �Ű� ���� ����(usReg)
-- ȸ���Ű������ڵ�, �Ű���, �Ű����id, �г���, ó����, �Ű����, �Ű���ȸ��, ó�����
-- �Ű� �󼼳���, ÷���ڷ���, ������ ó�� ����
SELECT V.CODE, V.REPORT_DATE, V.DEFENDANTID, V.NICK, V.REG_DATE, V.REASON, V.DECLARANTID, V.REG_MG, V.CONTENT
     , RES.REASON AS MGCONTENT 
FROM MEMBER_REPORT_REG_VIEW_B V LEFT JOIN MEMBER_REPORT_RES RES
ON V.CODE=RES.MEMBER_REPORT_SEQ
WHERE CODE = 'MRPT-000002';

--�� ȸ�� �Ű� ����Ұ� �� ����-ȸ�� �Ű� �ݷ� ����(usRef)
-- ȸ���Ű������ڵ�, �Ű���, �Ű����id, �г���, ó����, �Ű����, �Ű���ȸ��, ó�����
-- �Ű� �󼼳���, ÷���ڷ���, ����Ұ������ڵ�, ����Ұ���������, ������ ó�� ����
SELECT V.CODE AS CODE, V.REPORT_DATE AS REPORT_DATE, V.DEFENDANTID AS DEFENDANTID, V.NICK AS NICK
     , V.REF_DATE AS REF_DATE, V.REASON AS REASON, V.DECLARANTID AS DECLARANTID, V.REF_MG AS REF_MG, V.CONTENT AS CONTENT
     , REF.RESTRICT_REASON_SEQ AS RESTRICT_REASON_CODE, RR.CONTENT AS RESTRICT_REASON_CONTENT, REF.REASON AS MGCONTENT
FROM MEMBER_REPORT_REG_VIEW_B V LEFT JOIN MEMBER_REPORT_REF REF
ON V.CODE = REF.MEMBER_REPORT_SEQ
    LEFT JOIN RESTRICT_REASON RR
    ON REF.RESTRICT_REASON_SEQ = RR.SEQ
WHERE CODE = 'MRPT-000001';



----------------------------------------------------------------------------------------------------------------

--�� �Խù� �Ű� ���� �󼼳��� ��ȸ ������ ����(contentsReportInfo)
-- �Խù��Ű������ڵ�, �Ű���, �Խñ��ڵ�, �Խñ��ۼ�id, �г���, �Ű����, �Ű�ȸ��id, �󼼳���
-- �Ű������, ���δ��, �Ű������, �������, ������ó������, ����Ұ������ڵ�, ����Ұ���������
SELECT V.CODE AS CODE, V.REPORT_DATE AS REPORT_DATE, V.BOARD_CODE AS BOARD_CODE
     , MR.ID AS ID, MR.NICK AS NICK, V.REASON AS REASON
     , V.DECLARANTID AS DECLARANTID, V.CONTENT AS CONTENT
FROM BOARD_REPORT_REG_VIEW_B V LEFT JOIN BOARD B
ON V.BOARD_CODE = B.SEQ
    LEFT JOIN MEMBER_CODE MC
    ON B.MEMBER_CODE_SEQ = MC.SEQ
        LEFT JOIN MEMBER_REG MR
        ON MC.SEQ = MR.MEMBER_CODE_SEQ
WHERE V.CODE = 'BRPT-000001';

--�� �Խù� �Ű� ���� ����(����ε� ó��)(contentsReqApproval)
INSERT INTO BOARD_REPORT_BLIND
VALUES(#{code}, SYSDATE, #{mgcontent}, #{mg_code});

delete
from BOARD_REPORT_BLIND
where board_report_seq = 'BRPT-000006';
commit;

--�� �Խù� �Ű� ���� �ݷ�(contentsReqDisapproval)
INSERT INTO BOARD_REPORT_REF
VALUES(#{code}, #{restrict_reason_code}, SYSDATE, #{mgcontent}, #{mg_code});

delete
from BOARD_REPORT_REF
where board_report_seq = 'BRPT-000006';
commit;

--�� ����ε� �Խù� �� ����-�Խù� �Ű� ���� ���� ��ȸ(contentsReg)
SELECT V.CODE AS CODE, V.REPORT_DATE AS REPORT_DATE, V.BOARD_CODE AS BOARD_CODE
     , MR.ID AS ID, MR.NICK AS NICK, V.REASON AS REASON
     , V.DECLARANTID AS DECLARANTID, V.CONTENT AS CONTENT, V.BLIND_DATE AS BLIND_DATE, V.BLIND_MG AS BLIND_MG
     , BR.CONTENT AS MGCONTENT
FROM BOARD_REPORT_REG_VIEW_B V LEFT JOIN BOARD B
ON V.BOARD_CODE = B.SEQ
    LEFT JOIN MEMBER_CODE MC
    ON B.MEMBER_CODE_SEQ = MC.SEQ
        LEFT JOIN MEMBER_REG MR
        ON MC.SEQ = MR.MEMBER_CODE_SEQ
            LEFT JOIN BOARD_REPORT BR
            ON V.CODE = BR.SEQ
                LEFT JOIN RESTRICT_REASON RR
                ON BR.REPORT_REASON_SEQ = RR.SEQ
WHERE V.CODE = 'BRPT-000005';

--�� �Խù� �Ű� �ݷ� ���� ��ȸ(contentsRef)
SELECT V.CODE AS CODE, V.REPORT_DATE AS REPORT_DATE, V.BOARD_CODE AS BOARD_CODE
     , MR.ID AS ID, MR.NICK AS NICK, V.REASON AS REASON
     , V.DECLARANTID AS DECLARANTID, V.CONTENT AS CONTENT, V.REF_DATE AS REF_DATE, V.REF_MG AS REF_MG
     , BR.CONTENT AS MGCONTENT, RR.SEQ AS RESTRICT_REASON_CODE, RR.CONTENT AS RESTRICT_REASON_CONTENT
FROM BOARD_REPORT_REG_VIEW_B V LEFT JOIN BOARD B
ON V.BOARD_CODE = B.SEQ
    LEFT JOIN MEMBER_CODE MC
    ON B.MEMBER_CODE_SEQ = MC.SEQ
        LEFT JOIN MEMBER_REG MR
        ON MC.SEQ = MR.MEMBER_CODE_SEQ
            LEFT JOIN BOARD_REPORT BR
            ON V.CODE = BR.SEQ
                LEFT JOIN RESTRICT_REASON RR
                ON BR.REPORT_REASON_SEQ = RR.SEQ
WHERE V.CODE = 'BRPT-000001';




--�� ��� �Ű� ���� �󼼳��� ��ȸ ������ ����(replyReportInfo)
SELECT V.CODE AS CODE, V.REPORT_DATE AS REPORT_DATE, V.REPLY_CODE AS REPLY_CODE
     , MR.ID AS ID, MR.NICK AS NICK, V.REASON AS REASON
     , V.DECLARANTID AS DECLARANTID, V.CONTENT AS CONTENT
FROM REPLY_REPORT_REG_VIEW_B V LEFT JOIN REPLY R
ON V.REPLY_CODE = R.SEQ
    LEFT JOIN MEMBER_CODE MC
    ON R.MEMBER_CODE_SEQ = MC.SEQ
        LEFT JOIN MEMBER_REG MR
        ON MC.SEQ = MR.MEMBER_CODE_SEQ
WHERE V.CODE = 'RRPT-000001';

--�� ��� �Ű� ���� ����(����ε� ó��)(replyReqApproval)
INSERT INTO REPLY_REPORT_BLIND
VALUES(#{code}, SYSDATE, #{mgcontent}, #{mg_code});

select *
from REPLY_REPORT;


--�� ��� �Ű� ���� �ݷ�(replyReqDisapproval)
INSERT INTO REPLY_REPORT_REF
VALUES(#{code}, #{restrict_reason_code}, SYSDATE, #{mgcontent}, #{mg_code});

  
delete
from REPLY_REPORT_REF
where reply_report_seq = 'RRPT-000003';
commit;

--�� ����ε� ��� �� ����-��� �Ű� ���� ���� ��ȸ(replyReg)
SELECT V.CODE AS CODE, V.REPORT_DATE AS REPORT_DATE, V.REPLY_CODE AS REPLY_CODE
     , MR.ID AS ID, MR.NICK AS NICK, V.REASON AS REASON
     , V.DECLARANTID AS DECLARANTID, V.CONTENT AS CONTENT, V.BLIND_DATE AS BLIND_DATE, V.BLIND_MG AS BLIND_MG
     , RR.CONTENT AS MGCONTENT
FROM REPLY_REPORT_REG_VIEW_B V LEFT JOIN REPLY R
ON V.REPLY_CODE = R.SEQ
    LEFT JOIN MEMBER_CODE MC
    ON R.MEMBER_CODE_SEQ = MC.SEQ
        LEFT JOIN MEMBER_REG MR
        ON MC.SEQ = MR.MEMBER_CODE_SEQ
            LEFT JOIN REPLY_REPORT RR
            ON V.CODE = RR.SEQ
WHERE V.CODE = 'RRPT-000001';

--�� ��� �Ű� �ݷ� ���� ��ȸ(replyRef)
SELECT V.CODE AS CODE, V.REPORT_DATE AS REPORT_DATE, V.REPLY_CODE AS REPLY_CODE
     , MR.ID AS ID, MR.NICK AS NICK, V.REASON AS REASON
     , V.DECLARANTID AS DECLARANTID, V.CONTENT AS CONTENT, V.REF_DATE AS REF_DATE, V.REF_MG AS REF_MG
     , RR.CONTENT AS MGCONTENT, RESR.SEQ AS RESTRICT_REASON_CODE, RESR.CONTENT AS RESTRICT_REASON_CONTENT
FROM REPLY_REPORT_REG_VIEW_B V LEFT JOIN REPLY R
ON V.REPLY_CODE = R.SEQ
    LEFT JOIN MEMBER_CODE MC
    ON R.MEMBER_CODE_SEQ = MC.SEQ
        LEFT JOIN MEMBER_REG MR
        ON MC.SEQ = MR.MEMBER_CODE_SEQ
            LEFT JOIN REPLY_REPORT RR
            ON V.CODE = RR.SEQ
                LEFT JOIN RESTRICT_REASON RESR
                ON RR.REPORT_REASON_SEQ = RESR.SEQ
WHERE V.CODE = 'RRPT-000001';




--�� 1:1 ���� ���� �󼼳��� ��ȸ ������ ����(inquiryDetail)
-- ���������ڵ�, ȸ�������ڵ�, ȸ������ڵ�, ���̵�, �г���, ����, �����Ͻ�, ó���Ͻ�, ó�����
-- ��������, ���ǳ���, ���Ǵ亯�ۼ�
SELECT CODE, MEMBER_CODE, REGCODE AS MEMBER_REG_CODE, ID, NICK, AGE
     , TITLE, CONTENT, REG_DATE
FROM INQUIRY_REG_VIEW_B
WHERE CODE = 'IQ-000002';

--�� 1:1 ���� �亯 ó�� INSERT ������ ����(inquiryComplete)
INSERT INTO INQUIRY_ANS
VALUES('IQA-'||LPAD(INQUIRY_ANS_SEQ.NEXTVAL,6,0), #{code}, #{mg_code}, #{mgcontent}, SYSDATE);

--�� 1:1 ���� �亯 ���� ��ȸ ������ ����(inquiryAnswer)
SELECT CODE, MEMBER_CODE, REGCODE AS MEMBER_REG_CODE, ID, NICK, AGE
     , TITLE, CONTENT, REG_DATE, COM_DATE, MG, MGCONTENT
FROM INQUIRY_REG_VIEW_B
WHERE CODE = 'IQ-000002';





----------------------------------------------------------------------------------------------------------------

--�� �����Խ��� �Խñ� ����Ʈ ��ȸ ��
CREATE OR REPLACE VIEW BOARD_VIEW_B
AS
SELECT B.SEQ AS BOARD_CODE, B.HEAD_SEQ AS HEAD_CODE, H.HEAD AS HEAD
     , B.MEMBER_CODE_SEQ AS MEMBER_CODE, MR.NICK NICK
     , B.TITLE AS TITLE
     , B.CONTENT AS CONTENT
     , B.VIEW_NUM AS VIEW_NUM
     , B.RECOM_NUM AS HIT
     , CASE TO_DATE(B.REG_DATE, 'YYYY-MM-DD') WHEN TO_DATE(SYSDATE, 'YYYY-MM-DD')
                                              THEN TO_CHAR(B.REG_DATE, 'HH24:MI:SS')
                                              ELSE TO_CHAR(B.REG_DATE, 'YYYY-MM-DD') END AS REG_DATE
     , CASE WHEN (SYSDATE-B.REG_DATE)<1 THEN 1 
       ELSE 0 END AS DATE_CHECK
     , (SELECT COUNT(*)
        FROM
        (SELECT B.SEQ AS BOARD_CODE
         FROM BOARD_REPORT_BLIND BRB LEFT JOIN BOARD_REPORT BR
         ON BRB.BOARD_REPORT_SEQ = BR.SEQ
            LEFT JOIN BOARD B
            ON BR.BOARD_SEQ = B.SEQ)
        WHERE BOARD_CODE = B.SEQ) AS BLIND_COUNT
     , (SELECT COUNT(*)
        FROM
        (SELECT BOARD_CODE, BLIND_COUNT
        FROM REPLY_VIEW_B
        WHERE BLIND_COUNT = 0)
        WHERE BOARD_CODE = B.SEQ) AS REPLY_COUNT
FROM BOARD B LEFT JOIN HEAD H
ON B.HEAD_SEQ = H.SEQ
    LEFT JOIN MEMBER_CODE MC
    ON B.MEMBER_CODE_SEQ = MC.SEQ
        LEFT JOIN MEMBER_REG MR
        ON MC.SEQ = MR.MEMBER_CODE_SEQ;

--�� �����Խ��� �Խñ� ����Ʈ ��ȸ ������(boardList)
SELECT BOARD_CODE, HEAD, NICK, TITLE, VIEW_NUM, HIT, REG_DATE, DATE_CHECK
     , BLIND_COUNT
FROM BOARD_VIEW_B
WHERE BLIND_COUNT = 0
ORDER BY BOARD_CODE DESC;

--�� �����Խ��� �Խñ� �˻�(search)
SELECT BOARD_CODE, HEAD_CODE, HEAD, NICK, TITLE, VIEW_NUM, HIT, REG_DATE, DATE_CHECK
     , BLIND_COUNT
FROM BOARD_VIEW_B
WHERE BLIND_COUNT = 0
AND TITLE LIKE '%�Ф�%'
OR CONTENT LIKE '%�Ф�%'
ORDER BY BOARD_CODE DESC;

--�� �����Խ��� �Խñ� ���Ӹ� ���� �˻�(searchHead)
SELECT BOARD_CODE, HEAD_CODE, HEAD, NICK, TITLE, VIEW_NUM, HIT, REG_DATE, DATE_CHECK
     , BLIND_COUNT
FROM BOARD_VIEW_B
WHERE BLIND_COUNT = 0
AND HEAD_CODE = 3
AND TITLE LIKE '%��%'
ORDER BY BOARD_CODE DESC;

--�� ���Ӹ� ���(headList)
SELECT SEQ AS CODE, HEAD AS CONTENT
FROM HEAD;

--�� �Խñ� ����(content)
SELECT MEMBER_CODE, BOARD_CODE, HEAD_CODE, HEAD, TITLE, NICK, VIEW_NUM, HIT, REG_DATE, DATE_CHECK, CONTENT
FROM BOARD_VIEW_B;
WHERE BOARD_CODE = 'BOD-000003';


--�� ��� ��ȸ ��
CREATE OR REPLACE VIEW REPLY_VIEW_B
AS
SELECT R.SEQ AS REPLY_CODE, R.MEMBER_CODE_SEQ AS MEMBER_CODE, MR.NICK AS NICK
     , R.REG_DATE AS REG_DATE, R.CONTENT AS CONTENT, R.BOARD_SEQ AS BOARD_CODE
     , (SELECT COUNT(*)
        FROM
        (SELECT R.SEQ AS REPLY_SEQ
        FROM REPLY_REPORT_BLIND RRB LEFT JOIN REPLY_REPORT RR
        ON RRB.REPLY_REPORT_SEQ = RR.SEQ
            LEFT JOIN REPLY R
            ON RR.REPLY_SEQ = R.SEQ)
        WHERE REPLY_SEQ = R.SEQ) AS BLIND_COUNT
FROM REPLY R LEFT JOIN MEMBER_CODE MC
ON R.MEMBER_CODE_SEQ = MC.SEQ
    LEFT JOIN MEMBER_REG MR
    ON MC.SEQ = MR.MEMBER_CODE_SEQ;

--�� ��� ����Ʈ ���(replyList)
SELECT REPLY_CODE, MEMBER_CODE, NICK, REG_DATE, CONTENT, BOARD_CODE, BLIND_COUNT
FROM REPLY_VIEW_B
WHERE BOARD_CODE = 'BOD-000016'
AND BLIND_COUNT = 0
ORDER BY REPLY_CODE;

--�� ��� �� ��ȸ
SELECT COUNT(*)
FROM REPLY_VIEW_B
WHERE BOARD_CODE = 'BOD-000016'
AND BLIND_COUNT = 0;


--�� ��� �Է�(replyInsert)
INSERT INTO REPLY
VALUES('REP-'||LPAD(REPLY_SEQ.NEXTVAL,6,0), #{member_code}, #{board_code}, SYSDATE, #{content});

--�� �Խñ� �Է�(contentInsert)
INSERT INTO BOARD
VALUES('BOD-'||LPAD(BOARD_SEQ.NEXTVAL,6,0), #{head_code}, #{member_code}, #{title}, #{content}, SYSDATE, 0, 0);

--�� �Խñ� ����(contentUpdate)
UPDATE BOARD
SET HEAD_SEQ = #{head_code}, TITLE = #{title}, CONTENT = #{content}
WHERE SEQ = #{board_code};

--�� �Խñ� ����(contentDelete)
DELETE
FROM BOARD
WHERE SEQ = #{board_code}



--�� �Խñ� ��ȸ�� ����(hitUpdate)
UPDATE BOARD
SET VIEW_NUM = VIEW_NUM + 1
WHERE SEQ = #{board_code};

--�� ȸ�� �˸� �� ����
-- �˸��ڵ�, �޴�ȸ������ڵ�, �г���, �޴�ȸ�������ڵ�, �˸�Ÿ��, ����, �߼���, ����Ȯ����
CREATE OR REPLACE VIEW NOTIFY_VIEW_B
AS
SELECT N.SEQ AS NO_CODE
     , MR.SEQ AS MEMBER_REG_CODE
     , MR.MEMBER_CODE_SEQ AS CODE
     , MR.NICK AS NICK
     , NT.SEQ AS NOTIFY_TYPE_CODE
     , NT.CONTENT AS CONTENT
     , NT.URL AS URL
     , NT.URL_NAME AS URL_NAME
     , N.REFERENCE_CODE AS REFERENCE_CODE
     , N.WRITE_DATE AS REG_DATE
     , N.CHECK_DATE AS CHECK_DATE
FROM NOTIFY N LEFT JOIN MEMBER_REG MR
ON N.MEMBER_REG_SEQ = MR.SEQ
    LEFT JOIN NOTIFY_TYPE NT
    ON N.NOTIFY_TYPE_SEQ = NT.SEQ;
    
--�� �˸� ��ȸ ������ ����(newNotifyList)
SELECT NO_CODE, MEMBER_REG_CODE, CODE, NICK, NOTIFY_TYPE_CODE, CONTENT, URL_NAME, URL, REFERENCE_CODE, REG_DATE, CHECK_DATE
FROM NOTIFY_VIEW_B
WHERE CODE = 'MEM-000001'
AND CHECK_DATE IS NULL
;

--�� �˸� ���� ������ ����(notifyInsert)
INSERT INTO NOTIFY(SEQ, MEMBER_REG_SEQ, NOTIFY_TYPE_SEQ, WRITE_DATE)
VALUES('NTF='||LPAD(NOTIFY_SEQ.NEXTVAL,6,0), 'MBR-000001', 'NO-000003', SYSDATE)
;

--�� ����� ��û �ڵ�� ��û�� ȸ������ڵ�, ȸ�������ڵ� ��ȸ(psReqMember)
SELECT MC.SEQ, MR.SEQ AS MEMBER_REG_CODE
FROM PS_REQ PR LEFT JOIN MEMBER_CODE MC
ON PR.MEMBER_CODE_SEQ = MC.SEQ
    LEFT JOIN MEMBER_REG MR
    ON MC.SEQ = MR.MEMBER_CODE_SEQ
WHERE PR.SEQ = 'PSREQ-000001';

--�� ������ ȸ�������ڵ�� ȸ������ڵ� ��ȸ
SELECT MR.SEQ AS MEMBER_REG_CODE
FROM MEMBER_REG MR LEFT JOIN MEMBER_CODE MC
ON MR.MEMBER_CODE_SEQ = MC.SEQ
WHERE MC.SEQ = 'MEM-000001';

--�� �˸� ���� ������ ����(notifyInsert)
INSERT INTO NOTIFY(SEQ, MEMBER_REG_SEQ, NOTIFY_TYPE_SEQ, WRITE_DATE)
VALUES('NTF='||LPAD(NOTIFY_SEQ.NEXTVAL,6,0), 'MBR-000001', 'NO-000003', SYSDATE);

--�� ���� �˶��� ������ ����
UPDATE NOTIFY
SET CHECK_DATE = SYSDATE
WHERE SEQ = #{no_code};


--�� �� ���� ��û �� ��û�� �� ���� �ڵ� ��ȸ(searchPetConReqCode)
SELECT SEQ AS PET_CON_REQ_SEQ
FROM PET_CON_REQ
WHERE PET_REG_SEQ = '�꿬���ڵ�'
AND MEMBER_CODE_SEQ = '��û�������ȸ�������ڵ�';

--�� �� ���� ��û �˸� ���� �� �꿬���� insert ������ ����
INSERT INTO PET_CON_REG
VALUES('PREG-'||LPAD(PET_CON_REG_SEQ.NEXTVAL,6,0), #{pet_con_req_seq}, SYSDATE);

--�� �꿬���û�ڵ� ��ȸ ������ ����
SELECT * --SEQ AS PET_CON_REQ_SEQ
FROM PET_CON_REQ
WHERE MEMBER_CODE_SEQ = 'MEM-000001';


INSERT INTO NOTIFY(SEQ, MEMBER_REG_SEQ, NOTIFY_TYPE_SEQ, WRITE_DATE, REFERENCE_CODE)
VALUES('NTF'||LPAD(NOTIFY_SEQ.NEXTVAL,6,0), #{member_reg_code}, #{notify_type_code}, SYSDATE, #{reference_code})
;
update NOTIFY
set seq='NTF-000007'
where seq='NTF=000007';
select *
from NOTIFY;

select *
from PET_CON_REG
order by 1 desc;
delete from PET_CON_REG where 
select *
from pet_con_req
order by 1 desc;

select *
from notify;
select *
from notify_type;
/*
NO-000002	����� ��û�� ���εǾ����ϴ�.<br>�������� �ۼ����ּ���.<br>
NO-000003	����� ��û�� �ݷ��Ǿ����ϴ�.<br>
NO-000004	���� ��û�� ���εǾ����ϴ�.<br>1�ð� ���� ��ġ���� �Ա����ּ���.<br>
NO-000005	���� ������ �����Ǿ����ϴ�.<br>
NO-000001	����� ���� ��û�� �ֽ��ϴ�.<br>
*/


UPDATE NOTIFY_TYPE
SET CONTENT= '����� ��û�� ���εǾ����ϴ�.<br>�������� �ۼ����ּ���.<br>'
    , URL_NAME = '������ �ۼ��ϱ�'
WHERE SEQ='NO-000002';
UPDATE NOTIFY_TYPE
SET CONTENT= '����� ��û�� �ݷ��Ǿ����ϴ�.<br>'
    , URL_NAME = '���� Ȯ���ϱ�'
WHERE SEQ='NO-000003';
UPDATE NOTIFY_TYPE
SET CONTENT= '���� ��û�� ���εǾ����ϴ�.<br>1�ð� ���� ��ġ���� �Ա����ּ���.<br>'
    , URL_NAME = '��ġ�� �Ա��ϱ�'
WHERE SEQ='NO-000004';
UPDATE NOTIFY_TYPE
SET CONTENT= '���� ������ �����Ǿ����ϴ�.<br>'
    , URL_NAME = '���೻�� Ȯ���ϱ�'
WHERE SEQ='NO-000005';
UPDATE NOTIFY_TYPE
SET CONTENT= '�� ���� ��û�� �ֽ��ϴ�.<br>'
    , URL_NAME = '��û ����'
WHERE SEQ='NO-000001';

SELECT *
FROM BOARD;
COMMIT;
select *
from board;

DELETE
FROM REPLY
WHERE SEQ = 'REP-000016';

SELECT *
FROM BOARD_VIEW_B;





