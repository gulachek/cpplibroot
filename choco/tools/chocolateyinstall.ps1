$ErrorActionPreference = 'Stop'; # stop on all errors

$programFiles = $Env:ProgramFiles;
$dir = "${programFiles}\cpplibroot";

# Create folder
New-Item -ItemType Directory -Path "${dir}"

# Add to CPP_LIBROOT_PATH
$librootPath = $Env:CPP_LIBROOT_PATH
$newVal = "${dir};${librootPath}" 
$newVal = $newVal -replace ";$", ""

Install-ChocolateyEnvironmentVariable `
-VariableName "CPP_LIBROOT_PATH" `
-VariableValue $newVal `
-VariableType Machine
