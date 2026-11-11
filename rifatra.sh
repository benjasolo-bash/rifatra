#!/bin/bash
while true
do
history -c;clear
rifatra="rifatra"
rifatraSt="start"
rifatraJ="join us"
rifatraL="login"
rifatraU="user"
rifatraP="pass"
rifatraIp="profile"
rifatraH="home"
rifatraCht="chat"
rifatraCll="call"
rifatraVid="video"
rifatraTxt="text"
rifatraImg="image"
rifatraAud="audio"
rifatraGps="gps"
echo ${rifatra}
date
echo
function gpsF () {
clear
echo ${rifatra} "/" ${rifatraGps}
date
echo
}
function audioF () {
clear
echo ${rifatra} "/" ${rifatraAud}
date
echo
}
function imgF () {
clear
echo ${rifatra} "/" ${rifatraImg}
date
echo
}
function textF () {
clear
echo ${rifatra} "/" ${rifatraTxt}
date
echo
}
function videoF () {
clear
echo ${rifatra} "/" ${rifatraVid}
date
echo
}
function callF () {
clear
echo ${rifatra} "/" ${rifatraCll}
date
echo
}
function chatF () {
clear
echo ${rifatra} "/" ${rifatraCht}
date
echo
}
function homeF () {
clear
echo ${rifatra} "/" ${rifatraH}
date
echo
echo "1 - " ${rifatraCht}
echo "2 - " ${rifatraCll}
echo "3 - " ${rifatraVid}
echo "4 - " ${rifatraTxt}
echo "5 - " ${rifatraImg}
echo "6 - " ${rifatraAud}
echo "7 - " ${rifatraGps}
echo "8 - " ${rifatraIp}
echo
read homeM
while true
do
case ${homeM} in
1) chatF;;
2) callF;;
3) videoF;;
4) textF;;
5) imgF;;
6) audioF;;
7) gpsF;;
8) profileF;;
esac
done
}
function profileF () {
clear
echo ${rifatra} "/" ${rifatraIp}
date
echo ${rifatraIp}
echo
echo "1 - " ${rifatraH}
echo "2 - " ${rifatraIp}
echo "3 - " ${rifatra}
echo
read uMenu
while true
do
case ${uMenu} in
1) homeF;;
2) profileF;;
3) rifatraF;;
esac
done
echo
}
function loginF () {
clear
echo ${rifatra} "/" ${rifatraL}
date
echo ${rifatraL}
echo
echo ${rifatraU}
read uNameL
echo
echo ${rifatraP}
read uPassL
echo
while true
do
profileF
done
}
function joinF () {
clear
echo ${rifatra} "/" ${rifatraJ}
date
echo ${rifatraJ}
echo
echo ${rifatraU}
read uNameJ
echo
echo ${rifatraP}
read uPassJ
echo
while true
do
profileF
done
}
function rifatraF () {
clear
echo ${rifatra} "/" ${rifatraSt}
date
echo
echo "1 - " ${rifatraL}
echo "2 - " ${rifatraJ}
echo "3 - " ${rifatra}
echo
read uCheck
case ${uCheck} in
1) loginF;;
2) joinF;;
3) rifatraF;;
esac
}
rifatraF
done
