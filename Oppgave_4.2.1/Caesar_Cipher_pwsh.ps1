function Caesar_Encryption($key, $pt){
  while($ptlength -gt 0)
  {
    $currentIndex = 0..($alphaC.Count -1) | where {$alphaC[$_] -eq $pt[$i]}

    $newIndex = $currentIndex + $key

    if($newIndex -gt 25)
    {$newIndex = $newIndex -26}
    Write-Host -NoNewLine $alphaC[$newIndex]
      $ptlength --
        $i++
  }
}

$i = 0
$alphaC = ""
$alphaC = [char[]](65..90)
Write-Host "Enter Plain Text (To decrypt write '-' before key)"
$pt = read-Host
Write-Host "Enter Key"
$key = read-Host
$ptlength = $pt.Length

Write-Host "Key `t`tPlain Text `tEncrypted Text"
Write-Host -NoNewLine $key `t`t$pt`t`t

Caesar_Encryption $key $pt
