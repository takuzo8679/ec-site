# アプリを削除する
heroku addons:destroy heroku-postgresql
heroku apps:destroy
heroku addons --all
heroku apps --all
