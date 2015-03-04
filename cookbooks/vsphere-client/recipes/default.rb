cache = File.join(Chef::Config[:file_cache_path], 'vsphere-client')
setup = File.join(cache, 'setup.exe')

directory cache

remote_file setup do
  source 'http://vsphereclient.vmware.com/vsphereclient/1/9/9/3/0/7/2/VMware-viclient-all-5.5.0-1993072.exe'
  checksum 'ab4941dbf620fb09ece501d7c7ffc480b18ae7c693d9590680dac8a16cdc9ce5'
end

windows_package 'VMware vSphere Client 5.5' do
  source setup
  installer_type :installshield
  options '/S /v/qn'
end
