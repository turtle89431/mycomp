$current = Resolve-Path -Path ".\" 
$tloc = $env:TEMP
$fin = $args[0]
$fout = $args[1]
$m = $args[2]
Copy-Item -Path "$current\et.dll" "$tloc\et.zip"
Set-Location $tloc
Expand-Archive -Path "$tloc\et.zip" -DestinationPath "$tloc" -Force

if ($m -eq "z") {
    .\et.bat a  "tmp.7z" "$current\$fin"
    Copy-Item "tmp.7z" "$current\$fout"
    Remove-Item tmp.7z
    Remove-Item et.bat
    remove-item .\etool.exe
    Remove-Item et.zip
    Set-Location $current 
} elseif ($m -eq "u") 
{
    $tfn="$tloc\$fin"
    Copy-Item "$current\$fin" "$tfn.7z"
    mkdir out
    .\etool.exe x "$tfn.7z" -o".\out" *.*
    Copy-Item out "$current" -Force -Recurse
    Remove-Item et.bat
    remove-item .\etool.exe
    Remove-Item et.zip
    
}else {
    echo " please select u to unzip or z to zip"
}
Set-Location $current