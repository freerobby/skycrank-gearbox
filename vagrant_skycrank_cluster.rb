require 'chef_metal'
require 'chef_metal_vagrant'

vagrant_cluster '/Users/cpatti/Vagrants'

vagrant_box 'chef/ubuntu-14.04' do
  url 'https://vagrantcloud.com/chef/ubuntu-14.04/version/1/provider/virtualbox.box'
end

machine 'skycrank-gearbox' do
  tag 'master'
  recipe "skycrank-gearbox::default"
  converge true
end

machine 'skycrank01' do
  tag 'gear'
  converge true
end

machine 'skycrank02' do
  tag 'gear'
  converge true
end
