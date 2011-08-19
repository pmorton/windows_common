#
# Author:: Paul Morton (<pmorton@biaprotect.com>)
# Cookbook Name:: windows
# Resource:: path
#
# Copyright:: 2011, Business Intelligence Associates, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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
