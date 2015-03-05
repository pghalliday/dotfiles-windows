cache = File.join(Chef::Config[:file_cache_path], 'adobe-reader')
setup = File.join(cache, 'setup.exe')

directory cache

remote_file setup do
  source 'http://ardownload.adobe.com/pub/adobe/reader/win/11.x/11.0.10/en_US/AdbeRdr11010_en_US.exe'
  checksum 'c438ac343381031cd47dd4ed966c8e86b2bcd5a1959f55c1c7d8c61920dd18bc'
end

windows_package 'Adobe Reader XI (11.0.10)' do
  source setup
  installer_type :custom
  options '/msi EULA_ACCEPT=YES REMOVE_PREVIOUS=YES /qn'
end
