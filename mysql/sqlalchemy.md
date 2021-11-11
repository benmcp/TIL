# SQLAclhemy

## Convert SQLAlchemy Query to Str Query

```
str(query.statement.compile(compile_kwargs={"literal_binds": True}))
```

## Convert SQLAlchmey Insert to Str
```
from sqlalchemy.dialects import mysql
insert_stmt.compile(dialect=mysql.dialect(), compile_kwargs={"literal_binds": True})
```
