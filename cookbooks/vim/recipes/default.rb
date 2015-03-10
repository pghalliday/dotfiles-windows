windows_package 'Vim 7.4.638' do
  source 'http://downloads.sourceforge.net/project/cream/Vim/7.4.638/gvim-7-4-638.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fcream%2Ffiles%2FVim%2F7.4.638%2F&ts=1426006136&use_mirror=softlayer-ams'
  checksum '3a8792351270c02051ac9707daa7655e6cf8f3ead90b52aab68b0610c41fca5d'
  installer_type :nsis
  action :install
end
