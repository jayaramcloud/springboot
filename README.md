# Springboot Java Container Creation

**Section 1: Ensure You can connect to the Kubernetes Cluster & create a namespace**

```
jayadmin@cloudshell:~ (kubetrain-331123)$ gcloud container clusters get-credentials virtusa-cluster --zone us-central1-c --project kubetrain-331123
Fetching cluster endpoint and auth data.
kubeconfig entry generated for virtusa-cluster.
jayadmin@cloudshell:~ (kubetrain-331123)$ kubectl get nodes
NAME                                             STATUS   ROLES    AGE   VERSION
gke-virtusa-cluster-default-pool-808e0d91-1fz0   Ready    <none>   17h   v1.21.5-gke.1302
gke-virtusa-cluster-default-pool-808e0d91-hpdj   Ready    <none>   17h   v1.21.5-gke.1302
gke-virtusa-cluster-default-pool-808e0d91-mb7b   Ready    <none>   17h   v1.21.5-gke.1302
jayadmin@cloudshell:~ (kubetrain-331123)$ kubectl get pods -A
NAMESPACE     NAME                                                        READY   STATUS    RESTARTS   AGE
kube-system   event-exporter-gke-5479fd58c8-hdscl                         2/2     Running   0          17h
kube-system   fluentbit-gke-7xsx5                                         2/2     Running   0          17h
kube-system   fluentbit-gke-927q4                                         2/2     Running   0          17h
kube-system   fluentbit-gke-fqpwr                                         2/2     Running   0          17h
kube-system   gke-metrics-agent-br8xf                                     1/1     Running   0          17h
kube-system   gke-metrics-agent-gvmvx                                     1/1     Running   0          17h
kube-system   gke-metrics-agent-zdnlb                                     1/1     Running   0          17h
kube-system   konnectivity-agent-autoscaler-5c49cb58bb-8mjfg              1/1     Running   0          17h
kube-system   konnectivity-agent-f76cf667b-dcjz5                          1/1     Running   0          17h
kube-system   konnectivity-agent-f76cf667b-dmwn9                          1/1     Running   0          17h
kube-system   konnectivity-agent-f76cf667b-kxsg6                          1/1     Running   0          17h
kube-system   kube-dns-697dc8fc8b-lvwrt                                   4/4     Running   0          17h
kube-system   kube-dns-697dc8fc8b-s2z9p                                   4/4     Running   0          17h
kube-system   kube-dns-autoscaler-844c9d9448-h8z68                        1/1     Running   0          17h
kube-system   kube-proxy-gke-virtusa-cluster-default-pool-808e0d91-1fz0   1/1     Running   0          17h
kube-system   kube-proxy-gke-virtusa-cluster-default-pool-808e0d91-hpdj   1/1     Running   0          17h
kube-system   kube-proxy-gke-virtusa-cluster-default-pool-808e0d91-mb7b   1/1     Running   0          17h
kube-system   l7-default-backend-865b4c8f8b-pwvv5                         1/1     Running   0          17h
kube-system   metrics-server-v0.4.4-857776bc9c-p9s78                      2/2     Running   0          17h
kube-system   pdcsi-node-qhcm7                                            2/2     Running   0          17h
kube-system   pdcsi-node-rjrss                                            2/2     Running   0          17h
kube-system   pdcsi-node-sjjj5                                            2/2     Running   0          17h
jayadmin@cloudshell:~ (kubetrain-331123)$ kubectl get namespace
NAME              STATUS   AGE
anurag            Active   17h
default           Active   17h
jagadish          Active   16h
jaywant           Active   17h
jyothi            Active   16h
karimulla         Active   17h
kube-node-lease   Active   17h
kube-public       Active   17h
kube-system       Active   17h
mulayam           Active   16h
narayana          Active   16h
nikhil            Active   17h
ramesh            Active   16h
sathish           Active   17h
vinod             Active   16h
vishnavi          Active   17h
```
Create YOUR namespace here ` kubectl create namespace YOURNAME`
```
jayadmin@cloudshell:~ (kubetrain-331123)$ kubectl create namespace jayaram

namespace/jayaram created
jayadmin@cloudshell:~ (kubetrain-331123)$ kubectl get namespace                                                                                                                  
NAME              STATUS   AGE
anurag            Active   17h
default           Active   17h
jagadish          Active   16h
jayaram           Active   4s
jaywant           Active   17h
jyothi            Active   16h
karimulla         Active   17h
kube-node-lease   Active   17h
kube-public       Active   17h
kube-system       Active   17h
mulayam           Active   16h
narayana          Active   16h
nikhil            Active   17h
ramesh            Active   16h
sathish           Active   17h
vinod             Active   16h
vishnavi          Active   17h
```

**Section 2: Get the Java code and Build it to helloworld.jar**

```
jayadmin@cloudshell:~ (kubetrain-331123)$git clone https://github.com/jayaramcloud/springboot.git
jayadmin@cloudshell:~ (kubetrain-331123)$cd springboot/
jayadmin@cloudshell:~ (kubetrain-331123)$cat Docker
jayadmin@cloudshell:~ (kubetrain-331123)$mvn clean package
---------------------
Downloaded from central: https://repo.maven.apache.org/maven2/org/springframework/session/spring-session-bom/Bean-SR6/spring-session-bom-Bean-SR6.pom (3.0 kB at 135 kB/s)
[INFO] 
[INFO] ------------------< io.kubetrain.tutorial:helloworld >------------------
[INFO] Building helloworld 1.0
[INFO] --------------------------------[ jar ]---------------------------------
Downloading from central: https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-maven-plugin/2.1.6.RELEASE/spring-boot-maven-plugin-2.1.6.RELEASE.pom
Downloaded from central: https://repo.maven.apache.org/maven2/org/springframe
---------------------------------

Downloaded from central: https://repo.maven.apache.org/maven2/com/google/guava/guava/19.0/guava-19.0.jar (2.3 MB at 2.9 MB/s)
[INFO] Replacing main artifact with repackaged archive
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  21.162 s
[INFO] Finished at: 2021-12-01T20:48:00Z
[INFO] ------------------------------------------------------------------------

jayadmin@cloudshell:~/springboot$ ls
Dockerfile  README.md  pom.xml  src  target
jayadmin@cloudshell:~/springboot$ cd target/;ls
classes  generated-sources  helloworld.jar  helloworld.jar.original  maven-archiver  maven-status
jayadmin@cloudshell:~/springboot/target$ ls -al
total 16428
drwxr-xr-x 6 jayadmin jayadmin     4096 Dec  1 20:48 .
drwxr-xr-x 5 jayadmin jayadmin     4096 Dec  1 20:47 ..
drwxr-xr-x 3 jayadmin jayadmin     4096 Dec  1 20:47 classes
drwxr-xr-x 3 jayadmin jayadmin     4096 Dec  1 20:47 generated-sources
-rw-r--r-- 1 jayadmin jayadmin 16792328 Dec  1 20:48 helloworld.jar
-rw-r--r-- 1 jayadmin jayadmin     3592 Dec  1 20:47 helloworld.jar.original
drwxr-xr-x 2 jayadmin jayadmin     4096 Dec  1 20:47 maven-archiver
drwxr-xr-x 3 jayadmin jayadmin     4096 Dec  1 20:47 maven-status
jayadmin@cloudshell:~/springboot/target$ cd ..;ls
Dockerfile  README.md  pom.xml  src  target

```

**Section 3a: Login to Docker & Build the docker file locally**

```
jayadmin@cloudshell:~/springboot$ cat Dockerfile
FROM openjdk:8-jdk-alpine 
# Refer to Maven build -> finalName 
WORKDIR /opt/app 
COPY target/helloworld.jar app.jar 
# java -jar /opt/app/app.jar 
ENTRYPOINT ["java","-jar","app.jar"] 

```
Ask Jayaram for the dockerhub login password
```

jayadmin@cloudshell:~/springboot$ docker login --username kubetrain
Password:
WARNING! Your password will be stored unencrypted in /home/jayadmin/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

```
Tag with YOUR name here. for example: `docker build -t kubetrain/springboot-demo-YOURNAME:v0.1 .`
```
jayadmin@cloudshell:~/springboot$ docker build -t kubetrain/springboot-demo-jayaram:v0.1 . 
Sending build context to Docker daemon  16.92MB
Step 1/4 : FROM openjdk:8-jdk-alpine
8-jdk-alpine: Pulling from library/openjdk
e7c96db7181b: Pull complete 
f910a506b6cb: Pull complete 
c2274a1a0e27: Pull complete 
Digest: sha256:94792824df2df33402f201713f932b58cb9de94a0cd524164a0f2283343547b3
Status: Downloaded newer image for openjdk:8-jdk-alpine
 ---> a3562aa0b991
Step 2/4 : WORKDIR /opt/app
 ---> Running in 187f800c07cc
Removing intermediate container 187f800c07cc
 ---> 46070ad2c79f
Step 3/4 : COPY target/helloworld.jar app.jar
 ---> 4b81c256ca04
Step 4/4 : ENTRYPOINT ["java","-jar","app.jar"]
 ---> Running in 98f4a6098b22
Removing intermediate container 98f4a6098b22
 ---> b0c0de18a9e5
Successfully built b0c0de18a9e5
Successfully tagged kubetrain/springboot-demo-jayaram:v0.1
  
  
  ```

**Section 3b: Start the docker container locally and access it with curl command**

```
jayadmin@cloudshell:~/springboot (kubetrain-331123)$ docker run -p  8081:8081 kubetrain/springboot-demo-jayaram:v0.1                                                                                                                              
Unable to find image 'kubetrain/springboot-demo-jayaram:v0.1' locally
v0.1: Pulling from kubetrain/springboot-demo-jayaram
e7c96db7181b: Pull complete
f910a506b6cb: Pull complete
c2274a1a0e27: Pull complete
ce9558e19762: Pull complete
790e725d72ff: Pull complete
Digest: sha256:6ce436a7b88dbcd7e2e15c89f97719a4a78b1c42d97107b20e3f476a7aacf155
Status: Downloaded newer image for kubetrain/springboot-demo-jayaram:v0.1

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.1.6.RELEASE)

2021-12-01 21:49:01.269  INFO 1 --- [           main] io.kubetrain.tutorial.AppStart           : Starting AppStart v1.0 on ef549877592f with PID 1 (/opt/app/app.jar started by root in /opt/app)
2021-12-01 21:49:01.274  INFO 1 --- [           main] io.kubetrain.tutorial.AppStart           : No active profile set, falling back to default profiles: default
2021-12-01 21:49:03.071  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8081 (http)
2021-12-01 21:49:03.139  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2021-12-01 21:49:03.140  INFO 1 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.21]
2021-12-01 21:49:03.317  INFO 1 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2021-12-01 21:49:03.318  INFO 1 --- [           main] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 1981 ms
2021-12-01 21:49:03.674  INFO 1 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
2021-12-01 21:49:04.098  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8081 (http) with context path ''
2021-12-01 21:49:04.108  INFO 1 --- [           main] io.kubetrain.tutorial.AppStart           : Started AppStart in 3.596 seconds (JVM running for 4.165)


#Open another shell and see if you can curl:

jayadmin@cloudshell:~ (kubetrain-331123)$ curl http://localhost:8081
Hello World! Welcome to the World of ...

```

**Section 4: Push it to Dockerhub**

```
jayadmin@cloudshell:~/springboot$ docker push  kubetrain/springboot-demo-jayaram:v0.1 
The push refers to repository [docker.io/kubetrain/springboot-demo-jayaram]
f51a1c0d8709: Pushed 
7125f16a6d7e: Pushed 
ceaf9e1ebef5: Mounted from library/openjdk 
9b9b7f3d56a0: Mounted from library/openjdk 
f1b5933fe4b5: Mounted from library/openjdk 
v0.1: digest: sha256:6ce436a7b88dbcd7e2e15c89f97719a4a78b1c42d97107b20e3f476a7aacf155 size: 1366


# Visist https://hub.docker.com/repositories and login as kubetrain and check if the new image has appeared.
```
