# helper function
# commit module to new repository
repoAdd () {
  cd ${1}
	git init
	git remote add origin git@${HOME_REPO_SERVER}:puppet-modules/${1}.git
	git add *
	git commit -m "Initial commit"
	git push --set-upstream origin master
  cd ..
}
