#!/bin/bash
#ENTER git-playground-template remote repo LINK
template_link="git@github.com:kittha/html-css-git-mini-project-fsd6-lilac-group2.git"

#ENTER DIR name
#template dir name
#eg.github remote repo template link is "git@github.com:kittha/git-playground-template.git"
#then repository name is <git-playground-template> NO DOT GIT
template_dir_name="html-css-git-mini-project-fsd6-lilac-group2"



#ENTER git-playground-clone remote repo LINK; if dont have, then create new blank git remote repo (clone) link
sandbox_link="git@github.com:kittha/sandbox-git-playground-clone.git"

#ENTER clone DIR name
#eg.github remote repo clone link is "git@github.com:kittha/sandbox.git"
#then repository name is <sandbox> NO DOT GIT
sandbox_dir_name="sandbox-git-playground-clone"


echo "***** CLONE GITHUB PROD REMOTE REPO TO SANDBOX REPO SCRIPT V2 *****" &&
echo "***** CREATE BY: KITTHA AT 2024-05-15T1445 *****" &&

echo "***** THIS SCRIPT WILL CLEARING REMOTE REPO *****" &&
echo "***** AND FETCH FRESH NEW REMOTE REPO INTO LOCAL DIR *****" &&



echo "##### check if it need to deleting existing template dir or not #####" && 
rm -r -f ./$template_dir_name.git ; 
echo "----- check if it need to delete old template dir = pass -----" &&

echo "##### check if it need to deleting existing clone dir or not #####" && 
rm -r -f ./$sandbox_dir_name ; 
rm -r -f ./$sandbox_dir_name.git ; 
echo "----- check if it need to delete old clone dir = pass -----" &&



echo "##### downloading clone dir old structure #####" &&
git clone $sandbox_link && 
cd ./$sandbox_dir_name && 
echo "----- cloning clone dir old structure successful -----" &&

echo "##### clearing files and folders in clone local repo #####" &&
git rm -r -f '*' ; 
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
rmdir ./$sandbox_dir_name &&
echo "----- clearing local clone dir successful -----" &&



echo "##### download remote template dir (bare) from remote repo #####" &&
git clone --bare $template_link &&
echo "----- download remote template dir (bare) successful -----" &&

cd $template_dir_name.git &&
echo "set remote url origin; clearing remote upstream url;" &&
git remote set-url origin $sandbox_link &&
git remote rm upstream ;
echo "set up remote url origin; remote upstream successful" &&



echo "##### init mirroring #####" &&
echo "----- mirror to: clone dir remote repo -----" && 
git push --mirror $sandbox_link && 
echo "----- mirroring template dir local to clone dir remote successful -----" && 

echo "##### clearing unused local template dir #####" && 
cd .. &&  
rm -rf ./$template_dir_name.git &&  
echo "----- clearing unused local template dir successful -----" && 




echo "##### download fresh remote clone dir from remote repo #####" && 
git clone --mirror $sandbox_link &&  
echo "***** clone-gh-prod-to-sandbox-env-script.sh script run successful! *****" &&
#read


echo "##### run vs code #####" && 
cd ./$sandbox_dir_name &&   
code . ;
echo "***** exit script *****" 
