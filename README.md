# test-github-actions

## github pages
https://take-takashi.github.io/test-github-actions/

## このリポジトリでやりたい事
- github actionsでgithub pagesへ自動デプロイ

## やった事メモ
- `docker-compose.yml`準備
- `npm init nuxt-app`
- `.editorconfig`をプロジェクトルートへ移動
- `.gitignore`をプロジェクトルートへ移動
- `.github/workflows/main.yml`を作成
- 起動用の`docker-compose.*.yml`を作成
- 起動用の`run_*.sh`を作成
- 起動用に`package.json`を修正（環境ごとのコマンドを追加）
- 環境ごとの設定をする`config.js`を作成
- `nuxt.config.js`に環境を判断できる変数を追加
- `nuxt.config.js`を`config.js`を読み込むように修正
- `nuxt.config.js`に`router`の設定を追加
- `.babelrc`を削除（デフォルトでnuxtが上書きするので）
- `nuxt.config.js`の`build`に`babel`の修正（looseオプションが煩いので）
