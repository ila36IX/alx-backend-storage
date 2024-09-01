-- Function that returns the division of 2 numbers

DELIMITER $$

CREATE FUNCTION SafeDiv(a INT, b INT) RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN  IF(b = 0, 0, a / b);
END $$

DELIMITER ;
