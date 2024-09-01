-- Procedure ComputeAverageScoreForUser that computes and store 
-- the average score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(user_id INT)
BEGIN
    UPDATE users u
    SET average_score = (
        SELECT AVG(score) FROM corrections c WHERE c.user_id = user_id
    ) WHERE u.id = user_id;
END $$
DELIMITER ;
