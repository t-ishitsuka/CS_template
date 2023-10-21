.PHONY: help build up stop down app
.DEFAULT_GOAL := help

##################################################
# Make file
##################################################

help:	## Makeオプションの表示
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ""

##################################################
# Docker
##################################################

build:	## Dockerコンテナのビルド
	docker compose build --no-cache

up:		## Dockerコンテナの起動
	docker compose up -d

stop:	## Dockerコンテナの停止
	docker compose stop

down:	## Dockerコンテナの削除
	docker compose down

app:	## Appコンテナへのbash接続
	docker compose exec app bash
