-- Computes and store the average weighted score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(user_id INT)
BEGIN
    DECLARE weight_sum INT;
    DECLARE score_sum INT;

    SELECT 
        SUM(c.score * p.weight) INTO score_sum
    FROM corrections c JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;
 
    SELECT 
        SUM(p.weight) INTO weight_sum
    FROM corrections c JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;

    
    UPDATE users u 
    SET average_score = score_sum / weight_sum WHERE u.id = user_id;
END $$
DELIMITER ;
