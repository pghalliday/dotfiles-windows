include_recipe 'windows::reboot_handler'

windows_reboot 5 do
  reason 'requires reboot'
  action :nothing
end

# prevent computer sleeping (this imports a new "Always on" plan which stops
# the VM turning off monitors, disks, sleeping or hibernating)
pow_file = File.join(Chef::Config[:file_cache_path], '0e0bc03e-c582-4ead-a662-0a33f2870ea1.pow')
bat_file = File.join(Chef::Config[:file_cache_path], 'SetAlwaysOnPowerCfg.bat')
cookbook_file pow_file do
  source '0e0bc03e-c582-4ead-a662-0a33f2870ea1.pow'
  notifies :run, 'execute[powercfg]', :delayed
end
template bat_file do
  source 'SetAlwaysOnPowerCfg.bat.erb'
  variables({
    :pow_file => pow_file
  })
  notifies :run, 'execute[powercfg]', :delayed
end
execute 'powercfg' do
  command bat_file
  action :nothing
end

# prevent auto lock of workstation so that we always have a desktop
registry_key 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{
    :name => "DisableLockWorkstation",
    :type => :dword,
    :data => 1
  }]
  recursive true
  notifies :request, 'windows_reboot[5]', :delayed
end
