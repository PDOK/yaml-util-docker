# yaml-util-docker

Docker image met [*Yamllint*](https://github.com/adrienverge/yamllint) en [*Prettier*](https://prettier.io/).

```sh
docker build . -t yaml-util
docker run yaml-util prettier   
docker run yaml-util yamllint
```

Wordt gebruikt in het PDOK/k8s-clusters configuratie repository voor de pre-commit githook.
