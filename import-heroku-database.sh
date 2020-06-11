rm -f latest.dump
heroku pg:backups:capture
heroku pg:backups:download
rails db:drop
rails db:create
rails db:migrate
pg_restore --verbose --clean --no-acl --no-owner -d tierethik_development latest.dump
