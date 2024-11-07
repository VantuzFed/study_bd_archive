drop database if exists railway_station;
create database railway_station;
use railway_station;

CREATE TABLE brigd (
    brig_id        INTEGER NOT NULL,
    train_train_id INTEGER NOT NULL
);

CREATE UNIQUE INDEX brigd__idx ON
    brigd (
        train_train_id
    ASC );

ALTER TABLE brigd ADD CONSTRAINT brigd_pk PRIMARY KEY ( brig_id );

CREATE TABLE depart (
    department_id INTEGER NOT NULL,
    title         VARCHAR(100) NOT NULL
);

ALTER TABLE depart ADD CONSTRAINT depart_pk PRIMARY KEY ( department_id );

CREATE TABLE emp (
    employee_id     INTEGER NOT NULL,
    first_name      VARCHAR(20) NOT NULL,
    last_name       VARCHAR(20) NOT NULL,
    age             INTEGER NOT NULL,
    gender          VARCHAR(20) NOT NULL,
    children_status CHAR(1) NOT NULL,
    children_amount INTEGER
);

ALTER TABLE emp ADD CONSTRAINT emp_pk PRIMARY KEY ( employee_id );

CREATE TABLE job (
    job_id           VARCHAR(32) NOT NULL,
    title            VARCHAR(30) NOT NULL,
    salary           INTEGER NOT NULL,
    work_description VARCHAR(100) NOT NULL
);

ALTER TABLE job ADD CONSTRAINT job_pk PRIMARY KEY ( job_id );

CREATE TABLE job_history (
    emp_employee_id      INTEGER NOT NULL,
    job_job_id           VARCHAR(32) NOT NULL,
    start_date           DATE NOT NULL,
    end_date             DATE,
    brigd_brig_id        INTEGER,
	depart_department_id INTEGER NOT NULL
);

ALTER TABLE job_history ADD CONSTRAINT job_history_pk PRIMARY KEY ( emp_employee_id );

CREATE TABLE med_status (
    emp_employee_id INTEGER NOT NULL,
    status          VARCHAR(20) NOT NULL,
    med_date        DATE
);

ALTER TABLE med_status ADD CONSTRAINT med_status_pk PRIMARY KEY ( emp_employee_id );

CREATE TABLE passenger (
    pass_id          INTEGER NOT NULL,
    ticket_ticket_id INTEGER NOT NULL,
    first_name       VARCHAR(20) NOT NULL,
    last_name        VARCHAR(20) NOT NULL,
    age              INTEGER NOT NULL,
    bagage_status    CHAR(1) NOT NULL,
    gender           VARCHAR(20) NOT NULL
);

ALTER TABLE passenger ADD CONSTRAINT passenger_pk PRIMARY KEY ( pass_id );

CREATE TABLE route (
    route_id       INTEGER NOT NULL,
    route_type     VARCHAR(32) NOT NULL,
    starting_point VARCHAR(20) NOT NULL,
    mid_point      VARCHAR(20),
    ending_point   VARCHAR(20) NOT NULL
);

ALTER TABLE route ADD CONSTRAINT route_pk PRIMARY KEY ( route_id );

CREATE TABLE train (
    train_id   INTEGER NOT NULL,
	train_route_id integer not null,
    train_type VARCHAR(12) NOT NULL

);

ALTER TABLE train ADD CONSTRAINT train_pk PRIMARY KEY ( train_id );

CREATE TABLE tech_status (
	repair_id integer not null,
    train_train_id INTEGER NOT NULL,
	bought_date    DATE,
	tech_status    VARCHAR(30) NOT NULL,
    service_status VARCHAR(30) NOT NULL,
    start_date     DATE,
    end_date       DATE
);

ALTER TABLE tech_status ADD CONSTRAINT tech_status_pk PRIMARY KEY ( repair_id );

ALTER TABLE tech_status
    ADD CONSTRAINT tech_status_train_fk FOREIGN KEY ( train_train_id )
        REFERENCES train ( train_id );

CREATE TABLE ticket (
    ticket_id      INTEGER NOT NULL,
    route_route_id INTEGER NOT NULL,
    price          INTEGER NOT NULL,
    bought_status  CHAR(1) NOT NULL,
    bought_time    DATETIME,
    refund_status  CHAR(1) NOT NULL,
    refund_time    DATETIME
);

ALTER TABLE ticket ADD CONSTRAINT ticket_pk PRIMARY KEY ( ticket_id );

CREATE TABLE timetable (
	time_id		   integer not null,
    route_route_id INTEGER NOT NULL,
	time_arrival   DATETIME NOT NULL,
    time_departure DATETIME NOT NULL,
    delay_status   CHAR(1) NOT NULL,
    delay_reason   VARCHAR(30),
    route_status   VARCHAR(20) NOT NULL
);

ALTER TABLE timetable ADD CONSTRAINT timetable_pk PRIMARY KEY ( time_id );



ALTER TABLE brigd
    ADD CONSTRAINT brigd_train_fk FOREIGN KEY ( train_train_id )
        REFERENCES train ( train_id );

ALTER TABLE job_history
    ADD CONSTRAINT job_history_brigd_fk FOREIGN KEY ( brigd_brig_id )
        REFERENCES brigd ( brig_id );

ALTER TABLE job_history
    ADD CONSTRAINT job_history_depart_fk FOREIGN KEY ( depart_department_id )
        REFERENCES depart ( department_id );

ALTER TABLE job_history
    ADD CONSTRAINT job_history_emp_fk FOREIGN KEY ( emp_employee_id )
        REFERENCES emp ( employee_id );

ALTER TABLE job_history
    ADD CONSTRAINT job_history_job_fk FOREIGN KEY ( job_job_id )
        REFERENCES job ( job_id );

ALTER TABLE med_status
    ADD CONSTRAINT med_status_emp_fk FOREIGN KEY ( emp_employee_id )
        REFERENCES emp ( employee_id );

ALTER TABLE passenger
    ADD CONSTRAINT passenger_ticket_fk FOREIGN KEY ( ticket_ticket_id )
        REFERENCES ticket ( ticket_id );

ALTER TABLE train
    ADD CONSTRAINT train_route_fk FOREIGN KEY ( train_route_id )
        REFERENCES route ( route_id );



ALTER TABLE ticket
    ADD CONSTRAINT ticket_route_fk FOREIGN KEY ( route_route_id )
        REFERENCES route ( route_id );

ALTER TABLE timetable
    ADD CONSTRAINT timetable_route_fk FOREIGN KEY ( route_route_id )
        REFERENCES route ( route_id );
