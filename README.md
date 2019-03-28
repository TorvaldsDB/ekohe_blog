
# Ekohe Blog

## Start Ekohe Blog

install gems

```ruby
bundle install
```

create database and tables(PostgreSQL)

```ruby
rake db:create && rake db:migrate && rake db:seed
```
after it's over, created a admin with 50 articles

> account: admin@gmail.com
> 
> password: ekoheadmin123

and created 50 users of who every has 50 articles

start server

```ruby
rails s
```

open your brower

```ruby
localhost:3000
```
Go surfing. Hava fun! ^_^

## TODO

1. Remember me
2. upload a avatar
3. Follower and following
4. Activate the Email
5. Reset the password
6. Add a comment
7. Chat room
8. Deploy

## Contributing
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
