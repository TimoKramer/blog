#!/bin/bash
lein run
rsync --delete -rav ./public/* uberspace:/var/www/virtual/tkramer/blog.timokramer.de
