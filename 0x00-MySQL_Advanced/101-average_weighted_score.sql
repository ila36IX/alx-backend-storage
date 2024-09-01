--  computes and store the average weighted score for all students.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users u 
    SET average_score = 
        (SELECT SUM(c.score * p.weight)
        FROM corrections c JOIN projects p ON c.project_id = p.id
        WHERE c.user_id = u.id) 
        / 
        (SELECT SUM(p.weight)
        FROM corrections c JOIN projects p ON c.project_id = p.id
        WHERE c.user_id = u.id);
END $$
DELIMITER ;
