Drop Database Advise_Me;
CREATE DATABASE Advise_Me;
USE Advise_Me;

Create Table User (
    user_id varchar(20) NOT NULL,
    password_hash varchar(255) NOT NULL,
    user_role varchar(50) NOT NULL,
    unique (user_id),
    primary key (user_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

Create Table Remember_Me (
    token_hash varchar(255) NOT NULL,
    user_id varchar(20) NOT NULL,
    expires_at datetime NOT NULL,
    unique (token_hash),
    primary key (token_hash),
    foreign key (user_id) references User(user_id) on delete cascade on update cascade
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE advisors (
    adv_id int(8) NOT NULL,    
    adv_fName varchar(50) NOT NULL,
    adv_lName varchar(50) NOT NULL,
    adv_campus char(3) NOT NULL,
    UNIQUE(adv_id),
    PRIMARY KEY (adv_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE degrees (
    deg_id int(8) NOT NULL,    
    deg_level varchar(50) NOT NULL,
    deg_name varchar(250) NOT NULL,    
    UNIQUE(deg_id),
    PRIMARY KEY (deg_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE students (
    stu_id int(8) NOT NULL,    
    stu_fName varchar(50) NOT NULL,
    stu_lName varchar(50) NOT NULL,
    deg_id int (8) NOT NULL,
    start_year DATE NOT NULL,
    stu_gpa decimal(3,2) default 0.00 NOT NULL, 
    stu_campus char(3) NOT NULL,
    UNIQUE(stu_id),
    PRIMARY KEY (stu_id),
    FOREIGN KEY (deg_id) REFERENCES degrees(deg_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE advisorRoster (
    adv_id int(8) NOT NULL,    
    stu_id int(8) NOT NULL,
    PRIMARY KEY (adv_id,stu_id),
    FOREIGN KEY (adv_id) REFERENCES advisors(adv_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE ,
    FOREIGN KEY (stu_id) REFERENCES students(stu_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE courses (
    course_code varchar(7) NOT NULL,    
    course_title varchar(250) NOT NULL,
    course_pGrade char(1) DEFAULT "D" NOT NULL,
    course_credits int(1) DEFAULT 3 NOT NULL,
    UNIQUE(course_code),
    PRIMARY KEY (course_code)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE degreeCourses (
    deg_id int(8) NOT NULL,    
    course_code varchar(7) NOT NULL,
    PRIMARY KEY (deg_id, course_code),
    FOREIGN KEY (deg_id) REFERENCES degrees(deg_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (course_code) REFERENCES courses(course_code)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE prerequisites (
    course_code varchar(7) NOT NULL,    
    prereq_code varchar(7) NOT NULL,
    PRIMARY KEY (course_code, prereq_code),
    FOREIGN KEY (course_code) REFERENCES courses(course_code)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (prereq_code) REFERENCES courses(course_code)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE semesters (
    sem_id int(6) NOT NULL,    
    sem_duration varchar(10) NOT NULL,
    sem_status varchar(20) DEFAULT "INACTIVE" NOT NULL,
    UNIQUE(sem_id),
    PRIMARY KEY (sem_id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE semesterCourses (
    sem_id int(6) NOT NULL,
    course_crn int(5) NOT NULL,
    course_code varchar(7) NOT NULL, 
    prereq_code varchar(7) NOT NULL,
    PRIMARY KEY (sem_id, course_crn),
    FOREIGN KEY (sem_id) REFERENCES semesters(sem_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (course_code) REFERENCES courses(course_code)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE advisorRosterSemester (
    adv_id int(8) NOT NULL,    
    stu_id int(8) NOT NULL,
    sem_id int(6) NOT NULL,
    PRIMARY KEY (adv_id,stu_id,sem_id),
    FOREIGN KEY (adv_id) REFERENCES advisors(adv_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE ,
    FOREIGN KEY (stu_id) REFERENCES students(stu_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (sem_id) REFERENCES semesters(sem_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE chats (
    chat_id int(8) NOT NULL,
    stu_id int(8) NOT NULL,    
    adv_id int(8) NOT NULL,
    msg_body blob NOT NULL,
    date_time datetime NOT NULL,
    PRIMARY KEY (chat_id),
    FOREIGN KEY (adv_id) REFERENCES advisors(adv_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE ,
    FOREIGN KEY (stu_id) REFERENCES students(stu_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE registrationHistory (  
    stu_id int(8) NOT NULL,
    sem_id int(6) NOT NULL,
    course_code varchar(7) NOT NULL,
    grade char(1) NOT NULL,
    PRIMARY KEY (stu_id, sem_id, course_code),
    FOREIGN KEY (course_code) REFERENCES courses(course_code)
        ON DELETE CASCADE
        ON UPDATE CASCADE ,
    FOREIGN KEY (stu_id) REFERENCES students(stu_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (sem_id) REFERENCES semesters(sem_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;






