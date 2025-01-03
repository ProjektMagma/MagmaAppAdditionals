insert into UserRoles (name)
values ('Uczeń'),
       ('Rodzic'),
       ('Nauczyciel'),
       ('Dyrektor'),
       ('Administrator');

insert into Qualifications (name)
values ('nie dotyczy'),
       ('Technik Analityk'),
       ('Technik Informatyk'),
       ('Technik Programista');

insert into LessonHours (start_time, end_time)
values ('07:10', '07:55'),
       ('08:00', '08:45'),
       ('08:50', '09:35'),
       ('09:45', '10:30'),
       ('10:40', '11:25'),
       ('11:35', '12:20'),
       ('12:35', '13:20'),
       ('13:30', '14:15'),
       ('14:25', '15:10'),
       ('15:15', '16:00'),
       ('16:05', '16:50'),
       ('16:55', '17:40');

insert into SubjectNames (name)
values ('Matematyka'),
       ('Informatyka'),
       ('Fizyka'),
       ('Chemia'),
       ('Biologia'),
       ('Geografia'),
       ('Historia'),
       ('Fizyka'),
       ('Wiedza o społeczeństwie'),
       ('Język polski'),
       ('Język angielski'),
       ('Język niemiecki'),
       ('Religia'),
       ('Wychowanie fizyczne'),
       ('Wychowanie do życia w rodzinie'),
       ('Podstawy przedsiębiorczości'),
       ('Systemy operacyjne'),
       ('Sieci komputerowe'),
       ('Bezpieczeństwo sieci'),
       ('Programowanie obiektowe'),
       ('Projektowanie i administracja bazami danych'),
       ('Programowanie stron internetowych'),
       ('Programowanie aplikacji desktopowych'),
       ('Programowanie aplikacji mobilnych'),
       ('Dobra ciul potem więcej dam');

insert into AttendanceTypes (name)
values ('Obecny'),
       ('Nieobecny nieusprawiedliwiony'),
       ('Nieobecny usprawiedliwiony'),
       ('Spóźniony'),
       ('Zwolniony'),
       ('Zwolniony z przyczyn szkolnych');

insert into Classes(name, supervising_teacher_id)
values ('Nauczyciele', 1),
       ('1A', 1),
       ('1B', 1),
       ('1C', 1),
       ('1D', 1),
       ('1E', 1),
       ('2A', 1),
       ('2B', 1),
       ('2C', 1),
       ('2D', 1),
       ('2E', 1);

insert into Groups (class_id, qualification_id, group_sign)
values (1, 1, 'Administrator'),
       (1, 1, 'Nauczyciele'),
       (1, 1, 'Rodzice'),
       (2, 2, '1/2'),
       (2, 2, '2/2'),
       (3, 3, '1/2'),
       (3, 3, '2/2'),
       (4, 3, '1/2'),
       (4, 3, '2/2'),
       (5, 3, '1/2'),
       (5, 3, '2/2'),
       (6, 4, '1/2'),
       (6, 4, '2/2'),
       (7, 2, '1/2'),
       (7, 2, '2/2'),
       (8, 3, '1/2'),
       (8, 3, '2/2'),
       (9, 3, '1/2'),
       (9, 3, '2/2'),
       (10, 3, '1/2'),
       (10, 3, '2/2'),
       (11, 4, '1/2'),
       (11, 4, '2/2');

insert into Users (pesel, first_name, second_name, role_id, group_id)
values ('12345678901', 'Admin', 'Admin', 5, 1);
