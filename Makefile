up:
	@docker-compose up -d
down:
	@docker-compose down
restart:
	@docker-compose restart
connect:
	@docker exec -ti memcache_app-memcache_1 bash
ps:
	@docker-compose ps
logs:
	@docker-compose logs -f

build:
	@stack build
execute: build
	@stack exec memcache-app
run:
	@stack run
ghci:
	@stack ghci
watch:
	@nodemon -e hs -w src --exec "stack run"

.PHONY: all