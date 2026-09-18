# Experiment 8: Stored Procedure and Exception Handling in PostgreSQL


## Objective

To understand and implement stored procedures in PostgreSQL using `IN`, `OUT`, and `INOUT` parameters, conditional checking, exception handling, and database updates.

---

## Programs

### 8.1 Update Employee Salary Using a Stored Procedure

**Aim:** Create a PostgreSQL stored procedure that identifies an employee using their employee ID, adds the given salary amount to the employee's current salary, updates the `emp` table, and returns a status message.

#### Stored Procedure

```sql
CREATE OR REPLACE PROCEDURE update_sal_proc1(
    IN p_empid INT,
    OUT status VARCHAR(20),
    INOUT p_salary NUMERIC(20, 2)
)
AS $$
DECLARE
    current_sal NUMERIC;
BEGIN

    SELECT salary INTO current_sal
    FROM emp
    WHERE emp_id = p_empid;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Employee Not Found';
    END IF;

    p_salary = current_sal + p_salary;

    UPDATE emp
    SET salary = p_salary
    WHERE emp_id = p_empid;

    status = 'Success';
END;
$$ LANGUAGE plpgsql;
```


The procedure `update_sal_proc1` accepts an employee ID through the `p_empid` input parameter, receives the salary amount through the `p_salary` `INOUT` parameter, and returns the execution status through the `status` `OUT` parameter. It first retrieves the employee's current salary from the `emp` table. If no employee is found, an exception is raised. Otherwise, the input salary amount is added to the current salary and the updated value is stored in the table. fileciteturn0file0L1-L5 fileciteturn0file0L11-L23

#### Procedure Call

```sql
CALL update_sal_proc1(101, NULL, 5300);
```


The procedure is called for employee ID `101` with `5300` as the salary amount to be added. The `status` parameter is supplied as `NULL` because it is an `OUT` parameter. fileciteturn0file0L27-L27

**Output:**

```text
status   | p_salary
---------+---------
Success  | 55300.00
```


The procedure executes successfully and returns the status as `Success`. The updated salary returned through `p_salary` is `55300.00`.

If the supplied employee ID does not exist in the `emp` table, the procedure raises the exception `Employee Not Found`. fileciteturn0file0L11-L15

---

## Key Concepts Used

- **Stored Procedure:** `update_sal_proc1` encapsulates the salary update logic in a reusable PostgreSQL procedure.
- **IN Parameter:** `p_empid` receives the employee ID used to identify the employee.
- **OUT Parameter:** `status` returns the execution status such as `Success`.
- **INOUT Parameter:** `p_salary` receives the salary increment and returns the updated salary.
- **SELECT INTO:** Retrieves the employee's current salary into the `current_sal` variable.
- **FOUND Condition:** `IF NOT FOUND` checks whether the employee record was retrieved.
- **Exception Handling:** `RAISE EXCEPTION` generates an error when the employee does not exist.
- **UPDATE Statement:** Updates the employee's salary with the calculated value.
- **PL/pgSQL:** The procedure is implemented using PostgreSQL's `plpgsql` language. fileciteturn0file0L7-L8 fileciteturn0file0L11-L23

---

## Learning Outcomes

- Understood the concept of stored procedures in PostgreSQL.
- Learned how to use `IN` parameters in a procedure.
- Learned how to use `OUT` parameters to return values.
- Understood the purpose of `INOUT` parameters.
- Learned to retrieve values using `SELECT INTO`.
- Understood the use of `FOUND` for checking whether a query returned a record.
- Learned how to raise an exception using `RAISE EXCEPTION`.
- Implemented an employee salary update using a stored procedure.
- Learned how a procedure can return both a status message and an updated value.

---

## Conclusion

This experiment provided practical knowledge of stored procedures and exception handling in PostgreSQL. The procedure identifies an employee using `p_empid`, retrieves the current salary, adds the supplied salary amount, updates the employee record, and returns the updated salary along with a success status. It also demonstrates exception handling by raising `Employee Not Found` when the specified employee does not exist.
