/*Problem Statement

Write a PL/pgSQL block that declares an integer variable VAL and determines the range in which the value falls.
If VAL is between 1 and 10 (inclusive), display:
YOUR VALUE IS <VAL> AND RANGE IS BETWEEN 1 TO 10
If VAL is between 11 and 20 (inclusive), display:
YOUR VALUE IS <VAL> AND RANGE IS BETWEEN 11 TO 20
If VAL is greater than 20, display:
YOUR VALUE IS <VAL> AND VALUE IS GREATER THAN 20
Use an IF-ELSIF-ELSE conditional structure and RAISE NOTICE statements to display the appropriate message.

Sample Input
VAL := 4;

Sample Output
NOTICE: YOUR VALUE IS 4 AND RANGE IS BETWEEN 1 TO 10

Concept Tested
Variable declaration in PL/pgSQL
Conditional statements (IF, ELSIF, ELSE)
Output using RAISE NOTICE
*/


DO $$
DECLARE
    VAL INT := 4;
BEGIN

    IF VAL > 0 AND VAL <= 10 THEN

        RAISE NOTICE 'YOUR VALUE IS % AND RANGE IS BETWEEN 1 TO 10', VAL;

    ELSIF VAL > 10 AND VAL <= 20 THEN

        RAISE NOTICE 'YOUR VALUE IS % AND RANGE IS BETWEEN 11 TO 20', VAL;

    ELSE

        RAISE NOTICE 'YOUR VALUE IS % AND VALUE IS GREATER THAN 20', VAL;

    END IF;

END;
$$;
