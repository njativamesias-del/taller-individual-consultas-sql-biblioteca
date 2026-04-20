-- ==========================================
-- TALLER INDIVIDUAL 1 - BIBLIOTECA
-- ==========================================

-- ==========================================
-- SUBCONSULTAS
-- ==========================================

-- CONSULTA 1
SELECT FirstName, LastName
FROM Users
WHERE UserID IN (
    SELECT r.UserID
    FROM Reservations r
    JOIN Books b ON r.BookID = b.BookID
    JOIN BookCategories bc ON b.CategoryID = bc.CategoryID
    WHERE bc.CategoryName = 'Fiction'
);

-- CONSULTA 2
SELECT Title, Author
FROM Books
WHERE BookID IN (
    SELECT BookID
    FROM Loans
    WHERE ReturnDate IS NULL
);

-- ==========================================
-- OPERADORES DE CONJUNTO
-- ==========================================

-- CONSULTA 3
SELECT Title
FROM Books
WHERE BookID IN (
    SELECT BookID FROM Reservations
)
AND BookID NOT IN (
    SELECT BookID FROM Loans
);

-- CONSULTA 4
SELECT Title
FROM Books
WHERE BookID IN (
    SELECT BookID FROM Loans
)
AND BookID NOT IN (
    SELECT BookID FROM Reservations
);

-- ==========================================
-- EXPRESIONES CONDICIONALES
-- ==========================================

-- CONSULTA 5
SELECT Title,
CASE 
    WHEN AvailableCopies > 0 THEN 'Disponible'
    ELSE 'Agotado'
END AS Estado
FROM Books;

-- CONSULTA 6
SELECT FirstName, LastName,
CASE 
    WHEN UserID IN (SELECT UserID FROM Loans) THEN 'Activo'
    ELSE 'Sin actividad'
END AS Estado
FROM Users;

-- ==========================================
-- GROUP BY Y HAVING
-- ==========================================

-- CONSULTA 7
SELECT bc.CategoryName, COUNT(b.BookID) AS TotalLibros
FROM BookCategories bc
JOIN Books b ON bc.CategoryID = b.CategoryID
GROUP BY bc.CategoryName
HAVING COUNT(b.BookID) > 3;

-- CONSULTA 8
SELECT u.FirstName, u.LastName, COUNT(r.ReservationID) AS TotalReservas
FROM Users u
JOIN Reservations r ON u.UserID = r.UserID
GROUP BY u.UserID
HAVING COUNT(r.ReservationID) > 2;

-- ==========================================
-- INNER JOIN
-- ==========================================

-- CONSULTA 9
SELECT u.FirstName, u.LastName, b.Title
FROM Users u
INNER JOIN Loans l ON u.UserID = l.UserID
INNER JOIN Books b ON l.BookID = b.BookID;

-- CONSULTA 10
SELECT u.FirstName, u.LastName, b.Title
FROM Users u
INNER JOIN Reservations r ON u.UserID = r.UserID
INNER JOIN Books b ON r.BookID = b.BookID;

-- ==========================================
-- LEFT JOIN
-- ==========================================

-- CONSULTA 11
SELECT b.Title, u.FirstName, u.LastName
FROM Books b
LEFT JOIN Reservations r ON b.BookID = r.BookID
LEFT JOIN Users u ON r.UserID = u.UserID;

-- CONSULTA 12
SELECT u.FirstName, u.LastName, b.Title
FROM Users u
LEFT JOIN Loans l ON u.UserID = l.UserID
LEFT JOIN Books b ON l.BookID = b.BookID;

-- ==========================================
-- RIGHT JOIN
-- ==========================================

-- CONSULTA 13
SELECT b.Title, u.FirstName, u.LastName
FROM Reservations r
RIGHT JOIN Books b ON r.BookID = b.BookID
LEFT JOIN Users u ON r.UserID = u.UserID;

-- CONSULTA 14
SELECT u.FirstName, u.LastName, b.Title
FROM Loans l
RIGHT JOIN Users u ON l.UserID = u.UserID
LEFT JOIN Books b ON l.BookID = b.BookID;

-- ==========================================
-- FUNCIONES ESPECIALIZADAS
-- ==========================================

-- CONSULTA 15
SELECT UPPER(Title) AS Titulo_Mayuscula
FROM Books;

-- CONSULTA 16
SELECT CONCAT(FirstName, ' ', LastName) AS Nombre_Completo
FROM Users;

-- ==========================================
-- FUNCIONES DE FECHA
-- ==========================================

-- CONSULTA 17
SELECT b.Title, DATEDIFF(CURDATE(), r.ReservationDate) AS Dias_Transcurridos
FROM Reservations r
JOIN Books b ON r.BookID = b.BookID;

-- CONSULTA 18
SELECT *
FROM Loans
WHERE ReturnDate IS NULL;

-- ==========================================
-- FUNCIONES DE AGREGACIÓN
-- ==========================================

-- CONSULTA 19
SELECT bc.CategoryName, SUM(b.AvailableCopies) AS TotalCopias
FROM BookCategories bc
JOIN Books b ON bc.CategoryID = b.CategoryID
GROUP BY bc.CategoryName;

-- CONSULTA 20
SELECT u.FirstName, u.LastName, COUNT(l.LoanID) AS TotalPrestamos
FROM Users u
LEFT JOIN Loans l ON u.UserID = l.UserID
GROUP BY u.UserID;