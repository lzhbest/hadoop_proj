DROP TABLE "CC"."event_dev_info";
CREATE TABLE "CC"."event_dev_info" (
    "id" NUMBER PRIMARY KEY NOT NULL,
    "mac" VARCHAR2 ( 50 BYTE ) NOT NULL,
    "tmn_brnd" VARCHAR2 ( 20 BYTE ) DEFAULT '' NOT NULL,
    "sys_vsn" VARCHAR2 ( 10 BYTE ) DEFAULT '' NOT NULL,
    "dev_type" VARCHAR2 ( 50 BYTE ) DEFAULT '' NOT NULL,
    "wthr_wptile" NUMBER DEFAULT 0 NOT NULL,
    "rooted" NUMBER DEFAULT 0 NOT NULL,
    "electricity" NUMBER ( 5, 2 ) DEFAULT 0 NOT NULL,
    "charge_state" NUMBER DEFAULT 0 NOT NULL,
    "boot_date" DATE DEFAULT SYSDATE NOT NULL,
    "imei" VARCHAR2 ( 50 BYTE ) NULL,
    "idfa" VARCHAR2 ( 50 BYTE ) NULL,
    "idfv" VARCHAR2 ( 50 BYTE ) NULL,
    "usr_id" VARCHAR2 ( 20 BYTE ) NULL,
    "eqp_id" VARCHAR2 ( 100 BYTE ) DEFAULT '' NOT NULL,
    "wthr_bomb_app" NUMBER DEFAULT 0 NOT NULL,
    "wthr_chg_nbr_app" NUMBER DEFAULT 0 NOT NULL,
    "wthr_chg_pst_app" NUMBER DEFAULT 0 NOT NULL,
    "wthr_chg_gamble_app" NUMBER DEFAULT 0 NOT NULL,
    "loan_app_num" NUMBER DEFAULT 0 NOT NULL,
    "app_version" VARCHAR2 ( 10 BYTE ) NULL,
    "wthr_agl_acc_ss" NUMBER DEFAULT 0 NOT NULL,
    "wthr_fgprt_ss" NUMBER DEFAULT 0 NOT NULL,
    "wthr_gps_ss" NUMBER DEFAULT 0 NOT NULL,
    "wthr_grv_ss" NUMBER DEFAULT 0 NOT NULL,
    "wthr_grs_ss" NUMBER DEFAULT 0 NOT NULL,
    "stream_uuid" VARCHAR2 ( 50 BYTE ) NULL,
    "created" DATE DEFAULT SYSDATE NOT NULL,
    "updated" DATE DEFAULT SYSDATE NOT NULL,
    "deleted" NUMBER DEFAULT 0 NOT NULL 
) LOGGING NOCOMPRESS NOCACHE;

COMMENT ON TABLE "CC"."event_dev_info" IS '设备信息';
COMMENT ON COLUMN "CC"."event_dev_info"."id" IS '自增ID';
COMMENT ON COLUMN "CC"."event_dev_info"."mac" IS '物理地址';
COMMENT ON COLUMN "CC"."event_dev_info"."tmn_brnd" IS '终端品牌';
COMMENT ON COLUMN "CC"."event_dev_info"."sys_vsn" IS '系统版本';
COMMENT ON COLUMN "CC"."event_dev_info"."dev_type" IS '终端型号';
COMMENT ON COLUMN "CC"."event_dev_info"."wthr_wptile" IS '手机是否越狱，1：是，2：否';
COMMENT ON COLUMN "CC"."event_dev_info"."rooted" IS '手机是否root，1：是，2：否';
COMMENT ON COLUMN "CC"."event_dev_info"."electricity" IS '手机电量';
COMMENT ON COLUMN "CC"."event_dev_info"."charge_state" IS '手机充电状态，1：是，2：否';
COMMENT ON COLUMN "CC"."event_dev_info"."boot_date" IS '手机充电状态，1：是，2：否';
COMMENT ON COLUMN "CC"."event_dev_info"."imei" IS '国际移动设备识别码';
COMMENT ON COLUMN "CC"."event_dev_info"."idfa" IS 'iOS6新增的广告标识符';
COMMENT ON COLUMN "CC"."event_dev_info"."idfv" IS 'iOS Vindor标示符';
COMMENT ON COLUMN "CC"."event_dev_info"."usr_id" IS '用户编号';
COMMENT ON COLUMN "CC"."event_dev_info"."eqp_id" IS '设备编号';
COMMENT ON COLUMN "CC"."event_dev_info"."wthr_bomb_app" IS '是否安装了轰炸机（电话或短信等）';
COMMENT ON COLUMN "CC"."event_dev_info"."wthr_chg_nbr_app" IS '是否安装了改号软件';
COMMENT ON COLUMN "CC"."event_dev_info"."wthr_chg_pst_app" IS '是否安装了修改位置的App';
COMMENT ON COLUMN "CC"."event_dev_info"."wthr_chg_gamble_app" IS '是否安装了赌博App';
COMMENT ON COLUMN "CC"."event_dev_info"."loan_app_num" IS '贷款App数目';
COMMENT ON COLUMN "CC"."event_dev_info"."app_version" IS 'App版本';
COMMENT ON COLUMN "CC"."event_dev_info"."wthr_agl_acc_ss" IS '有加速度传感器';
COMMENT ON COLUMN "CC"."event_dev_info"."wthr_fgprt_ss" IS '有指纹识别';
COMMENT ON COLUMN "CC"."event_dev_info"."wthr_gps_ss" IS '有GPS';
COMMENT ON COLUMN "CC"."event_dev_info"."wthr_grv_ss" IS '有重力传感器';
COMMENT ON COLUMN "CC"."event_dev_info"."wthr_grs_ss" IS '有陀螺仪';
COMMENT ON COLUMN "CC"."event_dev_info"."stream_uuid" IS '数据签名，数据唯一性';

CREATE SEQUENCE "event_dev_info_seq" INCREMENT BY 1 START WITH 1 MAXVALUE 999999999;
CREATE 
	OR REPLACE TRIGGER event_dev_info_insert BEFORE INSERT ON "CC"."event_dev_info" FOR EACH ROW
BEGIN
SELECT
	event_dev_info_seq.NEXTVAL INTO : NEW.id 
FROM
	dual;
END;

CREATE UNIQUE INDEX "CC"."idx_stream_uuid" ON "CC"."event_dev_info" ( "stream_uuid" ASC ) LOGGING VISIBLE;
CREATE INDEX "CC"."idx_usr_id" ON "CC"."event_dev_info" ( "usr_id" ASC ) LOGGING VISIBLE;
CREATE INDEX "CC"."idx_eqp_id" ON "CC"."event_dev_info" ( "eqp_id" ASC ) LOGGING VISIBLE;