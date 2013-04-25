<div id="intro"></div>
# Introduction
This is a tutorial for developers who want a quick and easy-to-use guide to creating Web Applications with Java.  

While Java has some of the most powerful and proven web technologies out there, its enterprise roots and toolkit diversity can pose a challenge to a small team that needs to get up and running quickly.   

This guide, along with our <a href="/faqs">knowledge base</a>, helps our own developers to write scalable Java applications quickly and in a consistent high-quality style.  Feel free to use it, and [let us know](http://www.scandilabs.com/contact) if you'd like to contribute.

# Table of Contents
1. [Setup](#setup)
1. [HTML Templates and MVC](#mvc)
1. [Persistence and Command Line Scripts](#persistence)
1. [Forms](#forms)
1. [Validation and Messages](#validation)
1. [AJAX and jQuery](#ajax)
1. [Services](#services)
1. [Security and Sessions](#security)
1. [Email](#email)
1. [Background Tasks](#background)

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

<div id="forms"></div>
# Forms <span class="tutorialNav">(<a href="#intro">top</a>)</span>
In this section we will elaborate on Spring MVC support for web forms and show several good patterns to follow.

#### A note about Controller classes
Developers who work with Spring MVC may be forgiven for being confused about when to create a new Controller class and when to just add a method with a @RequestMapping annotation to an existing controller.

The problem with creating a new Controller class every time is that you end up with lots of classes.  The problem with having just one single Controller class is that you end up with too many methods (and thus too much code in one Java class).  We recommend following these simple guidelines:

- A form (i.e. POST request handler) always gets its own Controller class, with a name that ends in "FormController".  This makes it easy to group related methods with it (edit, delete, read) and it also makes it easy to configure field mappings and any other Spring MVC features that may be specific to one form.
- GET request handler methods that are NOT directly/logically tied to a FormController are generally grouped into one Controller class per user type ("Actor").  For instance, you may have a VisitorController (for unauthenticated users), a AuthenticatedUserController (for authenticated users with no special admin role), and an AdminUserController (for authenticated users that have special admin privileges and/or are members of an Admin role).  This grouping makes it easy to create and enforce security checks that are specific to a specific type of users.  For instance, every method in AuthenticatedUserController may call a helper method that verifies that the current user's session contains a valid user object. 
- Login/logout usually gets it's own controller with a login (or signin) method and a logout (or signout) method        

#### Complete RESTful CRUD (create, read, update, delete) method of handling forms

Let's dive into forms by first creating a FormController for the entity (User) we created above in the myapp.web package:

<code>myapp/web/UserFormController.java</code>
~~~
package myapp.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/users")
public class UserFormController {

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(Map<String, Object> model) {
        User user = new User();
        model.put("user", user);
        return "user-edit";
    }

}
~~~      

This will map the create method to the /users/create request path.  The create method will then instantiate a new User object and pass it along as a model object to the "user-edit" freemarker template.

user-edit.ftl might look something like this:

~~~
<#import "/spring.ftl" as spring />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
</head>
<body>
    <form action="<@spring.url '/users/save' />" method="POST">
        <#if user.id??>
            <@spring.formHiddenInput "user.id" />
        </#if>
        <div>  
            <label for="userName">User Name</label>
            <@spring.formInput "user.userName"/>
        </div>
        <div>          
            <label for="email">Email</label>             
            <@spring.formInput "user.email"/>
        </div>
        <div>
            <label for="button"></label>
            <input type="submit" value="Save" />
        </div>  
    </form>
</body>
</html>
~~~

As you can probably guess, the html form above will need a "save" request path handler in order to work.  Let's it to UserFormController, and let's add a basid read (or view) method while we're at it:

~~~

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("user") User user, 
            BindingResult errors, Map<String, Object> model) {
        long id = person.save();
        return "redirect:" + id;
    }
    
    @RequestMapping(value = "/{userId}", method = RequestMethod.GET)
    public String view(@PathVariable long userId,
            Map<String, Object> model) {
        User user = (User) User.objects.load(userId);
        model.put("user", user);
        return "user-view";
    }
~~~

Finally let's create user-view.ftl and then we'll be done with the entire create-view flow:

~~~
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
</head>
<body>
    <h1>${user.userName}</h1>
    <p>Email: ${user.email}</p>
</body>
</html>    
~~~

Now we're ready to restart tomcat and create a new user by pointing our browser to http://localhost:8080/users/create

  
<div id="validation"></div>
# Validation and Messages <span class="tutorialNav">(<a href="#intro">top</a>)</span>
In this section we will build on the basic Forms example.  We will implement validation logic and show how to provide validation errors and other messages back to the browser user.

## Validation
Some validation rules naturally belong with an entity.  One example is a minimum-length requirement on the user.userName field.  It belows on the User entity because the validation rule should always be applied wherever a User object is being processed.

Other validation rules may belong to a specific web form.  One example might be "terms" checkbox that is commonly included on sign-up forms (i.e. "check this box to agree to our privacy terms").     

We will start with the entity field validation example.  Open up the myapp.entity.User class in your favorite editor and add a validation annotation on the userName like this:

    @Size(min = 2)       
    public String getUserName() {
        return userName;
    }

Then we need to tell the Controller's save method to perform validation on the User object upon form submission.  We do that simply by adding a @Valid annotation on the save method:

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("user") @Valid User user, 
        BindingResult errors, Map<String, Object> model) {

Lastly we need a way to display the messages on the html form.  For now we'll just show any and all messages at the top of the form:

~~~
<body>
    <@spring.bind "user" />
    <#if spring.status??>   
        <p>
        <#list spring.status.errorMessages as error> 
            <strong>${error}</strong> <br>
        </#list>
        </p>
    </#if>      

    <form action="<@spring.url '/users/save' />" method="POST">
    ...
~~~     

Now rebuild and restart tomcat, and use your browser to save a new user with a username that is shorter than 8 letters.  If you don't get a validation error double-check that you did a ./manage.sh rerun.

For more validation options, check out SpringValidatorUtils ([javadocs](http://scandilabs.github.io/catamaran/apidocs/com/scandilabs/catamaran/mvc/SpringValidatorUtils.html), [source](https://github.com/scandilabs/catamaran/blob/master/src/main/java/com/scandilabs/catamaran/mvc/SpringValidatorUtils.java)).  Or try these common validation annotations:

    Email address: @Email
    US phone number: @Pattern(regexp = "^(?:(?:\\+?1\\s*(?:[.-]\\s*)?)?(?:\\(\\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\\s*\\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\\s*(?:[.-]\\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\\s*(?:[.-]\\s*)?([0-9]{4})(?:\\s*(?:#|x\\.?|ext\\.?|extension)\\s*(\\d+))?$")  [see](http://stackoverflow.com/questions/123559/a-comprehensive-regex-for-phone-number-validation)
    Min size: @Size(min = 2)
    Max size: @Size(max = 20)
    
> NOTE: If some of these don't work, check out catamaran-connect's PersonController and also this: https://jira.springsource.org/browse/SPR-9112    

## Messages
In addition to error messages, we sometimes want to show other messages to users as well.  One common scenario is a confirmation message.  

Note the problem with confirmation messages is that successful POST requests should generally end in a redirect to a GET (per the [Post/Redirect/Get](http://en.wikipedia.org/wiki/Post/Redirect/Get) design pattern).  Therefore we need to store the message in some type of temporary location.  With Catamaran, that temporary location is generally the user's http session. 

So let's add a "User was saved successfully" message to our sample application.  First edit the controller's save method:

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("user") @Valid User user, 
            BindingResult errors, Map<String, Object> model) {
        long id = person.save();
        DisplayMessage.addToNextPage(model, "New user with id " + id + " was saved successfully", true);
        return "redirect:" + id;
    }   

That should get you going with Validation and Messages.  If some of this code doesn't work as intended please [let us know](/contact).

## Additional references
[Spring Validation](http://static.springsource.org/spring/docs/3.2.x/spring-framework-reference/html/validation.html#validation-beanvalidation)

[BindStatus](http://static.springsource.org/spring/docs/3.2.x/javadoc-api/org/springframework/web/servlet/support/BindStatus.html)

[Errors](http://static.springsource.org/spring/docs/3.2.x/javadoc-api/org/springframework/validation/Errors.html)


<div id="ajax"></div>
# AJAX and jQuery <span class="tutorialNav">(<a href="#intro">top</a>)</span>
In order to make the HTML application experience "richer", it is common to expose back-end services via JSON to a Javascript function via AJAX.  This section will show how to create a jQuery pop-up window that pulls data from a controller method serving JSON.

Start by creating a new AjaxController class with a json lookup method:

~~~
@Controller
public class AjaxController {

    @RequestMapping("/users.json")
    public ModelAndView users() throws Exception {

        ModelAndView mv = new ModelAndView("json-string");
        List<User> userList = User.objects.all();        
        JSONObject jsonTop = JSONObject.fromObject(userList);
        mv.addObject("users", jsonTop);
        return mv;
    }
}
~~~

Do a ./manage.sh rerun and verify that the controller returns json data to the browser at http://localhost:8080/users.json

Now let's start simple by writing a simple script to read the json, and then use javascript's built-in "alert" function to show us a list of usernames:
~~~
...
<head>
    <link type="text/css" rel="stylesheet" href="/css/global.css" media="screen, projection">    
    <title>Hello World from ScandiLabs Java</title>
    
    <script>
    
    $(document).ready(function() { 
        
        // Render tag cloud html
        var output = "Usernames: ";
        
        $.getJSON('users.json', function(data) {
            
            for (var i = 0, ii = data.length, thisTag, groupId; i < ii; i++) {
                element = data[i];                            
                output +=  'element.userName ';
                console.log('read and added: ' + element.userName);
            }
            alert(output);
        });
    }
    
    </script>
</head>
<body>
    <p>Hello world! <img src="/img/info-icon.png" /></p>
</body>
</html>
~~~

> NOTE: The console.log("..") statement above won't be seen by the browser visitor, but it makes it easier to debug your javascript code.  View the console tab of your [browser's debugger](http://www.netmagazine.com/tutorials/javascript-debugging-beginners) to see the output. 

<div id="services"></div>
# Services <span class="tutorialNav">(<a href="#intro">top</a>)</span>
A service is generally used to centralise a part of the codebase that is used in many different places.  The service may use it's own persistence mechanism or it may represent an API or Facade to another system.  It may or may not require it's own explicit configuration via Spring's Application Context configuration container.

Commonly used services include:

- SearchService: A way to centralize all access to back-end search engine
- EmailService: A service which contains logic for sending email message, thus enabling Controller code to be free from email-specific setup
- ApplicationConfiguration: A service which provides easy access to a set of server-specific information such as database name, user, and password

Here is an example of an ApplicationConfiguration service (which is used by java.scandilabs.com):

~~~
public class ApplicationConfiguration {
    
    private String tutorialFileOverridePath;

    public String getTutorialFileOverridePath() {
        return tutorialFileOverridePath;
    }

    public void setTutorialFileOverridePath(String tutorialFileOverridePath) {
        this.tutorialFileOverridePath = tutorialFileOverridePath;
    }

}
~~~

This java class is saved as ApplicationConfiguration.java in the myapp.service package.  It is configured via this xml snippet in Spring's applicationContext.xml file:

~~~
    <bean id="applicationConfiguration"
        class="org.catamarancode.faq.service.ApplicationConfiguration">
        <property name="tutorialFileOverridePath" value="${tutorial.file.classpath.override}" />
    </bean>
~~~  

Note the <code>${tutorial.file.classpath.override}</code> is a reference to a property in the /catamaran/apps/hello-world/conf/application.properties file:

    tutorial.file.classpath.override=/some/file/path/here
    
Once a service has been declared in applicationContext.xml it may be "injected" into a Controller class via an @AutoWired annotation:

    @Controller
    public class VisitorController {

        @Autowired
        private ApplicationConfiguration applicationConfiguration;
        ...
    }    

The service is now ready for use in the Controller, as in this example:

~~~
    @RequestMapping("/tutorial")
    public ModelAndView tutorial(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
            
        ...
        
        BufferedReader b = null;
        if (applicationConfiguration != null && applicationConfiguration.getTutorialFileOverridePath() != null && applicationConfiguration.getTutorialFileOverridePath().length() > 2) {
            
            // Load tutorial file
            URL loadedResource = this.getClass().getClassLoader().getResource("tutorial.md");
            File file = new File(applicationConfiguration.getTutorialFileOverridePath());
            b = new BufferedReader(new FileReader(file));
        }
        ...
~~~
           

<div id="security"></div>
# Security and Sessions <span class="tutorialNav">(<a href="#intro">top</a>)</span>
For complex security needs, Spring provides it's own [security framework](http://static.springsource.org/spring-security/site/index.html) that is very powerful and extensible.

But for basic web applications, you can get a basic user authentication scheme up and running with these component parts:
- Login controller with a POST reqest handler method that handles a submitted username (or email) and password
- A persisted User object and a way to store and retrieve it from the HTTP session
- An <code>isLoggedIn</code> method call check in each of your "secured" controller methods

Let's start by creating a UserContextService that will be responsible for all the heavy lifting:
~~~
@Component
@Scope("session")
public class UserContext implements Serializable {
    
    private static final String USER_MODEL_KEY = "user";

    private Long userId;
    
    public void prepareModel(Map<String, Object> model) {
        User user = this.getUser();
        model.put(USER_MODEL_KEY, user);
    }
    
    public User getUser() {
        User user = User.objects.load(getUserId());
        return user;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    public boolean isLoggedIn() {
        if (this.userId != null) {
            return true;
        }
        return false;
    }
}
~~~

With the @Scope annotation, we are telling Spring MVC that this object should be scoped in the user's HTTP session.  

Then we need to write a LoginController (new java class in in myapp.web):
~~~
@Controller
@Scope("request")
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.POST)  
    public String logInPost(HttpServletResponse response, Map<String,Object> model, @RequestParam("email") String email, @RequestParam("password") String password) {

        List<User> users = User.objects.filter(Restrictions.eq("email", email));
        User user = (User) CollectionUtils.findOne(users);
        if (user == null) {
            MessageContext.addToModel(model, "Invalid email", false);
            return "login";
        }
        if (!user.passwordMatches(password)) {
            MessageContext.addToModel(model, "Invalid email or password", false);
            return "login";
        }
        
        // Success
        userContext.setUserId(user.getId());
        return "redirect:/index";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)  
    public String logOut(Map<String,Object> model) {

        userContext.setUserId(null);
        return "redirect:/login";
    }
~~~

We need a login HTML template:
~~~
<#import "/spring.ftl" as spring />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">

<head>
</head>
<body>  
    <#if message??>
        <h3>${message}</h3>
    </#if>
            
    <form action="<@spring.url '/login' />" method="post">
        <div>
            <label for="email">Email</label>
            <input type="text" name="email" id="email" />                       
        </div>
                    
        <div>
            <label for="password">Password</label>
            <input type="password" name="password" id="password" />
        </div>
                    
        <div>
            <label for="button"></label>
            <input type="submit" value="Log in" />
        </div>
    </form>
</body>
</html>
~~~

And finally we insert security checks into our controller methods.  In this example, we will require a login before allowing a new User to be created:
~~~
public class UserFormController {

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(Map<String, Object> model) {

        if (!userContext.isLoggedIn(request)) {
            return "redirect:/login";
        }
    
        User user = new User();
        model.put("user", user);
        return "user-edit";
    }
}
~~~


<div id="email"></div>
# Email <span class="tutorialNav">(<a href="#intro">top</a>)</span>

~~~
  <bean id="springMailSender" class="org.springframework.mail.javamail.JavaMailSenderImpl">
    <property name="host">
      <value>${email.host}</value>
    </property>
    <property name="port">
      <value>${email.port}</value>
    </property> 
    <property name="protocol">
      <value>${email.protocol}</value>
    </property> 
    <property name="username">
      <value>${email.username}</value>
    </property> 
    <property name="password">
      <value>${email.password}</value>
    </property> 
    <property name="javaMailProperties">
      <props>
        <prop key="mail.smtps.auth">${email.mail.smtps.auth}</prop>
        <prop key="mail.smtps.starttls.enable">${email.mail.smtps.starttls.enable}</prop>
        <prop key="mail.smtps.debug">${email.mail.smtps.debug}</prop>
      </props>
    </property> 
    </bean>


  <!-- A service that wraps the Spring/Java mail sender to allow for sending html-formatted emails with minimal coding -->
  <bean id="htmlMailSender" class="com.scandilabs.catamaran.mail.send.SimpleHtmlMailSender">
    <constructor-arg ref="springMailSender" />
    <property name="defaultFrom" value="${email.default.from}"/>
    <property name="defaultTo" value="${email.default.to}"/>
    <property name="testMode" value="false"/>
  </bean>  
~~~

## Email Templates
For more advanced emailing needs, you may wish to use Freemarker to compose your email templates.  Add this to your Spring applicationContext.xml:
~~~
    <bean id="freemarkerEmailConfig" class="org.springframework.ui.freemarker.FreeMarkerConfigurationFactoryBean">
     <property name="templateLoaderPath"><value>${email.freemarker.template.base.dir}</value></property>
     <property name="freemarkerVariables">
      <map>
        <entry key="xml_escape" value-ref="fmXmlEscape"/>
      </map>
    </property>
  </bean>
  
  <!-- A service that populates the email body field from a freemarker template and an object data model -->
    <bean id="emailBodyComposer" class="com.scandilabs.catamaran.mail.compose.freemarker.FreemarkerSimpleMessageBodyComposer"> 
    <constructor-arg ref="freemarkerEmailConfig" />
  </bean>
~~~


<div id="background"></div>
# Background Tasks <span class="tutorialNav">(<a href="#intro">top</a>)</span>

~~~
  <!-- A mail sender that uses a DB-based outbound queue -->
  <bean id="asyncMailSender" class="com.scandilabs.catamaran.mail.async.AsyncSender">
    <constructor-arg ref="sessionFactory" />
  </bean>
  
  <!-- Asynchronous mail sender daemon. Required when using AsyncMailMessageSender.  Uses DB as the outbound queue -->
  <bean id="asyncMailDaemon" class="com.scandilabs.catamaran.mail.async.AsyncDaemon" init-method="init">
    <constructor-arg ref="sessionFactory" />
    <constructor-arg ref="htmlMailSender" />
    <constructor-arg><value>20000</value></constructor-arg>
    <constructor-arg><value>5000</value></constructor-arg>
  </bean>
  ~~~