## 概要

このアプリケーションは、GitHub API を使用して指定された複数の Issue を GitHub リポジトリに自動作成するツールです。

## 使い方

- 実行コマンド
```sh
ruby main.rb
```

- リポジトリの指定
  - ここには自分の'user_name/repo_name'を指定しておく

```ruby
GITHUB_REPO = "username/repository"
```

- トークンの作成
  - ここにはリポジトリのトークンを指定しておく
```ruby
GITHUB_TOKEN=your_personal_access_token_here
```