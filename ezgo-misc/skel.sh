#!/bin/bash
#LANG=zh_TW.utf8
function zh_TW {
lang=("將 ezgo 還原初始設定，還原完成後將會自動重新開機。您確定要進行嗎？" "確定" "取消")
}

function en_US {
lang=("Ezgo default settings will be restored.  System will be automatically rebooted after it is done.  Are you sure?" "OK" "Cancel")
}

locale=$(env |grep "LANG="|sed  s/LANG=//g|sed s/.UTF-8//g|sed s/.utf8//g)
$locale;


skel=$(zenity --question --text "${lang[0]}" --ok-label="${lang[1]}" --cancel-label="${lang[2]}")

if   [ $? == 0 ]; then
	user=$(env |grep SUDO_USER= |sed -e 's/SUDO_USER=//g' )
	rm -rf /home/$user/.bash_logout
	rm -rf /home/$user/.bashrc
	rm -rf /home/$user/.bash_history
	rm -rf /home/$user/.config
	rm -rf /home/$user/.FreeCAD
	rm -rf /home/$user/.java
        rm -rf /home/$user/.kde
	rm -rf /home/$user/.local
        rm -rf /home/$user/.macromedia
        rm -rf /home/$user/.mozilla
	rm -rf /home/$user/.xbmc
	rm -rf /home/$user/.profile
	cp -af /etc/skel/.bash_logout /home/$user
	cp -af /etc/skel/.bashrc /home/$user
	cp -af /etc/skel/.config /home/$user
	cp -af /etc/skel/.FreeCAD /home/$user
	cp -af /etc/skel/.java /home/$user
	cp -af /etc/skel/.kde /home/$user
	cp -af /etc/skel/.local /home/$user
	cp -af /etc/skel/.macromedia /home/$user
	cp -af /etc/skel/.mozilla /home/$user
	cp -af /etc/skel/.xbmc /home/$user
	cp -af /etc/skel/.profile /home/$user
	chown -R $user.$user /home/$user	
	#sudo  tar jxvpf /etc/ezgo/skel.tar -C /home/$user| tee >(zenity --progress --pulsate --text="系統還原初始設定中請稍待..."  --auto-close)
	reboot
elif [ $? == 1 ]; then
	exit

fi 

