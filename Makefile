.PHONY: setup-perms libs-check docker-init drop-containers clean


help:
	@echo "======================================"
	@echo "  Comandos disponíveis:"
	@echo "============================================================"
	@echo "  make setup-perms      - Configura permissões"
	@echo "  make libs-check       - Verifica bibliotecas instaladas"
	@echo "  make docker-init      - Inicializa containers Docker"
	@echo "  make drop-containers  - Remove todos os containers"
	@echo "  make clean            - Limpa arquivos temporários"
	@echo "======================================"

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
