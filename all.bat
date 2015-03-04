del vendor
mkdir vendor
chef exec berks vendor .\vendor\cookbooks
echo chef-client -z -j C:\dotfiles\attributes.json -r workstation > vendor\converge.bat
cd vendor
converge.bat
