.PHONY: install

install:
	sudo apt install -y ansible ansible-lint

lint:
	ansible-lint -v \
		--offline \
		--strict \
		-p playbook.yaml
