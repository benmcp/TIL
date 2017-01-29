# Simple rails api

## General

### Instal rails-api
```
gem install rails-api
```

### Run server
```
rails s
```

### Install gem

Save gem to `Gemfile`

Bundle gem
```
bundle install
```


## Database stuff

### CLI Associations

To add a model with an association for another model:
```
rails generate model Comment name:string description:string post:references
# or 
rails generate model Comment post_id:integer
```
^ that will add the model `comment` which `belongs_to` a `post`

If the tables are already created:
```
rails g migration AddProjectToGroup project:belongs_to
```
^ This will make projects belong to groups
```

## Create/view Entity-Relationship Diagram

[Download this gem](https://github.com/voormedia/rails-erd)

Add gem `rails-erd` to your application's Gemfile

Run:
```
bundle exec erd
```

This will generate a file `erd.pdf` in the repo's base directory showing your relationships.

Add column to pre-existing model
```
rails generate migration AddUsernameToUsers username:string
```

Create Scaffold
```
rails generate scaffold MyFoo 
```

Destroy Scaffold
```
rails destroy scaffold MyFoo
```
