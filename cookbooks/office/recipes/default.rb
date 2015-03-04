aws_s3_bucket = node['office']['aws_s3_bucket']
aws_access_key_id = node['office']['aws_access_key_id']
aws_secret_access_key = node['office']['aws_secret_access_key']

cache = File.join(Chef::Config[:file_cache_path], 'office')
setup = File.join(cache, 'setup.exe')
configuration = File.join(cache, 'configuration.xml')

directory cache

s3_file setup do
	remote_path '/office-365-setup.exe'
  bucket aws_s3_bucket
	aws_access_key_id aws_access_key_id
	aws_secret_access_key aws_secret_access_key
	mode 0755
  checksum '2e04cf48fa4d5f44e84c5ae922db8c5cc18d2af574e8c62fb6920190b48df700'
end

cookbook_file configuration do
  source 'configuration.xml'
end

execute 'install office' do
  command "#{setup} /configure #{configuration}"
  creates 'C:\Program Files\Microsoft Office 15'
end
