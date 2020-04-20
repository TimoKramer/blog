#!/bin/bash
lein run
rsync --delete -rav ./public/* moped:/var/www/virtual/moped/blog.timokramer.de
