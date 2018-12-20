#
# Makefile for ansible-laptop
#

.PHONY: all galaxy install playbooks backup

all: install galaxy playbooks private

install:
	@./bin/install_ansible

galaxy: requirements.yml
	@ansible-galaxy install -p imported_roles -r requirements.yml

playbooks:
	@./bin/run_playbooks

backup:
	@if [ -d ./backup ]; then cp -rv private backup/; \
	else echo "Set up backup/ as symlink to where you want to save your private playbooks."; fi
