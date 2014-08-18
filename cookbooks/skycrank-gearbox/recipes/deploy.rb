#
# Cookbook Name:: cookbooks/skycrank-gearbox
# Recipe:: deploy
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "Write the current time and date to a deploy log" do
  command "date >> /tmp/deploy.log"
end
