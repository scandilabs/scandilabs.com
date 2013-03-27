<!---
Standard syntax: 
http://daringfireball.net/projects/markdown/syntax
http://en.wikipedia.org/wiki/Markdown#Syntax_examples

Extra syntax (which our php parser uses):
http://michelf.ca/projects/php-markdown/extra/

GitHub:
http://github.github.com/github-flavored-markdown/

-->

# Introduction
Welcome to the ScandiLabs Java tutorial!

Please note we are constantly adding topics to this tutorial (it was last updated on 3/27/2013).  If you don't find what you're looking for, check back soon.  You can also revie the <a href="/faqs">knowledge base</a> and the sample applications at <a href="https://github.com/scandilabs/scandilabs-apps">github</a>. 

# Eclipse and Maven
First install [Eclipse IDE for Java Developers](http://www.eclipse.org/).  

Create a new Eclipse java project named `my-project`.  In the `/src` folder, create a new java class named `Hello.java` with this content:

    public class Hello {

        public static final void main(String[] args) {
            System.out.println("Hello world");
        }
    }

Run this java application from within Eclipse with the command "Run As - Java Application" and verify the program output in the "Console" vindow at the bottom.

Now we are going to "mavenize" my-project.  We start by creating a folder structure that is more maven-friendly.  Create the following folder structure under your project folder, either via the command line like we did below, or via the Eclipse file explorer on the left:

    mkdir src/main
    mkdir src/main/java
    mkdir src/main/java/com
    mkdir src/main/java/com/example
    mkdir src/main/java/com/example/myapp
    mkdir src/main/resources
    
> Use backslash ('\') instead of forward slash on Windows.

Then move Hello.java from 'src' to 'src/java/com/example/myapp'.  (You can drag-and-drop it in the Eclipse file explorer.)  Verify that a package declaration gets added to the top of the file:

    package com.example.myapp;
    
Now we have a basic maven folder structure, and it's time to check if maven is installed.  Type "mvn -version".  The response should start with something like this:

    Apache Maven 3.0.3 (r1075438; 2011-02-28 12:31:09-0500)
    
If your maven version is lower than 3.0.3 then we suggest you [upgrade](http://maven.apache.org/).
        
If you get "command not found" then [download and install](http://maven.apache.org/).  

> NOTE: After installing, you may need to open a new command line window (Mac: "Terminal", windows "Command Prompt") to see the correct version number.

After maven is properly installed, create a file named "pom.xml" in the project folder.  Make it look something like this:

    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
      <modelVersion>4.0.0</modelVersion>
      <groupId>com.example.myapp</groupId>
      <artifactId>my-project</artifactId>
      <packaging>war</packaging>
      <version>1.0</version>
      
      <dependencies>
      
        <!-- Spring MVC web framework with Catamaran extensions --> 
        <dependency>
          <groupId>org.catamarancode</groupId>
          <artifactId>catamaran-mvc</artifactId>
          <version>1.0</version>
        </dependency>
        
        <!-- Hibernate object/relational database framework with Catamaran extensions -->
        <dependency>
          <groupId>org.catamarancode</groupId>
          <artifactId>catamaran-entity</artifactId>
          <version>2.0-SNAPSHOT</version>
        </dependency>    
        
        <dependency>
          <groupId>net.sf.json-lib</groupId>
          <artifactId>json-lib</artifactId>
          <version>2.3</version>
          <classifier>jdk15</classifier>
        </dependency>   
    
        <dependency>
          <groupId>junit</groupId>
          <artifactId>junit</artifactId>
          <version>3.8.1</version>
          <scope>test</scope>
        </dependency>
    
        <dependency>
            <groupId>servletapi</groupId>
            <artifactId>servletapi</artifactId>
            <version>2.4</version>
            <scope>provided</scope>
        </dependency>
        
      </dependencies>

    </project> 

> NOTE: Depending on your edition, Eclipse may open your pom.xml file with a "special" editor.  
If you don't like that, you can right-click pom.xml in the left file explorer and select 
"Open With - Text Editor".
      
Then let maven modify your Eclipse project settings with:

    mvn eclipse:eclipse
    
This will cause maven to modify the .project and .classpath files that Eclipse uses.  Refresh (F5) your Eclipse project to re-load the new configuration. 

> NOTE: You may need to clean your project in order to make Eclipse work correctly with the moved file.  Try these steps:

1. Run 'mvn clean' and then 'mvn eclipse:eclipse' again
2. Use Eclipse - Project - Clean to clean your project
3. Delete all files and folders under my-project/bin

You should now be able to verify your maven project by running Hello.java from maven:

    mvn exec:java -Dexec.mainClass="com.example.myapp.Hello"

If the output ends with something like this then you're all set.  

    Downloaded: http://repo1.maven.org/maven2/org/apache/commons/commons-exec/1.1/commons-exec-1.1.jar (52 KB at 754.6 KB/sec)
    Hello world
    [INFO] ------------------------------------------------------------------------
    [INFO] BUILD SUCCESS
    [INFO] ------------------------------------------------------------------------
    [INFO] Total time: 2.554s
    [INFO] Finished at: Wed Dec 26 13:38:45 EST 2012
    [INFO] Final Memory: 5M/81M
    [INFO] ------------------------------------------------------------------------
    
If not then check the FAQs or pose a question at the [Catamaran FAQ](http://faq.catamaranframework.org/).
    

# Running Tomcat

Next we will make our Hello example run as a web application.  Start by installing [Tomcat 7](http://daringfireball.net/projects/markdown/syntax) if you haven't done so already.  On a Mac, we recommend you install it like this:

    mkdir /catamaran
    mkdir /catamaran/apps
    mkdir /catamaran/apps/my-project
    cd /catamaran/apps/my-projects
        mkdir /catamaran
    mkdir /catamaran/apps
    tar -xf /[your_downloads_folder]/apache-tomcat-7.x.xx.tar.gz
    ln -s apache-tomcat-7.x.xx tomcat

For easier starting, stopping, and building we recommend you download and save the standard catamaran ['manage.sh'](https://raw.github.com/catamaran/catamaran-framework/master/catamaran-scripts/manage.sh) script into your project folder.  

Remember to make sure you can execute it:

    chmod u+x manage.sh 

Review the usage options ('start', 'stop', 'build', etc) and verify that the script settings look correct: 

    ./manage.sh 
    
Try to start Tomcat, and watch for any errors:

    ./manage.sh run
    
If you installed tomcat in /catamaran/apps/my-project/tomcat you should now see tomcat in a [browser](http://localhost:8080/).     
    
If manage.sh can't find your tomcat files you may see something like this:

    CATAMARAN manage.sh: Running command 'run' ..
    ./manage.sh: line 84: cd: /catamaran/apps/my-project/tomcat/bin: No such file or directory
    ./manage.sh: line 85: ./catalina.sh: No such file or directory
    CATAMARAN manage.sh: Finished command run 

To fix this, open the script in your favorite text editor and edit the variables LOCAL_TOMCAT_BIN_DIR and LOCAL_TOMCAT_WEBAPPS_DIR.  

When all is well and you can see the default tomcat app at http://localhost:8080 then it's time to 'webify' our application and deploy it to tomcat.

# Making a WEBAPP

To convert your project into a web application we will rely heavily on the Spring Framework, and specifically [Spring MVC](http://blog.springsource.com/2011/01/04/green-beans-getting-started-with-spring-mvc/).

First we need to create some more folders for our webapp files:

    # in my-project:
    mkdir src/main/webapp
    mkdir src/main/webapp/WEB-INF

Then create new file 'web.xml' under WEB-INF with settings that tell Tomcat to delegate web requests to the Spring MVC servlet:

    <!DOCTYPE web-app PUBLIC
     "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
     "http://java.sun.com/dtd/web-app_2_3.dtd" >
    
    <web-app>
      <display-name>My Web Application</display-name>
      
        <!-- Configures Spring on application startup.  Requires servlet api 2.4 or higher (tomcat 5.x is ok) 
            See http://www.springframework.org/docs/reference/webintegration.html -->
        <listener>
            <listener-class>
                org.springframework.web.context.ContextLoaderListener</listener-class>
        </listener>
        
        <!-- Spring MVC servlet.  The name 'spring-mvc' will cause Spring MVC to look for file /WEB-INF/spring-mvc-servlet.xml -->
        <servlet>
            <servlet-name>spring-mvc</servlet-name>
            <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
            <load-on-startup>1</load-on-startup>
        </servlet>
    
        <!-- This defaults all requests (including *.json) to spring mvc --> 
        <servlet-mapping>
            <servlet-name>spring-mvc</servlet-name>
            <url-pattern>/</url-pattern>
        </servlet-mapping>
        
        <welcome-file-list>
            <welcome-file>index</welcome-file>
        </welcome-file-list>
    
    </web-app>
    
Configure Spring MVC by creating 'spring-mvc-servlet.xml' inside WEB-INF:

    <?xml version="1.0" encoding="UTF-8"?>
    <beans xmlns="http://www.springframework.org/schema/beans"
     xmlns:mvc="http://www.springframework.org/schema/mvc"  
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:p="http://www.springframework.org/schema/p"
     xmlns:context="http://www.springframework.org/schema/context"
     xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/mvc
        http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context.xsd ">
    
        <!-- Tells Spring MVC where to look for controller classes marked with an @Controller annotation -->
        <context:component-scan base-package="com.example.myapp"/>
        
    </beans>
    
Also, let's add a default applicationContext.xml file in WEB-INF, even though we're not using any application services yet (Spring won't load without it):

    <?xml version="1.0" encoding="UTF-8"?>
    <beans xmlns="http://www.springframework.org/schema/beans"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:p="http://www.springframework.org/schema/p"
     xmlns:context="http://www.springframework.org/schema/context"
     xsi:schemaLocation="http://www.springframework.org/schema/beans
     http://www.springframework.org/schema/beans/spring-beans.xsd
     http://www.springframework.org/schema/context
     http://www.springframework.org/schema/context/spring-context.xsd ">
    
    <!-- This is the main Spring Framework configuration file.  It works in conjunction with 
    spring-mvc-servlet.xml to configure Spring-configured objects (beans).  
    applicationContext.xml is the default file loaded by org.springframework.web.context.ContextLoaderListener.  
    To split configuration across multiple spring files, consult web.xml -->
    
    </beans>

Now we just have to turn Hello.java from a command-line class into a Spring MVC controller class.  Start by adding a @Controller annotation before the class definition:

    @Controller
    public class MainController { 

Then turn our static main() method into a regular java method: 

    package com.example.myapp;
    
    import java.io.IOException;
    
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    
    import org.springframework.web.bind.annotation.RequestMapping;
    
    @Controller
    public class Hello {
    
        @RequestMapping(value = "/")
        public void main(HttpServletRequest request, HttpServletResponse response) throws IOException {
            response.getWriter().write("Hello world");
        }
    }

Note the two java annotations: @Controller on the class and @RequestMapping on the main method.  This tells Spring MVC to execute our main() method whenever a request comes in for the default '/' path.
    
Before running our webapp, let's move the default tomcat ROOT webapp out of the way since our new webapp will take it's place:

    mv /catamaran/apps/my-project/tomcat/webapps/ROOT /catamaran/apps/my-project/tomcat/webapps/DEFAULT_ROOT     
    
> NOTE: The above step is not necessary if you changed the LOCAL_WEBAPP_NAME variable in manage.sh to a name other than ROOT

Now stop Tomcat, build the webapp, and start Tomcat again:

    ./manage.sh stop
    ./manage.sh build
    ./manage.sh run
    
> NOTE: Instead of 'manage.sh run' you can also use the 'manage.sh start' command.  The downside is that 'start' does not show the tomcat log output in the same console.  The upside is that you can use "manage.sh rebuild" to stop, build, and start in one command.

Now access [http://localhost:8080/](http://localhost:8080/) again and you should see the output from Hello.java.

> NOTE: If the above doesn't work, it is likely that tomcat logs do not show much useful information that can help you troubleshoot.  To enable more verbose logging, scroll down this tutorial to the section that deals with log4j / slf4j logging and read about how to add a log4j.properties file.



## Maven Source Folder Tree
    
    # note: use backslash ('\') on windows
    mkdir src
    mkdir src/java
    mkdir src/java/com
    mkdir src/java/com/example
    mkdir src/java/com/example/myapp
    mkdir src/java/com/example/myapp/entity
    mkdir src/java/com/example/myapp/service
    mkdir src/java/com/example/myapp/web
    mkdir src/java/com/example/myapp/web/support
    mkdir src/resources
    mkdir src/webapp
    mkdir src/webapp/WEB-INF
    mkdir src/webapp/WEB-INF/freemarker-www
    mkdir src/webapp/static
    mkdir src/webapp/static/css
    mkdir src/webapp/static/img
    mkdir src/webapp/static/js
    
    
 
