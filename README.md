skycrank-gearbox:
----------------
A cluster controlled by a provisioner node fpr deploys, etc. using Chef
Metal.

Ultimately a failed (at least for now :) experiment.  See Post Mortem section
for details.

Pre-Requisites:
---------------

* A recent version of Ruby - at least 1.9.X (I haven't exhaustively tested gem
versions - I'm using Ruby 2.1.0)
* The Bundler gem installed
* Vagrant - http://www.vagrantup.com
* ChefDK from Opscode - http://downloads.getchef.com/chef-dk/



What Works:
-----------


Instructions on starting the cluster:
-------------------------------------

Check this Git repository out of github, cd into the skycrank-gearbox directory,
and run 'bundle install' to fetch all the requisite gems.

In vagrant_skycrank_cluster.rb, Edit the line that reads
```vagrant_cluster '/Users/cpatti/Vagrants'``` 
to reflect an empty dir on your machine where the cluster VMs can reside.



Starting the Cluster:
---------------------

Type ```bundle exec chef-client -z vagrant_skycrank_cluster.rb```

You should see a bunch of output similar to the following:

```
cpatti@Michelles-MacBook-Pro: ~/Dropbox/src/chef/skycrank-gearbox master ⚡
$ bundle exec chef-client -z ./vagrant_skycrank_cluster.rb                         [20:20:49]
[2014-08-18T20:20:54-04:00] WARN: No config file found or specified on command line, using command line options.
Starting Chef Client, version 11.14.2
resolving cookbooks for run list: []
Synchronizing Cookbooks:
Compiling Cookbooks...
[2014-08-18T20:20:57-04:00] WARN: Node Michelles-MacBook-Pro.local has an empty run list.
Converging 3 resources
Recipe: @recipe_files::/Users/cpatti/Dropbox/src/chef/skycrank-gearbox/vagrant_skycrank_cluster.rb
  * vagrant_cluster[/Users/cpatti/Vagrants] action create (up to date)
  * vagrant_box[chef/ubuntu-14.04] action create (up to date)
  * machine_batch[default] action converge
    - [skycrank-gearbox] update node skycrank-gearbox at http://localhost:8889
    - [skycrank-gearbox]   update run_list from ["recipe[skycrank-gearbox::default]"] to ["recipe[skycrank-gearbox::default]", "recipe[skycrank-gearbox::default]"]
    - run vagrant up --parallel skycrank-gearbox skycrank01 skycrank02 (status was 'not created, poweroff, poweroff')
    - update node skycrank-gearbox at http://localhost:8889
    -   add normal.metal.location.forwarded_ports = {}
    -   update run_list from ["recipe[skycrank-gearbox::default]"] to ["recipe[skycrank-gearbox::default]", "recipe[skycrank-gearbox::default]"]
    - [skycrank-gearbox] generate private key (2048 bits)
    - [skycrank-gearbox] create directory /etc/chef on skycrank-gearbox
    - [skycrank-gearbox] write file /etc/chef/client.pem on skycrank-gearbox
    - [skycrank-gearbox] update client skycrank-gearbox at http://localhost:8889
    - [skycrank-gearbox]   update public_key from "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyHnlYhdfUhB6hvuZ42Lo\n3feD8C+N78KI84+Ga/0uj8/y5tXBT2vF7ITqMg1hhLIcUQBipwEBQXQcRE/JURlb\n0zHD+S5I7Wd2dHiliA8aoRBeyx59NScXOUdB2FsC/nKgUNOB5TpXAlTdQvx2qIQE\nuLvWkRBmkKcyKkOWTZM2luW6J/0R5BXk3CzPS9aSM/W7+AKBJ3oCRx+JOud5Oera\nBZnmA2Nx5Y3558X+nmGB0VAJXfI1XVs686+yAdoG3Da0GU/yc6oTuPnmFbtyXCIA\n9ksqsNx7W4z9SzU3e5XcIcFBpz3zpDIBZz7jUnOS+prVspgFeLcIFR3eOaDuP1Ak\nmwIDAQAB\n-----END PUBLIC KEY-----\n" to "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr7uf7exCdS71IAtYJghC\nVuds8K8GcUHwpxw2C2wFGcUJX4sS96VsmzCwAvUY5RoOW0FPIdR+BVsVU2klrJz6\n3x2nIJKYQFibJBLM8L7C54HHCQVurgLU8ttsMRXkAti1ILTKuMlfBBYpjg8966p0\nT/kZUViECQkO6TDuhRB94p3GNREThZ2X20hEyUjgEuEdNIHIk5hu7nsIQc1Lu9B5\nAkx0SbAVGdkGUqQqlxmH3ixHgiUnQJ6Mpej0MviC4azbL8rqC5Bwf48TYWlWZgU1\nLJtWi+CZz4YXDWTimTwgM7HIuonytx/4mwiNcTv44xddz6yGSSZ+ykC/fvehysfH\niQIDAQAB\n-----END PUBLIC KEY-----\n"
    - [skycrank-gearbox] update node skycrank-gearbox at http://localhost:8889
    - [skycrank-gearbox]   update run_list from ["recipe[skycrank-gearbox::default]"] to ["recipe[skycrank-gearbox::default]", "recipe[skycrank-gearbox::default]"]
    - [skycrank-gearbox] write file /etc/chef/client.rb on skycrank-gearbox
    - [skycrank-gearbox] write file /tmp/detect.sh on skycrank-gearbox
    - [skycrank-gearbox] upload file /Users/cpatti/.chef/package_cache/chef_11.14.6-1_amd64.deb to /tmp/chef_11.14.6-1_amd64.deb on skycrank-gearbox
    - [skycrank-gearbox] run 'dpkg -i "/tmp/chef_11.14.6-1_amd64.deb"' on skycrank-gearbox
    - update node skycrank-gearbox at http://localhost:8889
    -   update run_list from ["recipe[skycrank-gearbox::default]"] to ["recipe[skycrank-gearbox::default]", "recipe[skycrank-gearbox::default]"]
    [skycrank-gearbox] [2014-08-19T00:22:34+00:00] WARN:
                       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                       SSL validation of HTTPS requests is disabled. HTTPS connections are still
                       encrypted, but chef is not able to detect forged replies or man in the middle
                       attacks.

                       To fix this issue add an entry like this to your configuration file:

                         # Verify all HTTPS connections (recommended)
                         ssl_verify_mode :verify_peer

                         # OR, Verify only connections to chef-server
                         verify_api_cert true

                       To check your SSL configuration, or troubleshoot errors, you can use the
                       `knife ssl check` command like so:

                         knife ssl check -c /etc/chef/client.rb

                       * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

                       Starting Chef Client, version 11.14.6
                       resolving cookbooks for run list: ["skycrank-gearbox::default"]
                       Synchronizing Cookbooks:
                         - skycrank-gearbox
                       Compiling Cookbooks...
                       Converging 0 resources

                       Running handlers:
                       Running handlers complete
                       Chef Client finished, 0/0 resources updated in 7.226062105 seconds
    - [skycrank-gearbox] run 'chef-client -l auto' on skycrank-gearbox
    - [skycrank-gearbox] update node skycrank-gearbox at http://localhost:8889
    - [skycrank-gearbox]   update run_list from ["recipe[skycrank-gearbox::default]"] to ["recipe[skycrank-gearbox::default]", "recipe[skycrank-gearbox::default]"]
    - update node skycrank01 at http://localhost:8889
    -   add normal.metal.location.forwarded_ports = {}
    [skycrank01] [2014-08-19T00:22:47+00:00] WARN:
                 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                 SSL validation of HTTPS requests is disabled. HTTPS connections are still
                 encrypted, but chef is not able to detect forged replies or man in the middle
                 attacks.

                 To fix this issue add an entry like this to your configuration file:

                   # Verify all HTTPS connections (recommended)
                   ssl_verify_mode :verify_peer

                   # OR, Verify only connections to chef-server
                   verify_api_cert true

                 To check your SSL configuration, or troubleshoot errors, you can use the
                 `knife ssl check` command like so:

                   knife ssl check -c /etc/chef/client.rb

                 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

                 Starting Chef Client, version 11.14.6
                 resolving cookbooks for run list: []
                 Synchronizing Cookbooks:
                 Compiling Cookbooks...
                 [2014-08-19T00:22:54+00:00] WARN: Node skycrank01 has an empty run list.
                 Converging 0 resources

                 Running handlers:
                 Running handlers complete
                 Chef Client finished, 0/0 resources updated in 7.105353087 seconds
    - [skycrank01] run 'chef-client -l auto' on skycrank01
    - update node skycrank02 at http://localhost:8889
    -   add normal.metal.location.forwarded_ports = {}
    [skycrank02] [2014-08-19T00:22:59+00:00] WARN:
                 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                 SSL validation of HTTPS requests is disabled. HTTPS connections are still
                 encrypted, but chef is not able to detect forged replies or man in the middle
                 attacks.

                 To fix this issue add an entry like this to your configuration file:

                   # Verify all HTTPS connections (recommended)
                   ssl_verify_mode :verify_peer

                   # OR, Verify only connections to chef-server
                   verify_api_cert true

                 To check your SSL configuration, or troubleshoot errors, you can use the
                 `knife ssl check` command like so:

                   knife ssl check -c /etc/chef/client.rb

                 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

                 Starting Chef Client, version 11.14.6
                 resolving cookbooks for run list: []
                 Synchronizing Cookbooks:
                 Compiling Cookbooks...
                 [2014-08-19T00:23:06+00:00] WARN: Node skycrank02 has an empty run list.
                 Converging 0 resources

                 Running handlers:
                 Running handlers complete
                 Chef Client finished, 0/0 resources updated in 7.095393838 seconds
    - [skycrank02] run 'chef-client -l auto' on skycrank02

Running handlers:
Running handlers complete
Chef Client finished, 1/3 resources updated in 132.135543 seconds

At this point, your cluster is up.  You can change directory to whever your 
Vagrants are stored and vagrant ssh to any of the nodes:

cpatti@Michelles-MacBook-Pro: ~/Vagrants
$ vagrant ssh skycrank01                                                           [20:27:18]
Welcome to Ubuntu 14.04 LTS (GNU/Linux 3.13.0-24-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
Last login: Tue Aug 19 00:22:46 2014 from 10.0.2.2
vagrant@skycrank01:~$ logout
Connection to 127.0.0.1 closed.
```


What Doesn't Work:
------------------

The cluster orchestration piece! As detailed in his excellent ChefConf 2014
tech talk by the author, the idea of chef metal is to build a cluster, and then
be able to run recipes on cluster nodes using the ```metal```  command
(Like, say, to run deploys?) Just what the doctor ordered, right? Only metal is
Alpha, and while people are using it in production, I couldn't get this to work.


Post-Mortem:
------------

My vision - chef-metal managing the cluster, with skycrank-gearbox being the
'provisioner node' and coordinating deploys from there using the chef-metal
metal command.

I even wrote the little Sinatra HTTP API app to take deploy requests:

https://github.com/feoh/skycrank-control-panel

First off, I couldn't get metal itself to build the cluster.  A Twitter
exchange with the author revealed that this critical bug was fixed in
the master branch, so at least I got that far and got the cluster up and
running.

Secondly (and this is the stake in the heart of this idea) - I can't under
any circumstances get the metal command itself to work - the lynch pin of
the operation! :) The idea was to have the skycrank gearbox node bring up
the cluster and then run invocations like 
```metal execute recipe[skycrank-gearbox::deploy]``` from inside the little
Sinatra app when the appropriate HTTP requests come in.


What I Would Do Differently:
----------------------------

Not using Alpha technology would be a good start, even if others have had success
running it in production :) Or, if I'd decided to do so initially, once I ran
across the first show stopper bug (unable to build the cluster) I should have cut
my losses and moved on.

I also think I under-estimated the time it would take to come up to speed with
using chef in a chef-server environment.  Building servers with chef-solo, which
is where all my chef experience currently lies, vastly simplifies the developer
surface area for working with chef, at the expense of some really awesome features.

I had been relying on the chef-metal approach with its local mode chef-zero 
compatability to allow me to deliver a solution in a very constrained period of
time, and as stated above, that didn't pan out.
