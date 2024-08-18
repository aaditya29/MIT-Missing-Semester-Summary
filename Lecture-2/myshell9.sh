#!/bin/zsh

# This line initiates a loop that iterates over each file in the logfiles directory that has a .log extension.
for file in logfiles/*.log
do
    # tar: Stands for Tape Archive, a utility for creating archive files.
    #-c: Creates a new archive.
    #-z: Compresses the archive with gzip.
    #-v: Verbose mode, which means it will show the progress of the archive creation.
    # -f: Specifies the filename of the archive.
    #$file.tar.gz: The name of the output archive file, which is the original file name with .tar.gz appended.
    # $file: The input file to be archived and compressed.
    tar -czvf $file.tar.gz $file
done

#This script compresses and archives each .log file in the logfiles directory, creating a .tar.gz file for each one.