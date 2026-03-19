.PHONY: setup-perms libs-check docker-init drop-containers clean build-email-api logs-email-api


help:
	@echo "======================================"
	@echo "  Comandos disponíveis:"
	@echo "============================================================"
	@echo "  make setup-perms      - Configura permissões"
	@echo "  make libs-check       - Verifica bibliotecas instaladas"
	@echo "  make docker-init      - Inicializa containers Docker"
	@echo "  make drop-containers  - Remove todos os containers"
	@echo "  make clean            - Limpa arquivos temporários"
	@echo "  make build-email-api  - Rebuild imagem do Email API"
	@echo "  make logs-email-api   - Ver logs do Email API"
	@echo "======================================"

build-email-api:
	docker build -t email-api-basilios ./email-api

logs-email-api:
	docker-compose logs -f email-api

setup-perms:
	./perms.sh

libs-check:
	./libs-check.sh

docker-init:
	./docker-init.sh

drop-containers:
	./drop-containers

clean:
	./clean.sh
