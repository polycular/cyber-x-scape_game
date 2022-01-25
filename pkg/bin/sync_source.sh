#!/bin/sh

SOURCE='./'
DESTINATION='cxs_app_server:app/cxs/source'

rsync --recursive --perms --times --delete --compress --cvs-exclude --exclude-from='.gitignore' --exclude='.elixir_ls' --itemize-changes --human-readable $SOURCE $DESTINATION
