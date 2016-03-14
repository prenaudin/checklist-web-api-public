# ChecklistWebApi

You need to have the right Ruby version (see head of Gemfile).

```
bundle install
bundle exec rake db:setup db:migrate
```

# Launch		
		
Postgres (Mac: `postgres -D /usr/local/var/postgres`)		
		
Start ALL APPS :		
		
```		
foreman start -f Procfile.dev		
```
