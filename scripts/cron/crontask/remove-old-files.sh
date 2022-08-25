#!/bin/bash

# Remove files from "Download" folder older than 6 months
find ${HOME}/Downloads -ctime +220 -print0 | xargs -0 rm -r