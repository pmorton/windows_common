# Cookbook Name:: workers
# Recipe:: SysinternalsInstaller
#
# Author:: Paul Morton
# Copyright 2011, BIA
#
# All rights reserved - Do Not Redistribute
include_recipe 'windows_common::Sysinternals'

cookbook_file "#{WindowsCommon::Helper::ProgramsNative}/Sysinternals/Config.bgi" do
  source "Config.bgi"
  not_if {::File.exists?("#{WindowsCommon::Helper::ProgramsNative}/Sysinternals/Config.bgi")}
  notifies :run, "execute[#{WindowsCommon::Helper::ProgramsNative}/Sysinternals/Config.bgi]", :immediately
end

# Cookbook files dont inherit the correct permissions
execute "#{WindowsCommon::Helper::ProgramsNative}/Sysinternals/Config.bgi" do
	command "icacls.exe \"#{WindowsCommon::Helper::ProgramsNative}/Sysinternals/Config.bgi\" /reset /T"
	returns [0,42]
	action :nothing
end

windows_auto_run 'BGINFO' do
	not_if { Registry.value_exists?(Windows::KeyHelper::AUTO_RUN_KEY, 'BGINFO') }
	program "#{WindowsCommon::Helper::ProgramsNative}\\Sysinternals\\BGInfo.exe"
	args "\"#{WindowsCommon::Helper::ProgramsNative}\\Sysinternals\\Config.bgi\" /NOLICPROMPT /TIMER:0"
	action :create
end
