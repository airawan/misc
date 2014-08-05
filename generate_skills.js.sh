#!/bin/sh
gcc -E tables.c -DENABLE_KOBOLD -DENABLE_MAIA -DENABLE_STANCES -DENABLE_DRACONIAN_TRAITS -DENABLE_MCRAFT > clean
cat clean | ./tableparser.pl > new-skills.js
