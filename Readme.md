CAPS - capacity planner
=======================

A web app for assigning colleagues to projects
----------------------------------------------


Features
--------

The application shows a simple table. Columns are projects, rows are workers. 
The table shows the assignments of workers to projects in days (or hours) per week.
Projects and workers can bee added and renamed. Workloads, availabilities and assignments can be edited.
They are always defined for a specific week of the year and are automatically inherited to the next week(s).

Caps is not a fully fledged capacity planner but enough for my and maybe a few others' needs. 
If you miss a certain feature feel free to open issues or pull requests.

To see a sample installation try https://caps-tec.rhcloud.com 
I'm not regularly making sure it's running there but from time to time I push the latest revision to this domain.

Installation
------------

Caps is a standard rails 3 application. Use your preferred installation method. The following steps may help you with a local installation:

First install [rvm](http://beginrescueend.com/rvm/install)

<pre><code>
#!bash
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
</code></pre>
Then checkout the project:
<pre><code>
#!bash
git clone git@bitbucket.org:tec/capacity_planner.git
</code></pre>
When you switch to the project dir rvm will tell you which ruby version to install, e.g.:
<pre><code>
#!bash
cd capacity_planner
rvm install ruby-1.9.3-p125
</code></pre>
Re-enter the dir to enable the rvm ruby version you just installed...
<pre><code>
#!bash
cd ..
cd capacity_planner
</code></pre>
.. and install rails dependencies:
<pre><code>
#!bash
gem install bundler
bundle install
</code></pre>
Create your database...
<pre><code>
#!bash
rake db:create
rake db:migrate
# optionally load some seed data:
rake db:seed
</code></pre>
and finally, start the server:
<pre><code>
#!bash
bundle exec rails server
</code></pre>
and go to http://localhost:3000/current or http://localhost:3000/next.json


License
-------

Fork it and do whatever you want. Merge requests, feature ideas, bug reports, thank you emails are welcome.


Copyright
---------

Silvan T. Golega, http://golega.de
