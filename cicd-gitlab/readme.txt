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
