#!/bin/bash
rifatraTxt="rifatra"
function buildRifatra () {
touch users.txt
userJs=""
while IFS=: read -r u p
do
if [-n "${u}"]
then
usersJs="${userJs}\"${u}":\"${p}","
fi
done < users.txt
> index.html
rifatraUsers=`cat users.txt`
echo '<!DOCTYPE html>' >> index.html
echo '<html>' >> index.html
echo '<head>' >> index.html
echo '<title>'${rifatraTxt}'</title>' >> index.html
echo '</head>' >> index.html
echo '<body>' >> index.html
echo '<h1>'${rifatraTxt}'</h1>' >> index.html
echo '<div id="divStart">' >> index.html
echo '<p>No localhost, no server, just this file</p>' >> index.html
echo '<input id="user" placeholder="username"><br>' >> index.html
echo '<input id="pass" type="password" placeholder="password"><br>' >> index.html
echo '<button id="loginB" class="green" onclick="doLogin ();">Login</button>' >> index.html
echo '<button id="joinB" class="yellow" onclick="doJoin ();">Join</button>' >> index.html
echo '</div>' >> index.html
echo '<div id="divUsers">'${rifatraUsers} >> index.html
echo '<button id="showUsersB" onclick="showUsers ();">Show users</button>' >> index.html
echo '<div id="divCodes">'${rifatraUsers} >> index.html
echo '<p>'${rifatraCodes}'</p>' >> index.html
echo '<button id="hideUsersB" onclick="hideUsers ();">Back</button>' >> index.html
echo '</div>' >> index.html
echo '</div>' >> index.html
echo '<p id="msg"></p>' >> index.html
echo '<p>Tip: User created in bash are in users.txt, users created on browser are in localStorage.</p>' >> index.html
echo '<button id="exitB" class="red" onclick="doExit ();">Exit</button>' >> index.html
echo '<script>' >> index.html
echo 'let bashUsers = {'${usersJs}'};' >> index.html
echo 'let startUsers = document.getElementById("divStart");' >> index.html
echo 'let listUsers = document.getElementById("divUsers");' >> index.html
echo 'let codeUsers = document.getElementById("divCodes");' >> index.html
echo 'let exitUsersB = document.getElementById("exitB");' >> index.html
echo "listUsers.style.display = 'none';" >> index.html
echo "codeUsers.style.display = 'none';" >> index.html
echo "exitUsersB.style.display = 'none';" >> index.html
echo 'function doJoin () {' >> index.html
echo '	let u = document.getElementById("user").value;' >> index.html
echo '	let p = document.getElementById("pass").value;' >> index.html
echo '	if (!u || !p) {document.getElementById("msg").innerText = "Fill both!";return;}' >> index.html
echo '	if (localStorage.getItem("user_" + u) || bashUsers[u]) {document.getElementById("msg").innerText = "User " + u + ", already existes.";return;}' >> index.html
echo '	localStorage.setItem ("user_" + u, p);' >> index.html
echo '	document.getElementById("msg").innerText = "Account created for " + u + "! (Saved in browser)";' >> index.html
echo "	startUsers.style.display = 'none';" >> index.html
echo '	alert ("'${rifatraUsers}'");' >> index.html
echo "	listUsers.style.display = 'block';" >> index.html
echo "	exitUsersB.style.display = 'block';" >> index.html
echo '}' >> index.html
echo 'function doLogin () {' >> index.html
echo '	let u = document.getElementById("user").value;' >> index.html
echo '	let p = document.getElementById("pass").value;' >> index.html
echo '	let saved = localStorage.getItem("user_" + u);' >> index.html
echo '	if (!u || !p) {document.getElementById("msg").innerText = "Fill both!";return;}' >> index.html
echo '	if (saved === p && saved !== null) {document.getElementById("msg").innerText = "Welcome back, " + u + "! (from browser)";return;}' >> index.html
echo '	if (bashUsers[u] === p) {document.getElementById("msg").innerText = "Welcome back, " + u + "! (from bash users.txt)";return;}' >> index.html
echo '	document.getElementById("msg").innerText = "Login failed.";' >> index.html
echo "	startUsers.style.display = 'none';" >> index.html
echo '	alert ("'${rifatraUsers}'");' >> index.html
echo "	listUsers.style.display = 'block';" >> index.html
echo "	exitUsersB.style.display = 'block';" >> index.html
echo '}' >> index.html
echo 'function showUsers () {' >> index.html
echo "	codeUsers.style.display = 'block';" >> index.html
echo '}' >> index.html
echo 'function hideUsers () {' >> index.html
echo "	codeUsers.style.display = 'none';" >> index.html
echo '}' >> index.html
echo 'function doExit () {' >> index.html
echo "	listUsers.style.display = 'none';" >> index.html
echo "	codeUsers.style.display = 'none';" >> index.html
echo "	exitUsersB.style.display = 'none';" >> index.html
echo "	divStart.style.display = 'block';" >> index.html
echo '	document.getElementById("user").value = null;' >> index.html
echo '	document.getElementById("pass").value = null;' >> index.html
echo '}' >> index.html
echo '</script>' >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html
echo 'Built index.html with Bash users included'
}
function addUser () {
clear
read -p "> _ New username: " newuser
read -p ">_ New password: " newpass
if grep -q "${newuser}:" users.txt
then
echo "User already exists in users.txt"
else
echo "${newuser}:${newpass}" >> users.txt
echo "Saved to users.txt"
buildRifatra
fi
}
function rifatra () {
echo "==="${rifatraTxt}"==="
date
echo "---------------------"
echo "1) Build site"
echo "2) Build + Open local"
echo "3) Add user via Bash (backup to users.txt)"
echo "4) Show users.txt"
echo "5) Exit"
echo "--------------------"
read -p ">_ Choose: " uRifatra
case ${uRifatra} in
1) buildRifatra;;
2) buildRifatra;xdg-open index.html;;
3) addUser;;
4) cat users.txt;;
5) exit 0;;
*) echo "Wrong choice!";;
esac
}
clear
while true
do
rifatra
done
