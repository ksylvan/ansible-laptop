# ansible-laptop

Reproducible Developer Laptop with Ansible

This repo is a rework from scratch of the work at https://github.com/ksylvan/AnsibleLaptop

## Motivation

I want to demote my laptop from being a "pet" to being "cattle". I will not
lovingly nurture and feed my laptop with hand-crafted customizations and
idiosyncratic non-standard installed software. My laptop is here to be used for
a job, and if I lose it or a disk crashes, I should be able to simply replace it
and reproduce its setup quickly and with minimum fuss.

## Principles

1. No hand installing of software, editing system files, or customization.
2. Use containers as much as possible in preference to installing software on
the host system.
3. Use Ansible playbooks (stored in this repo) exclusively for all system level
installs and configuration.
4. Playbooks optionally backed up to a cloud backup solution of your choice.

## The Goal

With the above in place, if the laptop falls in a river, no big deal. Get
another laptop, apply the minimal install, run the Ansible playbooks here and
restore your user data.

## Quick Start

Start with cloning this repository.

### For Fedora, Ubuntu, and MacOS:

Peruse the playbooks in `playbooks/`. Modify as necessary.

Add new Playbooks here, following the existing structure, then run:

```
make
```

### For other operating systems.

Install Ansible yourself (or extend the `./bin/install_ansible`
script and submit a Pull Request)

## Additional Playbooks

Add additional playbooks in the appropriate `playbooks/` subdirecory and
sumbit a pull request if you think they could be of general use.

Add private playbooks that you do not intend to share in `private/`.
For MacOS, land your playbooks in `private/Darwin` and for Linux,
put them in `private/Linux`.

These will not end up in the git repo and should be backed up
somewhere. These could contain specific or idiosyncratic customizations
that are not of general use.

## Backing Up your `private/` Playbooks

Simply make a symlink to your backup location (for instance your `Keybase`
private volume) to `./backup':

```
mkdir /keybase/private/ksylvan/ansible-laptop
ln -s /keybase/private/ksylvan/ansible-laptop backup
```

Then run:

```
make backup
```
