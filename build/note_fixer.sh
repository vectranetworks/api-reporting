#!/bin/sh
rm -f ../logs/new_notes.csv # remove if exists
sed 's/\\\\\\"//g' ../logs/notes.csv | sed 's/\\//g' | sed 's/fp/btp/g'> ../logs/new_notes.csv