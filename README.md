# simple-cicd-pipeline-with-spring
A very basic, single server, zero downtime continuous integration pipeline for Java Spring MVC. Uses Ansible for provisioning.

## Prove it?
Prerequisites:
- Ansible
- Vagrant (for local validation)
- Maven
- Java

1. clone repo
```
$ git clone https://github.com/nfisher23/simple-cicd-pipeline-with-spring.git
```
2. spin up local VM
```
$ vagrant up
```
3. add remote to local VM
```
$ git remote add local_vagrant root@192.168.56.121:/srv/git/site.git
```
4. Push release branch
```
$ git push local_vagrant release
```
5. Boom.

## More info
See blog post: [A Simple Zero Downtime Continuous Integration Pipeline for Spring MVC](https://nickolasfisher.com/blog/A-Simple-Zero-Downtime-Continuous-Integration-Pipeline-for-Spring-MVC).
