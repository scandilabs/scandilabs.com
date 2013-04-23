<div id="intro"></div>
# Introduction
Welcome to the ScandiLabs Java tutorial!   

Please note we are constantly adding topics to this tutorial, it was last updated on April 22, 2013.  If you don't find what you're looking for, check back soon.  

You can also review the <a href="/faqs">knowledge base</a> and our sample applications at <a href="https://github.com/scandilabs/scandilabs-apps">github</a>. 

# Table of Contents
1. [Setup](#setup)
1. [HTML Templates and MVC](#mvc)
1. [Persistence and Command Line Scripts](#persistence)
1. Forms
1. Validation, Messages
1. AJAX / jQuery
1. Security and Sessions
1. Email
1. Background Tasks

<div id="setup"></div>
# Setup <span class="tutorialNav">(<a href="#intro">top</a>)</span>
The steps below will get your initial web application up and running.

#### Tomcat, Maven
To get started, you will need Java, Tomcat, Maven and Git (optional) installed on your local workstation.  

Head over to the [workstation setup](/faq?key=ScandiLabs_Java_Deve) section of our [knowledge base](/faqs) if you're not sure if these tools are installed on your system.  

#### Download Hello World Webapp
Next, you'll need to download a bare-bones web application from github.  While you can install it anywhere, we recommend you create a new top-level directory named <code>/sl/apps</code>.  Then check out the code with this command:

    git clone git@github.com:scandilabs/hello-world.git
    
> NOTE: If the 'git clone' command doesn't work, you can just download the application 
> [as a zip-file](https://github.com/scandilabs/hello-world/zipball/master) for now.  Unzip it into <code>/sl/apps/hello-world</code>  

PERMISSIONS: Depending on your operating system you may need to give yourself file permissions to the new top-level <code>/sl</code> directory:

    mkdir /sl
    chown [userName] /sl

When you're done, verify that there is a file named <code>manage.sh</code> in your <code>/sl/apps/hello-world</code> directory.  If not then re-check your steps above or move your files around so that they match this directory structure.

#### manage.sh
Now we just need to tell the <code>manage.sh</code> script where to find your local tomcat installation.  On a Mac or Unix/Linux system, the easiest way is to create a symlink:

    cd /sl/apps/hello-world
    ln -s /sl/apache-tomcat-7.0.34/ tomcat  # Note use your own apache tomcat version number 
    
If you don't want to use symlinks, you can also set the LOCAL\_TOMCAT\_BIN\_DIR and LOCAL\_TOMCAT\_WEBAPPS\_DIR script variables near the top of the <code>manage.sh</code> script.
     
> WINDOWS: If you are on a Windows system, the manage.sh configuration script won't work unless you [install Cygwin](http://www.cygwin.com/install.html).  You can still follow this tutorial if you ignore references to the <code>manage.sh</code> script and use "normal" tomcat and maven commands instead.    

Next, you may need to make the management script executable:

    cd /sl/apps/hello-world
    chmod u+x manage.sh
    
Try to run the management script: 

    cd /sl/apps/hello-world
    ./manage.sh 
    
If everything is well you should get a response like this:

    [manage.sh] Running command '' ..
    Usage: manage.sh command [arg1]
    Valid commands are:
      run           (starts tomcat with visible log output and no remote debugger support)
      rerun         (builds then starts tomcat with visible log output and no remote debugger support)
      start         (starts tomcat with remote debugger port)
      stop          (stops tomcat)
      restart       (stops, builds, then starts tomcat with remote debugger port)
      build         (compiles java and builds webapp with local web symlinks)
      clean         (removes local web symlinks and does maven clean which removes /target)
      build-war     (compiles java, builds webapp with no symlinks)
      deploy [srv]  (build-war, scp war to server)
      status        (shows any running java processes matching current project name)
      status-java   (shows all running java processes)
     
    manage.sh is using these settings (edit file manage.sh if this doesn't look right):
        PROJECT_NAME: hello-world
        PROJECT_HOME: /sl/apps/hello-world
        LOCAL_WEBAPP_DIR: /sl/apps/hello-world/target/my-app-1.0.0
        LOCAL_TOMCAT_BIN_DIR: /sl/apps/hello-world/tomcat/bin
        LOCAL_TOMCAT_WEBAPPS_DIR: /sl/apps/hello-world/tomcat/webapps
        LOCAL_WEBAPP_NAME: ROOT
        REMOTE_WEBAPP_NAME: ROOT
        REMOTE_TOMCAT_WEBAPPS_DIR: /var/lib/tomcat7/myapps
 
#### Start Tomcat
Now let's try to start Tomcat.  Watch the console output closely for any errors:

    ./manage.sh run
    
You should see something like this in your console window:

    [manage.sh] Running command 'run' ..
    Using CATALINA_BASE:   /sl/apps/hello-world/tomcat
    Using CATALINA_HOME:   /sl/apps/hello-world/tomcat
    Using CATALINA_TMPDIR: /sl/apps/hello-world/tomcat/temp
    Using JRE_HOME:        /System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
    Using CLASSPATH:       /sl/apps/hello-world/tomcat/bin/bootstrap.jar:/sl/apps/hello-world/tomcat/bin/tomcat-juli.jar
    Apr 9, 2013 2:08:47 PM org.apache.catalina.core.AprLifecycleListener init
    INFO: The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: .:/Library/Java/Extensions:/System/Library/Java/Extensions:/usr/lib/java
    Apr 9, 2013 2:08:48 PM org.apache.coyote.AbstractProtocol init
    INFO: Initializing ProtocolHandler ["http-bio-8080"]
    Apr 9, 2013 2:08:48 PM org.apache.catalina.startup.Catalina load
    INFO: Initialization processed in 647 ms
    ..
    ..
    Apr 9, 2013 2:08:48 PM org.apache.coyote.AbstractProtocol start
    INFO: Starting ProtocolHandler ["http-bio-8080"]
    Apr 9, 2013 2:08:48 PM org.apache.catalina.startup.Catalina start
    INFO: Server startup in 688 ms
    
    
> TIP: We suggest you make it a habit to clear the console window buffer before you start tomcat.  This will make it easier to scroll back up and find any error messages.  Use CMD-K on a Mac, type <code>clear</code> on Linux, or type <code>cls</code> on Windows.     
    
If you just installed tomcat, the default tomcat web application should now be running.  Try opening this link in your browser:[http://localhost:8080/](http://localhost:8080/).

Stop tomcat by pressing Ctrl-C.  

#### Prepare The hello-world Webapp
We don't need the default tomcat webapp, and we want _our_ webapp to take its place at TOMCAT\_HOME/webapps/ROOT.  

Move the existing TOMCAT\_HOME/webapps/ROOT to TOMCAT\_HOME/webapps/DEFAULT\_ROOT:

    cd /sl/apps/hello-world/tomcat/webapps
    mv ROOT DEFAULT_ROOT                    # Mac/Linux
    rename ROOT DEFAULT_ROOT                # Windows

We also need to tell tomcat to look for symlinks inside web apps.  Edit TOMCAT\_HOME/conf/context.xml and find the first tag that says <code><Context></code>.  Change it to:

    <Context allowLinking="true">

> WINDOWS: On Mac/Linux we use symlinks inside the TOMCAT_HOME/webapps/ROOT directory so that changes to freemarker html templates (.ftl files) and web files (.css, .js) are visible immediately.  However you can accomplish the same thing with xml configuration files under conf/Catalina/localhost (see [this stackoverflow answer](http://stackoverflow.com/questions/7276989/howto-set-the-context-path-of-a-web-application-in-tomcat-7-0/7706950#7706950)).     

Now we are almost ready to build.  We just need to make sure that maven (our compile-and-build tool) has access to all the Java libraries.  To do that, copy-paste the following into your <code>~/.m2/settings.xml</code> file (create it if you don't have it):

> WINDOWS: <code>~/.m2/settings.xml</code> is Unix shorthand for C:\\Documents and Settings\\[your\_username]\\.m2\\settings.xml
~~~
<settings>
  <profiles>
    <profile>
      <id>scandilabs-profile</id>
      <activation>
        <activeByDefault>true</activeByDefault>
      </activation>
      <repositories>
        <repository>
          <id>central</id>
          <url>http://repo1.maven.org/maven2</url>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
          <releases>
            <enabled>true</enabled>
          </releases>
        </repository>   
        <repository>
            <id>jboss-nexus</id>
            <url>http://repository.jboss.org/nexus/content/groups/public-jboss</url>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
            <releases>
              <enabled>true</enabled>
            </releases>
        </repository>  
        <repository>
          <id>scandilabs.maven</id>
          <url>http://maven.scandilabs.com/repository</url>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
      </repositories>
    </profile>
    <profile>
      <id>downloadSources</id>
      <activation>
        <activeByDefault>true</activeByDefault>
      </activation>            
      <properties>
        <downloadSources>true</downloadSources>
        <downloadJavadocs>true</downloadJavadocs>           
      </properties>
    </profile>      
  </profiles>
</settings>
~~~

#### Build the Webapp
Use the management script to build the hello-world web application:

    cd /sl/apps/hello-world
    ./manage.sh build
    
Watch the console for compilation errors.  

Start tomcat again:

    ./manage.sh run

If everything went well, [http://localhost:8080/](http://localhost:8080/) should now show "Hello world!" in green. 

Congrats.  You are now done with the setup stage, and ready to start developing your own application!

> TIP: If something went wrong, [search our knowledgebase](/faqs) for answers.  If you're still stuck, contact us [on twitter](https://twitter.com/scandilabs).


<div id="mvc"></div>
# HTML Templates and MVC <span class="tutorialNav">(<a href="#intro">top</a>)</span>
ScandiLabs Java uses [Freemarker](http://freemarker.org/) and [Spring MVC](http://static.springsource.org/spring/docs/3.2.x/spring-framework-reference/html/mvc.html) to handle HTML rendering and HTTP request handling (the "View" and "Controller" aspects of the [MVC](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) pattern).    

#### Passing a variable from Java to Freemarker

This the basic Freemarker HTML template we used to render the basic hello-world app:

<code>/sl/apps/hello-world/src/main/webapp/WEB-INF/freemarker-www/index.ftl</code>
~~~
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
    <link type="text/css" rel="stylesheet" href="/css/global.css" media="screen, projection">    
    <title>Hello World from ScandiLabs Java</title>
</head>
<body>
    <p>Hello world! <img src="/img/info-icon.png" /></p>
</body>
</html>
~~~

Right now it contains straight-up HTML.  

Now let's look at the Controller code that runs right before this Freemarker template is sent back to the browser:  

<code>/sl/apps/hello-world/src/main/java/myapp/web/VisitorController.java</code>
~~~
package myapp.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class VisitorController {

    private Logger logger = LoggerFactory.getLogger(VisitorController.class);

    @RequestMapping("/")
    public ModelAndView home(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        return index(request, response);
    }

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ModelAndView mv = new ModelAndView("index");
        return mv;
    }


}
~~~

Let's focus on the <code>public ModelAndView index(...)</code> method.  Right now it simply creates a new ModelAndView object:

    ModelAndView mv = new ModelAndView("index");
    
Spring MVC will look for a View (a freemarker template) that matches the name given to the ModelAndView object <code>("index")</code>.
> NOTE: If you don't specify a view name in the ModelAndView constructor, Spring MVC will use the PATH name specified in the HTTP GET request.  
>
> On the home page we specify the view name explicitly because the <code>home()</code> method above means PATH may be either <code>/</code> or <code>/index</code>.  

Now let's add a variable: 

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ModelAndView mv = new ModelAndView("index");
        String myName = "Lionel Messi";                // ADDED LINE
        mv.addObject("name", myName);                  // ADDED LINE
        return mv;
    }

Also add it to the Freemarker template:
    
    <body>
        <p>Hello ${name}! <img src="/img/info-icon.png" /></p>
    </body>
    
Since we modified the VisitorController Java code, we need to restart or redeploy our webapp to see the changes.  Stop tomcat with Ctrl-C and then re-build and re-start tomcat with this command:

    ./manage.sh rerun
    
> NOTE: Because of the symlinks in TOMCAT\_HOME/webapps/ROOT, tomcat does not need to be restarted if only the freemarker .FTL file is changed.   

<div id="persistence"></div>
# Persistence and Command Line Scripts <span class="tutorialNav">(<a href="#intro">top</a>)</span>
For persisting java objects to a database, we use [Hibernate](http://www.hibernate.org/) along with some additional conventions and tools to enable a [Domain-Driven Design](http://en.wikipedia.org/wiki/Domain-driven_design) style of programming.  This chapter will also demonstrate how to modify the database using a Java command-line program.

Before going any further, make sure you have MySQL installed on your local workstation.  Follow [these installation instructions](http://java.scandilabs.com/faq?key=How_to_install_MySQL) if you need help. 

#### Our first persistent object

Create a <code>User</code> class:
~~~
package myapp.entity;

import javax.persistence.Entity;

@Entity
public class User {
    
    private String userName;
    private String email;
    private boolean active;
    
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public boolean isActive() {
        return active;
    }
    public void setActive(boolean active) {
        this.active = active;
    }
}
~~~

Then let's create a simple script to populate a row in the database.  Copy and paste the code below into <code>CreateUser.java</code> into a new <code>src/main/java/myapp/shell</code> folder:  
~~~
package myapp.shell;

import myapp.entity.User;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.orm.hibernate4.HibernateTransactionManager;

public class CreateUser {

    /**
     * Run from command line
     * 
     * @param args
     */
    public static void main(String[] args) {

        ApplicationContext ctx = new FileSystemXmlApplicationContext(
                "/src/main/webapp/WEB-INF/applicationContext.xml");
        
        # Set up the transaction manager, start a transaction, and bind it to threadlocal
        HibernateTransactionManager tm = (HibernateTransactionManager) ctx.getBean("transactionManager");
        tm.getTransaction(null);

        # Simply instantiate a persistent object like any other object, and call save() to persist it to db 
        User user = new User();
        user.setActive(true);
        user.setEmail("mail@example.com");
        user.setUserName("userName");
        long id = user.save();
        System.out.println("Saved a new User with id: " + id);
        
        // Every persistent object comes with a built-in way to issue simple queries via a [PersistentClass].objects.[queryMethod] syntax
        User user2 = (User) User.objects.load(id);
        System.out.println("Loaded User by id, name is: " + user2.getUserName());
        
        // objects.all() returns all rows in a table
        List<User> allUsers = User.objects.all();
        User user3 = allUsers.iterator().next();
        System.out.println("First row in User table has name: " + user3.getUserName());
        
        // And objects.filter allows you to query by column value
        List<User> users = User.objects.filter("email", "mail@example.com");
        System.out.println("Found " + users.size() + " user(s) with email: mail@example.com");
    }
}
~~~

To run the script, type this maven command in your Terminal window:

    mvn compile exec:java -Dexec.mainClass="myapp.shell.CreateUser"

If all goes well, you should now be able to view a row in the newly created <code>User</code> table of a database called <code>my-catamaran</code>.  You can use the MySQL command line client or data browsing tools Sequelpro or Navicat.

If you have any problems, do a search in [our knowledge base](http://java.scandilabs.com/faqs) for the word [exception](http://java.scandilabs.com/faqs?query=exception).  Or copy-paste a portion of your log file stack trace into the search field.  If you still need help, [contact us](http://www.scandilabs.com/contact).

    
