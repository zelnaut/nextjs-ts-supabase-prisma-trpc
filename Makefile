dev: supabase pgadmin wait web
down: supabase-down pgadmin-down
destroy: supabase-destroy pgadmin-destroy

# Start Supabase
supabase:
	docker compose --file services/supabase/docker-compose.yml up --detach

# Stop Supabase
supabase-down:
	docker compose --file services/supabase/docker-compose.yml down --remove-orphans

# Stop Supabase and destroy volumes
supabase-destroy:
	docker compose --file services/supabase/docker-compose.yml down --remove-orphans --volumes

# Start PGAdmin
pgadmin:
	docker compose --file services/pgadmin/docker-compose.yml up --build --detach

# Stop PGAdmin
pgadmin-down:
	docker compose --file services/pgadmin/docker-compose.yml down --remove-orphans

# Stop PGAdmin and destroy volumes
pgadmin-destroy:
	docker compose --file services/pgadmin/docker-compose.yml down --remove-orphans --volumes

web:
	cd services/web && pnpx prisma migrate dev
	cd services/web && pnpm run dev

wait:
	while ! pg_isready -h localhost; do sleep 1; done
