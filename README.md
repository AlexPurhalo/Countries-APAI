
### Usage
    $ bundle install
    $ sequel -m db/migrations sqlite://db/database.db
    $ foreman start
    
### Testing
    $ sequel -m db/migrations sqlite://db/test.db
    $ rspec
     
### Work with Db
     $ racksh
     > Example.create(name: 'some name')
     > Example.count

### In browser
     http://localhost:5000/:example_id
     as ":example_id" use id of created example record

### Heroku 
    $ heroku login
    $ heroku create
    $ git push heroku master
    $ sequel -m db/migrations/ "$(heroku config:get DATABASE_URL)"
    $ heroku restart
    $ heroku run racksh
    > Example.create(name: 'production record')
    > Example.count
     
### Production
https://grape-boilerplate.herokuapp.com