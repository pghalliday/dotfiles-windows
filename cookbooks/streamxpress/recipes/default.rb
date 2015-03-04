cache = File.join(Chef::Config[:file_cache_path], 'streamxpress')
setup = File.join(cache, 'StreamXpress Setup.exe')
cert = File.join(cache, 'dektec.cer')

directory cache

windows_zipfile cache do
  source 'http://www.dektec.com/Products/Apps/DTC-300/Downloads/StreamXpress.zip'
  action :unzip
  not_if {::File.exists?(setup)}
end

cookbook_file cert do
  source 'dektec.cer'
end

cert_installed = Mixlib::ShellOut.new('certutil -store "TrustedPublisher"')
cert_installed.run_command
batch 'add dektec TrustedPublisher cert' do
  code <<-EOH
certutil -addstore "TrustedPublisher" #{cert}
EOH
  not_if { /DekTec Digital Video/.match(cert_installed.stdout) }
end

windows_package 'StreamXpress Stream Player (DTC-300)' do
  source setup
  installer_type :installshield
end
