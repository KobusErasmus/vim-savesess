# vim-savesess
Vim plugin for automatically creating, saving, and restoring sessions per file

# About
This is a plugin to start Vim without file arguments to automatically load a
session for the file being edited. Hence, unlike autosess
(https://github.com/powerman/vim-plugin-autosess), which saves a session file
per current directory, this plugin saves a session file per file. This makes it
easy to manage sessions for various files in the same directory.

A hidden session file with suffix ".vsess" is created when you quit a Vim file
for the first time. This session file is created in the directory that the file
you edit is in. To make unique session files, the session files contain the
name of the file. For example, if you edit a file called "info.txt", the
session file ".info.txt.vsess" will be created. Thus, you may want to consider
adding "*.vsess" in your .gitignore files.

# Installation

Although not neccessary, I recommend using Vundle
(https://github.com/VundleVim/Vundle.vim) to install savesess. To do this, add
```
Plugin 'kobuserasmus/vim-savesess'
```
to your ~/.vimrc file, and then open Vim and run :PluginInstall.

# Usage

There are currently only two commands run in normal mode:
```
Ss         - This will save the current session.
SS         - This will save the current session and save/write and quit all windows.
```

# About Author
See (www.JacobusErasmus.com).
