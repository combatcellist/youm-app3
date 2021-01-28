FROM ruby:2.6.3

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

# 作業ディレクトリの作成、設定
RUN mkdir /my-app

#作業ディレクトリを指定している
WORKDIR /my-app

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは別途事前に作成しておく）
COPY ./Gemfile /my-app/Gemfile
COPY ./Gemfile.lock /my-app/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
COPY . /my-app