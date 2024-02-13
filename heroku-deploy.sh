# デプロイ
heroku login
heroku apps:create
heroku addons:create heroku-postgresql:mini
# 環境変数設定
source .env
heroku config:set AWS_ACCESS_KEY="$AWS_ACCESS_KEY"
heroku config:set AWS_SECRET_KEY="$AWS_SECRET_KEY"
heroku config:set AWS_REGION="$AWS_REGION"
heroku config:set AWS_BUCKET="$AWS_BUCKET"
heroku config:set BASIC_AUTH_USER="$BASIC_AUTH_USER"
heroku config:set BASIC_AUTH_PASSWORD="$BASIC_AUTH_PASSWORD"
# target_branchをherokuへpushする
## 現在のブランチ名
CURRENT_BRANCH=$(git branch --contains | cut -d " " -f 2):main
git push heroku $CURRENT_BRANCH
# setup
heroku run rake db:migrate
heroku run rails db:seed
heroku ps:scale web=1
heroku open
heroku logs --tail
