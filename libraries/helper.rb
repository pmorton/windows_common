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

module WindowsCommon
	module Helper
		ProgramsNative = ENV['PROCESSOR_ARCHITEW6432'] == 'AMD64' ? ENV['ProgramW6432'] : ENV['ProgramFiles']
		Programs32 = ENV['ProgramFiles']
		Programs64 = ENV['ProgramW6432']
		
		
	end
	
end