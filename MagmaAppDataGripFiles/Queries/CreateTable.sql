create table if not exists Users
(
    pesel_id     text primary key,
    first_name   text    not null,
    second_name  text    not null,
    email        text,
    phone_number text,
    role_id      integer not null,
    group_id     integer
);

create table if not exists UserRoles
(
    role_id integer primary key autoincrement,
    name    text not null
);

create table if not exists Groups
(
    group_id         integer primary key autoincrement,
    class_id         integer not null,
    qualification_id integer not null,
    group_sign       text    not null
);

create table if not exists Qualifications
(
    qualification_id integer primary key autoincrement,
    name             text not null
);

create table if not exists Classes
(
    class_id                     integer primary key autoincrement,
    name                         text not null,
    supervising_teacher_pesel_id text
);

create table if not exists Subjects
(
    subject_id       integer primary key autoincrement,
    subject_name_id  integer not null,
    teacher_pesel_id text    not null,
    group_id         integer not null
);

create table if not exists SubjectNames
(
    subject_name_id integer primary key autoincrement,
    name            text not null
);



create table if not exists SchoolPlan
(
    lesson_in_plan_id     integer primary key autoincrement,
    subject_id            integer not null,
    lesson_hour_number_id integer not null,
    room                  integer not null,
    day_of_week           integer not null,
    valid_from            text    not null,
    valid_to              text    not null
);

create table if not exists LessonHours
(
    lesson_hour_number_id integer primary key autoincrement,
    start_time            text not null,
    end_time              text not null
);

create table if not exists StudentAttendance
(
    school_plan_id     integer not null,
    student_pesel      text    not null,
    attendance_type_id integer
);

create table if not exists AttendanceTypes
(
    attendance_type_id integer primary key autoincrement,
    name               text not null
);

