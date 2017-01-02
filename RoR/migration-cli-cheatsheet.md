# Ruby on Rails - Basic db cli commands


##Add a new model:
```
rails g model Item name:string description:text
```
This create a model called Item. To add this to the database schema enter:
```
rake db:migrate
```

## migration status

See current:
```
rake db:migrate:status
```

Roll back one:
```
rake db:rollback STEP=1
```

Roll back to a specific `STEP`:
```
rake db:migrate:down VERSION=20160101202312
```

Roll up to a specific `STEP`:
```
rake db:migrate:up VERSION=20160101202312
```

## CLI Associations

To add a model with an association for another model:
```
rails generate model comment name:string description:string post:references
```
^ that will add the model `comment` which `belongs_to` a `post`
