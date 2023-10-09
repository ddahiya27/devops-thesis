FROM anapsix/alpine-java
ADD payrollapp.jar /home/payrollapp.jar
CMD ["java","-jar","/home/myjar.jar"]