windows_package 'Sublime Text 2.0.2' do
  source 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64%20Setup.exe'
  checksum '9f058fa30135f880b4e0a076f5e7c75764d1032359866f4cbb1225fc082cad5f'
  installer_type :custom
  options '/VERYSILENT /NORESTART /TASKS="contextentry"'
  action :install
end
