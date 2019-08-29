# Test Docker
describe docker_container('chartmuseum') do
  it { should be_running }
  # matcher syntax: have_volume(container_path,host_path)
  it { should have_volume('/charts','/home/vagrant/charts') }
end
