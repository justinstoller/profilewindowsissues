test_name 'run time sync with Windows version of DTrace' do
  confine :to, :platform => /windows/

  step 'turn on Event Tracing for Windows (ETW)' do
    on hosts, 'netsh trace start'  
  end

  step 'run the timesync commands' do
    on hosts, 'w32tm /register', :acceptable_exit_codes => [0,5]
    on hosts, 'net start w32time', :acceptable_exit_codes => [0,2]
    on hosts, 'w32tm /config /manualpeerlist:pool.ntp.org /syncfromflags:manual /update'
    on hosts, 'w32tm /resync', :acceptable_exit_codes => (0..125).to_a
  end

  step 'turn off ETW' do
    on hosts, 'netsh trace stop'  
  end

end
