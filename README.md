<h1>Java Blog Aggregator</h1>

<p>Project Java Blog Aggregator uses this system to aggregate latest news from Java world.</p>

<h2>To run in development mode (using embedded HSQL database):</h2>

<p>
Run this application using embedded Jetty server: <code>mvn -P dev jetty:run -Dspring.profiles.active="dev"</code>
</p>

<p>This will start embedded Jetty server on port 8080 and you can access your application here: <code>http://localhost:8080</code></p>

<h2>To deploy on Heroku:</h2>

<p>
first run: <code>mvn package</code><br />
next goto target directory and run: <code>heroku deploy:war --war jba.war --app YOUR_APP</code><br />
To deploy WAR to Heroku see this article: <a href="https://devcenter.heroku.com/articles/war-deployment" target="_blank">https://devcenter.heroku.com/articles/war-deployment</a><br />
You can use this user to login (name / password): <code>admin / admin</code>
</p>

<ul>
	<li>
		<a href="http://www.facebook.com/felipewom" target="_blank" title="Page on Facebook">Felipe Moura</a>
		
	</li>
</ul>