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

git branch mybranch // create branch

git checkout mybranch // switch to branch

git status

git log - find ID of commit

git add testfile.txt

git merge mybrach // merge branches

git reset -  moving the current head of the branch back to the specified commit, thereby changing the commit history

git revert - creating a new commit that undoes the changes in the specified commit and so does not change the history

gitlab extend // template creation
