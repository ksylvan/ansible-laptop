#
# Makefile for ansible-laptop
#

.PHONY: all galaxy install playbooks private backup

all: install galaxy playbooks private

galaxy: requirements.yml
	@ansible-galaxy install -p imported_roles -r requirements.yml

install:
	@./install_ansible

playbooks:
	@for f in $$(ls playbooks/$$(uname)/*.yml); do ansible-playbook $$f; done

private:
	@if [ -n "$$(ls private/$$(uname)/*.yml 2>/dev/null)" ]; then \
	    for f in $$(ls private/$$(uname)/*.yml); do ansible-playbook $$f; done; fi

backup:
	@if [ -d ./backup ]; then cp -rv private backup/; \
	else echo "Set up backup/ as symlink to where you want to save your private playbooks."; fi
