SQL> -- Declare a session bind variable. 
SQL> VARIABLE whom VARCHAR2(20)
SQL> 
SQL> -- Enable SERVEROUTPUT setting. 
SQL> SET SERVEROUTPUT ON;
SQL> 
SQL> -- Test case when session bind variable is null. 
SQL> BEGIN
  2    -- Print a session variable value or the default value. 
  3    IF :whom IS NOT NULL THEN
  4      dbms_output.put_line('Hello '||:whom||'!');
  5    ELSE
  6      dbms_output.put_line('Hello World!');
  7    END IF;
  8  END;
  9  /
Hello World!                                                                    

Procedimiento PL/SQL terminado correctamente.

SQL> 
SQL> -- Set the session bind variable with a value. 
SQL> BEGIN
  2    :whom := 'Gideon';
  3  END;
  4  /

Procedimiento PL/SQL terminado correctamente.

SQL> 
SQL> -- Test case when session bind variable is not null. 
SQL> BEGIN
  2    -- Print a session variable value or the default value. 
  3    IF :whom IS NOT NULL THEN
  4      dbms_output.put_line('Hello '||:whom||'!');
  5    ELSE
  6      dbms_output.put_line('Hello World!');
  7    END IF;
  8  END;
  9  /
Hello Gideon!                                                                   

Procedimiento PL/SQL terminado correctamente.

SQL> spool off;
