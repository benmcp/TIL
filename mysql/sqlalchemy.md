# SQLAclhemy

## Convert SQLAlchemy Query to Str Query

```
str(query.statement.compile(compile_kwargs={"literal_binds": True}))
```
