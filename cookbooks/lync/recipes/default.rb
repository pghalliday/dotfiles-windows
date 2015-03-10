aws_s3_bucket = node['lync']['aws_s3_bucket']
aws_access_key_id = node['lync']['aws_access_key_id']
aws_secret_access_key = node['lync']['aws_secret_access_key']

cache = File.join(Chef::Config[:file_cache_path], 'lync')
zip = File.join(cache, 'lync.zip')
setup = File.join(cache, 'lync', 'setup.exe')
adminfile = File.join(cache, 'lync', 'unattended.MSP')

directory cache

s3_file zip do
	remote_path '/lync.zip'
  bucket aws_s3_bucket
	aws_access_key_id aws_access_key_id
	aws_secret_access_key aws_secret_access_key
	mode 0755
  checksum '4786456a45644f1f56167b661974cd0dc748f4b21aa75180fb817a4ca4d3b47e'
end

windows_zipfile cache do
  source zip
  action :unzip
  not_if {::File.exists?(setup)}
end

windows_package 'Microsoft Lync Basic 2013' do
	source setup
  installer_type :custom
  options "/adminfile #{adminfile}"
end
