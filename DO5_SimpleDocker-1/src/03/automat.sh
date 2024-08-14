#!/bin/bash

function forward_menu {
	echo "FORWARD OPTION:"
	echo
	echo "[1] Create folders DATA_PATH=/etc/nginx/data"
	echo "[2] Copy index.html ?"
	echo "[3] Copy nginx.conf ?"
	echo "[4] Copy images to IMAG_PATH=/etc/nginx/data/images ?"
	echo "[5] CAT nginx.conf "
	echo "[6] CAT index.html"
	echo "[7] ls -la folders in container"
	echo "[8] Reload nginx"
	echo
}

function fcgi_menu {
	echo "FastCGI menu:"
	echo
	echo "[0] ls -la"
	echo "[1] install gcc and fcgi"
	echo "[2] Copy server to docker ?"
	echo "[3] Compile server ?"
	echo "[4] Run Server ?"
	echo "[5] Make DIR /fastcgi"
	echo
}

function cat_menu {
	echo "          list  "
	echo "------------------------------"
	echo
	echo "[F] CONTAINERS"
	echo "[E] Forward nginx"
	echo "[J] Reverse nginx"
	echo "[D] Fcgi Server"
	echo "[S] NGINX - MODULES TEST"
	echo "[Z] Restart nginx ?"
	echo "[Q] Quit --------->"
	echo "------------------------------"
	echo
}

function message_quit {
		echo " - - - -  press enter - -"
		read quit_mess
		clear
}

FILE_CP_PATH=../image-*
INDE_CP_PATH=index.html
NGIN_CP_PATH=nginx.conf
DATA_PATH=/etc/nginx/data
INDE_PATH=/etc/nginx/data/www
IMAG_PATH=/etc/nginx/data/images
NGIN_PATH=/etc/nginx/

echo "Enter ID container: ... "
read my_cont
MY_CONTAINER=$my_cont
#echo $MY_CONTAINER
#read rrrrr

while true;
do
	clear
	echo "Container - - $MY_CONTAINER - - enabled"
	echo
	cat_menu
	read keypress_1
	case "$keypress_1" in

		"F" | "f" )
		echo "CONTAINERS RUN: "
		sudo docker ps | awk '{print $1}'
		echo
		echo "CONTAINERS STOP: "
		sudo docker ps -a | awk '{print $1}'

		message_quit
		;;

		"E" | "e" )
		echo "---------------------------------------------------"
		echo "----------------- NGINX FORWARD  ------------------"
		echo "---------------------------------------------------"
		forward_menu
		read keypress_2
		case "$keypress_2" in

			"1" )
			# [1] Create folders 
			# DATA_PATH=/etc/nginx/data
			if !(sudo docker exec $MY_CONTAINER test -d $DATA_PATH); then
				sudo docker exec $MY_CONTAINER mkdir $DATA_PATH
				echo "FOLDER DATA CREATED.."
				echo
			fi
			# INDE_PATH=/etc/nginx/data/www
			if !(sudo docker exec $MY_CONTAINER test -d $INDE_PATH); then
				sudo docker exec $MY_CONTAINER mkdir $INDE_PATH
				echo "FOLDER WWW CREATED.."
				echo
			fi
			# IMAG_PATH=/etc/nginx/data/images
			if !(sudo docker exec $MY_CONTAINER test -d $IMAG_PATH); then
				sudo docker exec $MY_CONTAINER mkdir $IMAG_PATH
				echo "FOLDER WWW CREATED.."
				echo
			fi
			;;

			"2" )
			# [2] Copy index.html
			sudo docker cp $INDE_CP_PATH $MY_CONTAINER:$INDE_PATH
			echo "index.html copied"
			echo
			;;

			"3" )
			# [5] Copy nginx.conf
			sudo docker cp $NGIN_CP_PATH $MY_CONTAINER:$NGIN_PATH
			echo "nginx.conf copied"
			echo
			;;

			"4" )
			# [6] Copy images to IMAG_PATH=/etc/nginx/data/images
			sudo docker cp $MY_CONTAINER:$IMAG_PATH
			echo "image copied"
			echo
			;;

			"5" )
			# [5] CAT nginx.conf
			sudo docker exec $MY_CONTAINER cat $NGIN_PATH/$NGIN_CP_PATH
			echo
			;;
		
			"6" )
			# [6] CAT index.html
			sudo docker exec $MY_CONTAINER cat $INDE_PATH/$INDE_CP_PATH
			echo
			;;

			"7" )
			# ls -la created folders
  			echo "---------------------------------------------------"
			echo "------------------ LS FOLDERS ---------------------"
			echo "---------------------------------------------------"
			echo "$MY_CONTAINER $IMAG_PATH"
			sudo docker exec $MY_CONTAINER ls -la $IMAG_PATH

			echo "$MY_CONTAINER $INDE_PATH"
			sudo docker exec $MY_CONTAINER ls -la $INDE_PATH

			echo "$MY_CONTAINER $NGIN_PATH"
			sudo docker exec $MY_CONTAINER ls -la $NGIN_PATH
			;;

			"8" )
			# reload nginx
			sudo docker exec $MY_CONTAINER nginx -s reload
			;;

			  * )
			clear
			;;
		esac
		message_quit
		;;

  		"J" | "j" )
		echo "---------------------------------------------------"
		echo "----------------- NGINX REVERSE -------------------"
		echo "---------------------------------------------------"
  		# this rules
  		# echo "==================================================="
  		# echo "---------------------- LOGS -----------------------"
  		# echo "==================================================="

		# USR_LOC_NGINX_LOGS=/usr/local/nginx
		# VAR_LOG_NGINX_AC=/var/log/nginx/access.log
		# VAR_LOC_NGINX_ER=/var/log/nginx/error.log

  		# #echo $(sudo docker exec $MY_CONTAINER ls -la $USR_LOC_NGINX_LOGS) > temp_file.log
		# # check errors in logs
		# #if !(sudo docker exec $MY_CONTAINER test -f $VAR_LOG_NGINX_AC); then
		# #	sudo docker exec $MY_CONTAINER cat $VAR_LOG_NGINX_AC
		# #elif !(sudo docker exec $MY_CONTAINER test -f $VAR_LOC_NGINX_ER); then
		# #	sudo docker exec $MY_CONTAINER cat $VAR_LOC_NGINX_ER
		# #fi
		message_quit
		;;

  		"D" | "d" )
		echo "---------------------------------------------------"
		echo "----------------- FAST CGI SERVER -----------------"
		echo "---------------------------------------------------"
		fcgi_menu
		read keypress_d
		case "$keypress_d" in

			"0" )
			#"[0] ls -la / "
			sudo docker exec $MY_CONTAINER ls -la
			sudo docker exec $MY_CONTAINER ls -la /fastcgi
			message_quit
			;;

			"1" )
			#"[1] install gcc and fcgi"
			sudo docker exec $MY_CONTAINER apt update
			sudo docker exec $MY_CONTAINER apt-get -y install build-essential
			sudo docker exec $MY_CONTAINER apt-get -y install gcc
			sudo docker exec $MY_CONTAINER apt-get -y install libfcgi libfcgi-dev
			sudo docker exec $MY_CONTAINER apt-get -y install spawn-fcgi
			# sudo docker exec $MY_CONTAINER apt-get -y install nginx
			echo "READY"
			message_quit
			;;

			"2" )
			#"[2] Copy server to docker ? (before need - #5)"
			sudo docker cp ../server/fastcgiEasy.c $MY_CONTAINER:/fastcgi
			echo "READY"
			message_quit
			;;

			"3" )
			#"[3] Compile server ?"
			sudo docker exec $MY_CONTAINER gcc /fastcgi/fastcgiEasy.c -lfcgi -o /fastcgi/nfcgi 
			echo "READY"
			message_quit
			;;

			"4" )
			#"[4] Run Server ?"
			sudo docker exec $MY_CONTAINER spawn-fcgi -p 8080 -n ./fastcgi/nfcgi
			message_quit
			;;

			"5" )
			#"[5] make dir "
			sudo docker exec $MY_CONTAINER mkdir /fastcgi
			echo "READY"
			message_quit
			;;

			esac
		;;

		"S" | "s" )
		# MODULES TEST
		echo "---------------------------------------------------"
		echo "----------------- MODULES TEST --------------------"
		echo "---------------------------------------------------"
		echo "STATUS PAGE TEST"
		sudo docker exec $MY_CONTAINER nginx -V 2>&1 | grep -o with-http_stub_status_module
		message_quit
		;;

		"Z" | "z" )
		# restart nginx
		sudo docker exec $MY_CONTAINER nginx -s reload
		message_quit
		;;

		"Q" | "q" )
		# exit
		exit 0
		;;

  				* )
  		echo
  		echo "data error ... "
		message_quit
  		;;

	esac
done

echo

exit 0
