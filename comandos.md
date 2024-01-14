
#### Sqlplus
- [Conexion a sqlplus desde la terminal](#conexion-a-sqlplus-desde-la-terminal)
- [Grabar archivo (SPOOL)](#grabar-archivo-(spool))
- [Declarar variables](#declarar-variables)

#### plpgsql
- [Declarar variables](#declarar-variables)



## Conexion a sqlplus desde la terminal

1. Abre una ventana de terminal o línea de comandos.
    
2. Ejecuta el siguiente comando para iniciar SQL*Plus:

```	sqlplus
sqlplus / as sysdba
```

 Esto iniciará sesión como usuario SYS con privilegios de DBA sin ingresar una contraseña.

## Grabar archivo (SPOOL)

Si deseas que Oracle SQL_Plus te cree un archivo con los resultados de una consulta, puedes utilizar el comando `SPOOL`. Este comando se utiliza para enviar la salida de SQL_Plus a un archivo. Aquí hay un ejemplo:


Input 
```	plsql
-- Habilita la grabación de salida en el archivo
SPOOL oracle_lab2.sql;

/* Declare a session bind variable. */
VARIABLE whom VARCHAR2(20)

/* Enable SERVEROUTPUT setting. */
SET SERVEROUTPUT ON;

/* Test case when session bind variable is null. */
BEGIN
  /* Print a session variable value or the default value. */
  IF :whom IS NOT NULL THEN
    dbms_output.put_line('Hello '||:whom||'!');
  ELSE
    dbms_output.put_line('Hello World!');
  END IF;
END;
/

/* Set the session bind variable with a value. */
BEGIN
  :whom := 'Gideon';
END;
/

/* Test case when session bind variable is not null. */
BEGIN
  /* Print a session variable value or the default value. */
  IF :whom IS NOT NULL THEN
    dbms_output.put_line('Hello '||:whom||'!');
  ELSE
    dbms_output.put_line('Hello World!');
  END IF;
END;
/

-- Desactiva la grabación de salida en el archivo
SPOOL OFF;
```


Output

```sqlplus
SQL> /* Declare a session bind variable. */

SQL> VARIABLE whom VARCHAR2(20)

SQL>

SQL> /* Enable SERVEROUTPUT setting. */

SQL> SET SERVEROUTPUT ON;

SQL>

SQL> /* Test case when session bind variable is null. */

SQL> BEGIN

  2    /* Print a session variable value or the default value. */

  3    IF :whom IS NOT NULL THEN

  4      dbms_output.put_line('Hello '||:whom||'!');

  5    ELSE

  6      dbms_output.put_line('Hello World!');

  7    END IF;

  8  END;

  9  /

Hello World!                                                                    

  

Procedimiento PL/SQL terminado correctamente.

  

SQL>

SQL> /* Set the session bind variable with a value. */

SQL> BEGIN

  2    :whom := 'Gideon';

  3  END;

  4  /

  

Procedimiento PL/SQL terminado correctamente.

  

SQL>

SQL> /* Test case when session bind variable is not null. */

SQL> BEGIN

  2    /* Print a session variable value or the default value. */

  3    IF :whom IS NOT NULL THEN

  4      dbms_output.put_line('Hello '||:whom||'!');

  5    ELSE

  6      dbms_output.put_line('Hello World!');

  7    END IF;

  8  END;

  9  /

Hello Gideon!                                                                  

  

Procedimiento PL/SQL terminado correctamente.

  

SQL> spool off;
```
Ten en cuenta que el archivo se creará en el directorio de trabajo actual de SQL*Plus. Puedes proporcionar una ruta completa si deseas guardar el archivo en un directorio específico.

## Declarar variables

### Oracle SQL_Plus
En Oracle SQL_Plus, puedes declarar variables y constantes. Aquí tienes un ejemplo de declaración de variable:


```plsql
-- Variable
VARIABLE mi_variable VARCHAR2(20);
-- Asignar un valor a la variable
EXEC :mi_variable := 'ValorDeseado';
-- Utilizar la variable en una consulta u otras operaciones
SELECT * FROM mi_tabla WHERE columna = :mi_variable;


-- Constante
DEFINE mi_constante = 'ValorConstante';
-- Utilizar la constante en consultas u otras operaciones
SELECT * FROM mi_tabla WHERE columna = '&mi_constante';
```

En Pgsql, puedes declarar variables y constantes. Aquí tienes un ejemplo de declaración de variable:

### Oracle pgsql

```pgsql
-- Declare a variable
DO $$
DECLARE
  mi_variable VARCHAR(20);
BEGIN
  -- Assign a value to the variable
  mi_variable := 'ValorDeseado';
  -- Use the variable in a query or other operations
  RAISE NOTICE '[%]', mi_variable;
END;
$$;

```
