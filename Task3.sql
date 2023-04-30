CREATE DATABASE IF NOT EXISTS lesson3;


USE lesson3;


DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL (8,2), -- д-н: от - 999 999 до 999 999
    age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 55000, 40),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 25000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 22),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- 1 Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

SELECT *
FROM staff
ORDER BY salary;

SELECT *
FROM staff
ORDER BY salary DESC;

-- 2 Выведите 5 максимальных заработных плат (saraly)

SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post, sum(salary)
FROM staff
GROUP BY post;

-- 4 Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT count(*)
FROM staff
WHERE post = 'Рабочий' and (age between 24 and 49);

-- 5 Найдите количество специальностей

SELECT COUNT(DISTINCT post)
FROM staff;
-- 6 Выведите специальности, у которых средний возраст сотрудников меньше 30 лет

SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) < 30;

SELECT post, avg(age)
FROM staff
GROUP BY post;


