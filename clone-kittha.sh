#!/bin/bash
#ENTER git-playground-template remote repo link
template_link="git@github.com:kittha/git-playground-template.git"

#ENTER git-playground-clone remote repo link
clone_link="git@github.com:kittha/git-playground-clone.git"

#ENTER dir name
#template dir name
#eg.github remote repo template link is "git@github.com:kittha/git-playground-template.git"
#then repository name is <git-playground-template>
template_dir_name="git-playground-template"

#clone dir name
#eg.github remote repo clone link is "git@github.com:kittha/git-playground-clone.git"
#then repository name is <git-playground-clone>
clone_dir_name="git-playground-clone"



echo "***** INIT GITHUB CRUD CLONING SCRIPT *****" &&
echo "***** CREATE BY: NAT AT 2024-05-15T0855 *****" &&
echo "***** THIS SCRIPT WILL CLEARING REMOTE REPO *****" &&
echo "***** AND FETCH FRESH NEW REMOTE REPO INTO LOCAL DIR *****" &&

echo "##### check if it need to deleting existing clone dir or not #####" && 
rm -r -f ./$clone_dir_name ; 
echo "----- check if it need to delete old dir = pass -----" &&

echo "##### downloading clone dir old structure #####" &&
git clone $clone_link && 
cd ./$clone_dir_name && 
echo "----- cloning clone dir old structure successful -----" &&

echo "##### clearing files and folders in clone local repo #####" &&
git rm -rf '*' ; 
git commit -m "Delete all files & folders" ; 
echo "----- clearing local clone repo successful -----" &&

echo "##### clearing files and folders in clone remote repo #####" &&
git push ; 
echo "----- clearing remote clone repo successful -----" &&

echo "##### cleaning existing hidden .git in local dir #####" &&
rm -rf .git && 
echo "----- hidden .git in local dir deleted successful -----" &&

echo "##### cleaning local clone dir #####" &&
cd .. && 
rmdir ./$clone_dir_name &&
echo "----- clearing local clone dir successful -----" &&

echo "##### download remote template dir (bare) from remote repo #####" &&
git clone --bare $template_link && 
echo "----- download remote template dir (bare) successful -----" &&

echo "##### init mirroring #####"
echo "----- mirror from: template dir local repo -----" &&
cd $template_dir_name.git && 
echo "----- mirror to: clone dir remote repo -----" &&
git push --mirror $clone_link &&
echo "----- mirroring template dir local to clone dir remote successful -----" &&

echo "##### clearing unused local template dir #####" &&
cd .. && 
rm -rf $template_dir_name.git && 
echo "----- clearing unused local template dir successful -----" &&

echo "##### download fresh remote clone dir from remote repo #####" &&
git clone $clone_link && 
echo "***** clone-nat.sh script run successful! *****" &&

echo "##### run vs code #####" &&
cd ./$clone_dir_name &&  
code .
echo "***** exit script *****"
