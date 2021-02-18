#!/bin/sh
rm -f ../logs/new_notes.csv # remove if exists
sed 's/\\\\\\"//g' ../logs/notes.csv | sed 's/\\//g' > ../logs/new_notes.csv