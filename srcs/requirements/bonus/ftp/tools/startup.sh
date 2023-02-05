#!/bin/bash
useradd -m $FTPUSER
echo "$FTPUSER:$FTPPASS" | chpasswd

# Create the vsftpd user list file
echo "$FTPUSER" > /etc/vsftpd.user_list
mkdir -p /var/run/vsftpd/empty

# Set the FTP user's home directory

mkdir /home/$FTPUSER/ftp
chown nobody:nogroup /home/$FTPUSER/ftp
chmod a-w /home/$FTPUSER/ftp


mkdir /home/$FTPUSER/ftp/files
chown $FTPUSER:$FTPUSER /home/$FTPUSER/ftp/files

# Create the configuration file for vsftpd
echo "listen=YES\n"\
"local_enable=YES\n"\
"chroot_local_user=YES\n"\
"user_sub_token=$FTPUSER\n"\
"local_root=/home/$FTPUSER/ftp\n"\
"write_enable=YES\n"\
"local_umask=022\n"\
"dirmessage_enable=YES\n"\
"use_localtime=YES\n"\
"xferlog_enable=YES\n"\
"connect_from_port_20=YES\n"\
"secure_chroot_dir=/var/run/vsftpd/empty\n"\
"pam_service_name=vsftpd\n"\
"rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem\n"\
"rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key\n"\
"user_config_dir=/etc/vsftpd/user_conf\n"\
"userlist_enable=YES\n"\
"userlist_file=/etc/vsftpd.user_list\n"\
"userlist_deny=NO\n"\
"tcp_wrappers=YES\n" > /etc/vsftpd.conf

vsftpd /etc/vsftpd.conf
