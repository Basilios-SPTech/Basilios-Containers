.PHONY: setup-perms libs-check docker-init drop-containers clean

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
