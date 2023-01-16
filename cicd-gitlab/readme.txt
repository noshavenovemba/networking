sudo gitlab-runner register -n \
  --url https://gitlab.com/ \
  --registration-token REGISTRATION_TOKEN \
  --executor shell \
  --description "My Runner"

sudo usermod -aG docker gitlab-runner

sudo -u gitlab-runner -H docker info

nano .gitlab-ci.yml

before_script:
  - docker info

build_image:
  script:
    - docker build -t my-docker-image .
    - docker run my-docker-image /script/to/run/tests

submodules - allow you to keep a git repository as a subdirectory of another git repository

git init
git status
git add .
git commit
git remote add origin https://...
git push --set-upstream origin main

git clone

git branch mybranch // create branch
git checkout mybranch // switch to branch

git pull // download changes
git fetch // tracks that changes exist

git diff // what diff before merge
git merge mybrach // merge branches

git stash push // hide change
git stash list // all stash list
git stash apply 

git log - find ID of commit
git reset -  moving the current head of the branch back to the specified  tcommit, thereby changing the commit history
git reset HEAD~1
git revert - creating a new commit that undoes the changes in the specified commit and so does not change the history


gitlab extend // template creation
project // container for a git repository
member // user with access
issue // track work in projects, what should be done - [] Hi 
merge request // 
runner // execute job (agent in jenkins)

branching strategy // 



gitlab group // group of users to manages multiple projects
tools in jenkins vs dockerimages in gitlab
package registries //

brew services start gitlab-runner

--- push docker image to gitgitlab registry ---
1. docker pull nginx
2. docker tag nginx registry.gitlab.com/noshavenovemba/pushdockerfile/nginx:latest
3. docker login registry.gitlab.com
4. commit
5. docker push registry.gitlab.com/noshavenovemba/pushdockerfile/nginx:latest

--- quick actions --- // merge requests, issues, /title My new title
