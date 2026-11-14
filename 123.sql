-- Create the log table for the trigger
CREATE TABLE trigger_test (
    Message VARCHAR(100)
);

--  Create the Trigger using SQLite-compatible syntax
CREATE TRIGGER my_trigger 
BEFORE INSERT ON employee
FOR EACH ROW 
BEGIN
    INSERT INTO trigger_test (Message)
    VALUES (
        CASE 
            WHEN NEW.Sex = 'M' THEN 'added male employee'
            WHEN NEW.Sex = 'F' THEN 'added female employee'
            ELSE 'added other employee'
        END
    );
END;

-- Test the Trigger with an insert
INSERT INTO employee
VALUES (109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000);

-- 5. Check if the trigger successfully logged the message
SELECT * FROM trigger_test;


