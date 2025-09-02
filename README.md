# restic backup daemon (rbackupd)

`rbackupd` is a collection of bash scripts and systemd unit files to automate
restic backups. Backup targets are configured with so-called environment files,
which are simple bash scripts that export relevant environment variables for
restic. The scripts `rbackupd`, `rcheckd`, and `rforgetd` are simple wrappers
around the corresponding restic sub-commands that merely source the environment
files before invoking the commands.

## Usage
```shell
rbackupd targetname [extra restic args]
```

This scrip will source the environment file for `targetname` at
`$XDG_CONFIG_HOME/rbackupd/targetname-env.sh`
(defaults to `$HOME/.config/rbackupd/targetname-env.sh`) and backup the files
listed in `$XDG_CONFIG_HOME/rbackupd/targetname.files`.

## Configuration
All configuration files are located in `$XDG_CONFIG_HOME/rbackupd`
(defaults to `$HOME/.config/rbackupd`). To create a backup, three files are
required:
 - `targetname-env.sh`: Environment files containing settings for restic
 - `targetname.files`: List of files to be backed up, e.g. `/home/username`
 - `exclude.files`: List of files and patterns to be excluded. Can be empty.
    This file is shared with with all targets.

### Environment files
Environment files are simple bash scripts that are sourced before invoking the
`restic` command. By exporting for example `RESTIC_REPOSITORY` and
`RESTIC_PASSWORD`, you can configure restic.

#### Hooks
You can define the bash arrays `hooks_pre` and `hooks_post` to execute bash
functions before and after the backup process. Functions in `hooks_post` are
passed the exit code of the `restic` command as a parameter.

Example:
```bash
hook_pgdump() {
    pg_dumpall -h /tmp -f /tmp/pg_backup.sql
}

hook_pgdump_post() {
    echo "Restic exit code: $1"
    rm -- /tmp/pg_backup.sql
}

hooks_pre=( "hook_pgdump" )
hooks_post=( "hook_pgdump_post" )
```

Hooks are only used for the `rbackupd` command.

