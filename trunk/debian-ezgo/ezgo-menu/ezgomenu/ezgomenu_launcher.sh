#!/bin/bash

source /etc/xdg/ezgo/ezgomenu_filelist.cfg

${file_pos_rt[updater]}$updater
python2 ${file_pos_rt[desktop_maker]}$desktop_maker
