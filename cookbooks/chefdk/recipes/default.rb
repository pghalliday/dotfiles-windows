cache = File.join(Chef::Config[:file_cache_path], 'chefdk')
setup = File.join(cache, 'chefdk.msi')

directory cache

remote_file setup do
  source 'https://opscode-omnibus-packages.s3.amazonaws.com/windows/2008r2/x86_64/chefdk-0.4.0-1.msi'
  checksum '57ea4e662c4398fb2c4a9c7a133d5cf7e9e0db0aa10a8892ac21085aa619c694'
end

windows_package 'Chef Development Kit v0.4.0' do
  source setup
  installer_type :msi
end
