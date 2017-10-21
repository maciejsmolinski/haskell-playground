up:
	docker-compose up -d
down:
	docker-compose down
restart:
	docker-compose restart
connect:
	docker exec -ti memcache_app-memcache_1 bash
ps:
	docker-compose ps
logs:
	docker-compose logs -f