#
# Makefile for ansible-laptop
#

.PHONY: all galaxy install playbooks backup clean

all: install galaxy playbooks private

install:
	@./bin/install_ansible

galaxy: requirements.yml
	@if [ $$(uname) = Darwin ]; then \
		ansible-galaxy install -p imported_roles -r requirements.yml; \
	fi

playbooks:
	@./bin/run_playbooks

backup:
	@if [ -d ./backup ]; then \
		cp -rv private backup/; \
	else \
		echo "Set up backup/ as symlink to location for your private playbooks."; \
	fi

clean:
	find . -type f -name '*.retry' | xargs rm -f
