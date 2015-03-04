cache = File.join(Chef::Config[:file_cache_path], 'git')
setup = File.join(cache, 'setup.exe')

directory cache

remote_file setup do
  source 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20141217/Git-1.9.5-preview20141217.exe'
  checksum 'd7e78da2251a35acd14a932280689c57ff9499a474a448ae86e6c43b882692dd'
end

windows_package 'Git version 1.9.5-preview20141217' do
  source setup
  installer_type :inno
end
