#!/bin/bash
printf "\e[1;39mInitializing...\e[0m\n"
printf "\e[1;33mWARNING: If you didn't run this directly (./install.sh), please ^C now.\n"
sleep 5

printf "\e[1;37mPlacing library folder...\e[0m"
sudo mv ./rpi-wpx /usr/share/ >& /dev/null
if [ $? -ne 0 ]; then
  printf "\e[0;31mFailed\e[0m\n"
else
  printf "\e[0;32mDone\e[0m\n"
fi

printf "\e[1;37mSetting up desktop shortcut execution...\e[0m"
sed -i "s|Exec.*|Exec=${PWD}/pkg/wp-change|g" ./pkg/rpiwpx.desktop >& /dev/null
if [ $? -ne 0 ]; then
  printf "\e[0;31mFailed\e[0m\n"
else
  printf "\e[0;32mDone\e[0m\n"
fi

printf "\e[1;37mSetting up desktop shortcut icon...\e[0m"
sed -i "s|Icon.*|Icon=${PWD}/pkg/wpx-logo.png|g" ./pkg/rpiwpx.desktop >& /dev/null
if [ $? -ne 0 ]; then
  printf "\e[0;31mFailed\e[0m\n"
else
  printf "\e[0;32mDone\e[0m\n"
fi

printf "\e[1;37mMoving desktop shortcut...\e[0;32m"
mv ./pkg/rpiwpx.desktop ./ >& /dev/null
if [ $? -ne 0 ]; then
  printf "\e[0;31mFailed\e[0m\n"
else
  printf "\e[0;32mDone\e[0m\n"
fi

printf "\e[1;32mDone\x21\e[0m\n"
printf "\e[1;33mYou can move the desktop shortcut anywhere, but please do not move this folder. If you do, please update the .desktop file accordingly.\e[0m\n"
