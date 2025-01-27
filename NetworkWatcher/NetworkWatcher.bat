@ECHO OFF
set "IPADDRESS=8.8.8.8"
:TestNetworkConnection
ping -n 1 %IPADDRESS% | find "TTL=" >nul
if errorlevel 1 (
echo not reachable
goto Retry
) else (
echo reachable
exit
)
:Retry
echo wait for 5 seconds
ping 127.0.0.1 -n 6 >nul
goto :TestNetworkConnection