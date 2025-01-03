create table if not exists Users
(
    user_id      integer not null primary key autoincrement,
    pesel        text not null,
    first_name   text not null,
    second_name  text not null,
    email        text,
    password     text,
    phone_number text
);

create table if not exists UserRoles
(
    role_id integer not null primary key autoincrement,
    name    text not null
);

create table if not exists Groups
(
    group_id   integer not null primary key autoincrement,
    group_sign text not null
);

create table if not exists Qualifications
(
    qualification_id integer not null primary key autoincrement,
    name             text not null
);

create table if not exists Classes
(
    class_id integer not null primary key autoincrement,
    name     text not null
);

create table if not exists Subjects
(
    subject_id integer not null primary key autoincrement
);

create table if not exists SubjectNames
(
    subject_name_id integer not null primary key autoincrement,
    name            text not null
);


create table if not exists SchoolPlan
(
    lesson_in_plan_id integer not null primary key autoincrement,
    room              integer not null,
    day_of_week       integer not null,
    valid_from        text    not null,
    valid_to          text    not null
);

create table if not exists LessonHours
(
    lesson_hour_number_id integer not null primary key autoincrement,
    start_time            text not null,
    end_time              text not null
);

create table if not exists StudentAttendance
(
    attendance_id integer not null primary key autoincrement
);

create table if not exists AttendanceTypes
(
    attendance_type_id integer not null primary key autoincrement,
    name               text not null
);

create table if not exists Messages
(
    message_id integer not null primary key autoincrement,
    send_date  text not null,
    title      text not null,
    content    text
);

create table if not exists Notes
(
    note_id       integer not null primary key autoincrement,
    creation_date text not null,
    title         text not null,
    content       text
);

create table if not exists Marks
(
    mark_id          integer not null primary key autoincrement,
    mark             integer not null,
    mark_weight      integer not null,
    mark_date        text    not null,
    mark_description text
);

alter table Users
    add column "role_id" integer not null references UserRoles (role_id);

alter table Users
    add column "group_id" integer not null references Groups (group_id);

alter table Groups
    add column "class_id" integer not null references Classes (class_id);

alter table Groups
    add column "qualification_id" integer not null references Qualifications (qualification_id);

alter table Subjects
    add column "subject_name_id" integer not null references SubjectNames (subject_name_id);

alter table Subjects
    add column "teacher_id" integer not null references Users (user_id);

alter table Subjects
    add column "group_id" integer not null references Groups (group_id);

alter table SchoolPlan
    add column"subject_id" integer not null references Subjects (subject_id);

alter table SchoolPlan
    add column "lesson_hour_number_id" integer not null references LessonHours (lesson_hour_number_id);

alter table StudentAttendance
    add column "school_plan_id" integer not null references SchoolPlan (lesson_in_plan_id);

alter table StudentAttendance
    add column "student_id" integer not null references Users (user_id);

alter table StudentAttendance
    add column "attendance_type_id" integer not null references AttendanceTypes (attendance_type_id);

alter table Messages
    add column "sender_id" integer not null references Users (user_id);

alter table Messages
    add column "receiver_id" integer not null references Users (user_id);

alter table Marks
    add column "subject_id" integer not null references Subjects (subject_id);

alter table Marks
    add column "student_id" integer not null references Users (user_id);

alter table Classes
    add column "supervising_teacher_id" integer not null references Users (user_id);

alter table Notes
    add column "user_id" integer not null references Users (user_id);
