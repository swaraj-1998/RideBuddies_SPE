FROM tomcat
ENV dbDriver=com.mysql.jdbc.Driver dbConnectionUrl=jdbc:mysql://mysqldb-container:3306/RideBuddies dbUserName=root dbPassword=root
COPY ./target/RideBuddies-1.0-SNAPSHOT.war /usr/local/tomcat/webapps