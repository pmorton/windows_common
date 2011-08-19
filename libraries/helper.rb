module WindowsCommon
	module Helper
		ProgramsNative = ENV['PROCESSOR_ARCHITEW6432'] == 'AMD64' ? ENV['ProgramW6432'] : ENV['ProgramFiles']
		Programs32 = ENV['ProgramFiles']
		Programs64 = ENV['ProgramW6432']
		
		
	end
	
end