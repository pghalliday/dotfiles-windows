workstation_aws_s3_bucket = node['workstation']['aws_s3_bucket']
workstation_aws_access_key_id = node['workstation']['aws_access_key_id']
workstation_aws_secret_access_key = node['workstation']['aws_secret_access_key']
workstation_user = node['workstation']['user']
workstation_pasword = node['workstation']['password']

# configure auto login
node.override['windows_auto_login']['user'] = workstation_user
node.override['windows_auto_login']['password'] = workstation_pasword
include_recipe 'windows-auto-login::default'

# prevent auto logout, etc
include_recipe 'windows-always-on::default'

# install office
node.override['office']['aws_s3_bucket'] = workstation_aws_s3_bucket
node.override['office']['aws_access_key_id'] = workstation_aws_access_key_id
node.override['office']['aws_secret_access_key'] = workstation_aws_secret_access_key
include_recipe 'office::default'

# install Dektec StreamXpress
include_recipe 'streamxpress::default'

# install VSphere client
include_recipe 'vsphere-client::default'

# install ChefDK
include_recipe 'chefdk::default'

# install msysgit
include_recipe 'git::default'
