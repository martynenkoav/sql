/* 1-03
Для сотрудников, у которых есть комиссионные, выведите в столбце sum сумму зарплаты и комиссионных сотрудника
(колонка commission_pct обозначает долю зарплаты, начисляемую в качестве комиссионных),
и затем все столбцы таблицы employees (*).
Результат должен быть отсортирован по sum, потом по четвертому столбцу в итоговой выборке.
Указание: перед * использовать имя (или alias) таблицы */
SELECT salary+salary*commission_pct as sum, employees.*
FROM employees
WHERE commission_pct>0
ORDER BY sum, last_name


/* 1-06
Выведите уникальный набор из id должностей сотрудников.
Указание: Использовать только таблицу employees, а также ключевое слово distinct или unique */
SELECT DISTINCT job_id
FROM employees;


/* 
1-07
По таблице employees, выведите первым столбцом порядковый номер извлеченной строки, вторым — фамилию сотрудника.
Указание: использовать псевдостолбец rownum. */
SELECT ROWNUM, last_name
FROM employees;


/* 
1-08
Выведите все данные (*) о сотрудниках из таблицы employees, у которых нет комиссионных и есть менеджер. */
SELECT *
FROM employees
WHERE commission_pct IS NULL AND manager_id IS NOT NULL;


/*
1-09
Выведите все данные (*) о сотрудниках с зарплатой не менее 3000, кроме сотрудника с фамилией King. */
SELECT *
FROM employees
WHERE salary >= 3000 AND last_name != 'King';

/* 
1-10
Выведите все данные (*) о сотрудниках, которые находятся в подчинении у менеджеров со следующими id: 100, 101, 102. */
SELECT *
FROM employees
WHERE manager_id IN (100, 101, 102);


/* 
1-12
Выведите все данные (*) о сотрудниках, которые НЕ находятся в подчинении у менеджеров с id 101 и 102 (включая топ-менеджера) */
SELECT *
FROM employees
WHERE manager_id NOT IN (101, 102) OR manager_id IS NULL;


/* 
1-13
Выведите все данные (*) о сотрудниках, которые НЕ находятся в подчинении у менеджеров с id 101 и 102, используя оператор ALL
(топ-менеджера включать не надо) */
SELECT *
FROM employees
WHERE manager_id != ALL (SELECT manager_id
                         FROM employees
                         WHERE manager_id IN (101, 102));


/* 
1-14
Выведите все данные (*) о сотрудниках, зарплата которых не менее 4200 и не более 6000.
Указание: Использовать оператор between. */
SELECT *
FROM employees
WHERE salary BETWEEN 4200 AND 6000;



/* 
1-16
Выведите все данные (*) о сотрудниках, у которых либо id должности равно "FI_ACCOUNT" и зарплата больше 4200,
либо id должности равно "IT_PROG" (и любая зарплата).
Указание: Запрос должен быть написан без использования скобок. */
SELECT * 
FROM employees
WHERE job_id = 'FI_ACCOUNT' AND salary > 4200 OR job_id = 'IT_PROG';
