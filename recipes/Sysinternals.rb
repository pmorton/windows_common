# Cookbook Name:: workers
# Recipe:: SysinternalsInstaller
#
# Author:: Paul Morton
# Copyright 2011, BIA
#
# All rights reserved - Do Not Redistribute
include_recipe 'windows'

windows_path "#{WindowsCommon::Helper::ProgramsNative}\\Sysinternals" do
	action :nothing
end

windows_zipfile "#{WindowsCommon::Helper::ProgramsNative}/Sysinternals" do
	source "http://download.sysinternals.com/Files/SysinternalsSuite.zip"
	action :unzip
	not_if {::File.exists?("#{WindowsCommon::Helper::ProgramsNative}/Sysinternals/psexec.exe")}
	notifies :add, "windows_path[#{WindowsCommon::Helper::ProgramsNative}\\Sysinternals]", :immediately
end


