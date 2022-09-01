# アプリケーション名
kaguya


# アプリケーション概要
創作物の投稿数に応じたアプリ内の変化によって創作活動の継続への動機づけを高めることができる。

# URL
https://kaguya-38242.herokuapp.com/

# テスト用アカウント
・Basic認証パスワード：12seconds2
・Basic認証ID：pyon
・メールアドレス：1ringithub@gmail.com
・パスワード：01nemuup

# 利用方法

## 創作物投稿
1. トップページから新規登録・ログインを行う  
2. 新規投稿ボタンから、投稿物の内容(タイトル・文章または絵の画像・種類・ジャンル・公開設定)を入力し投稿する

## 過去の創作物の閲覧
1. ログインしていれば、トップページとユーザーページでは公開設定にされている作品を一覧で閲覧できる
2. ユーザーは自分の作品をマイページから全て閲覧できる

## 創作物のお気に入り登録
1. 詳細表示では星をクリックするとお気に入り登録ができる
2. ユーザーがお気に入り登録した作品はマイページからお気に入り一覧に飛び、閲覧できる

# アプリケーションを作成した背景
習慣化アプリには、継続日数による変化や達成時に表示するメッセージなど習慣化を支援する機能がついているものが多く存在する。それらを参考に、投稿への反応を内蔵しているアプリケーションを開発することでより創作活動に特化した習慣化・継続支援を可能にしたいと考えた。

# 洗い出した要件
[要件定義書](https://docs.google.com/spreadsheets/d/1mojok8HZ5spvU1tEXFK5xIMEqjrF-elAvwWyh7W8rqs/edit#gid=982722306)

# 実装した機能について

## ユーザー管理機能
### 新規登録
・Eメールアドレスとパスワード、ニックネームで新規登録ができる

### ログイン
・サインイン画面に新規登録した情報を入力すると、ログインすることができる

・エラーハンドリングを行う

## 投稿管理機能

### 新規投稿
・フォームから投稿内容を入力できる。SENDボタンから投稿できる。  
・タイトル、作品(文章または画像)、形式、ジャンル、を記入・選択すると投稿できる。  
・任意で公開設定のチェックボックスをチェックすることもできる。  
・投稿が成功すると投稿完了画面に遷移する。不備がある場合はエラーメッセージが表示される。  

### 投稿一覧表示
・トップページでは、公開されている投稿が一覧で表示されている。  
・6件ごとでページ分けされている。  
・一覧では、投稿作品のタイトル・画像・文章(50字まで)・投稿者の情報が表示されている。  
・タイトルと画像が投稿の詳細ページにリンクしている。  

### 投稿詳細表示
・創作物のタイトル、投稿日、創作物、投稿者の名前を見ることができる。  
・投稿者のみに削除ボタンと編集ボタンが表示される。  
・お気に入りボタンがある。  
・投稿者の名前は投稿者のユーザーページへのリンクになっている。

### 投稿編集機能
・詳細ページから編集ボタンをクリックすると、編集フォームが表示される。  
・何も変更せずに編集した場合も、投稿内容が消えることはない。  
・投稿者以外が編集ページに遷移しようとすると、一覧ページにリダイレクトされる。

### 投稿削除機能
・詳細ページから削除ボタンをクリックすると、投稿が削除される。  
・削除ボタンをクリック後は、一覧ページに遷移する。  
・投稿者以外が削除できないように、サーバーサイドで制御できている。  
・投稿を削除しても累計投稿数は変わらない。  

## お気に入り管理機能
・投稿詳細の星形のボタンからお気に入り登録または解除を行える。
・ユーザーのマイページには、お気に入り投稿の一覧表示ページへのリンクがある。


# 実装予定の機能
・検索機能
・タグ付け機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/03209bb3887d656bcdd7fb2a921e6427.png)](https://gyazo.com/03209bb3887d656bcdd7fb2a921e6427)


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/0090f259d99732fb87a3cc17ef620ef0.png)](https://gyazo.com/0090f259d99732fb87a3cc17ef620ef0)


# 開発環境
・フロントエンド：HTML, CSS, JavaScript  
・バックエンド： Ruby  
・インフラ：Heroku  
・テスト：RSpec  
・テキストエディタ：VSCode  
・タスク管理：Trello


# 工夫したポイント
・投稿のハードルを下げるためのデータ設計やビュー作成（ラジオボタンやチェックボックスを用いたフォーム・非公開設定)  
・累計投稿数を記録するcountテーブルの作成


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :posts
- has_one_attached :counts
- has_many :favorites

## counts テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
|user          | references | null: false, foreign_key: true |
|count         | integer    | null: false                    |

### Association

-  belongs_to :user

## posts テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| text             | text       | null: false                    |
| kind             | integer    | null: false                    |
| is_published     | boolean    | null: false                    |
| genre            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_many : post_tags
- has_many :favorites


## posts テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_id          | references | null: false, foreign_key: true |
| tag_id           | references | null: false, foreign_key: true |



### Association

- belongs_to :post
- belongs_to :tag

## tags テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |

### Association

- has_many : post_tags


## favorites テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_id          | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |



### Association

- belongs_to :post
- belongs_to :user