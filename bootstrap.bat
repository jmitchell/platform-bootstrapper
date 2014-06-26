#!/bin/sh

@echo off
cmd /C .\windows\bootstrap.bat %*
if ERRORLEVEL 0 exit /b 0
then
    echo "Not Windows. Assuming POSIX."
fi

# WARNING: EVERYTHING ABOVE THIS POINT IS A MIX OF /BIN/SH AND WINDOWS
# BATCH SCRIPT (AND THE IF/THEN IS A WEIRD MIX). BE CAUTIOUS ABOUT
# MAKING CHANGES, INCLUDING COMMENTS.
#
# The first line tells POSIX systems to process this file using the
# POSIX shell. It is an invalid statement in batch scripting, and does
# produce an error.
#
# Everything between the first line and the warning is valid batch
# code. Similarly, those lines result in errors on POSIX systems.
#
# Although these errors are frustrating, this hack--in all its
# dreadful glory--enables bootstrapping code for a wide variety of
# platforms using a uniform abstraction.

echo "OS: $(uname)"

linux/amd64/bootstrap "$@"
