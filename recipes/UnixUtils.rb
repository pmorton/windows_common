# Cookbook Name:: workers
# Recipe:: UnixUtilitiesInstaller
#
# Author:: Paul Morton
# Copyright 2011, BIA
#
# All rights reserved - Do Not Redistribute
include_recipe 'windows'

windows_path "#{WindowsCommon::Helper::ProgramsNative}\\UnixUtilities" do
	action :nothing
end

windows_zipfile "#{WindowsCommon::Helper::ProgramsNative}/UnixUtilities" do
	source "http://swdist.s3.amazonaws.com/UnixUtils.zip"
	action :unzip
	not_if {::File.exists?("#{WindowsCommon::Helper::ProgramsNative}/UnixUtilities/cat.exe")}
	notifies :add, "windows_path[#{WindowsCommon::Helper::ProgramsNative}\\UnixUtilities]", :immediately
end
