rem set your local paths to nuget.exe if needed

set testversion=17.0.0
set gtaversion=0.18.0

nuget install Microsoft.TestPlatform -Version %testversion% -OutputDirectory packages
nuget install GoogleTestAdapter -Version %gtaversion% -OutputDirectory packages

set vstest_console_exe=%~dp0packages\Microsoft.TestPlatform.%testversion%\tools\net451\Common7\IDE\Extensions\TestPlatform\vstest.console.exe
set code_coverage_exe=%~dp0packages\Microsoft.TestPlatform.%testversion%\tools\net451\Team Tools\Dynamic Code Coverage Tools\CodeCoverage.exe

set google_adapter_path=%~dp0packages\GoogleTestAdapter.%gtaversion%\build\_common\


%vstest_console_exe% ^
  %~dp0dyn.rt-dyn\x64\Release\dyn.rt-dyn.exe ^
  %~dp0static.rt-dyn\x64\Release\static.rt-dyn.exe ^
  %~dp0static.rt-static\x64\Release\static.rt-static.exe ^
  /TestAdapterPath:%google_adapter_path%

%vstest_console_exe% ^
  %~dp0dyn.rt-dyn\x64\Release\dyn.rt-dyn.exe ^
  %~dp0static.rt-dyn\x64\Release\static.rt-dyn.exe ^
  %~dp0static.rt-static\x64\Release\static.rt-static.exe ^
  /TestAdapterPath:%google_adapter_path% ^
  /Collect:"Code Coverage" 

pause

