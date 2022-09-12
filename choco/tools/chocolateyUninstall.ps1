$ErrorActionPreference = 'Stop'; # stop on all errors

# Remove cpplibroot system directory
$programFiles = $Env:ProgramFiles;
$dir = "${programFiles}\cpplibroot";

Remove-Item -Path $dir

# Remove from CPP_LIBROOT_PATH
$librootPath = $Env:CPP_LIBROOT_PATH
$newVal = $librootPath.Replace($dir, "")
$newVal = $newVal.Replace(";;", "")
$newVal = $newVal -replace ";$", ""
$newVal = $newVal -replace "^;", ""
if (!$newVal) { $newVal = $null; }

Install-ChocolateyEnvironmentVariable `
-VariableName "CPP_LIBROOT_PATH" `
-VariableValue $newVal `
-VariableType Machine
