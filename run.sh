#!/bin/sh 
crond &
caddy run --config /config/Caddyfile
