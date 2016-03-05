# Checklyst

You need to have the right Ruby version (see head of Gemfile), a "modern" Node version too.

Then for the dependencies :

```
npm install
bundle install
bundle exec rake db:setup db:migrate
```

# Launch

Postgres (Mac: `postgres -D /usr/local/var/postgres`)

Start ALL APPS :

```
foreman start -f Procfile.dev
```
