function Caesar_Encryption($key, $pt){
    While ($ptlength -gt 0)
    {
        $CurrentIndex = 0..($alphaC.count - 1) | Where {$alphaC[$_] -eq $pt[$i]}
        #$CurrentIndex
        $NewIndex = $CurrentIndex + $key
        #$NewIndex
        If ($NewIndex -gt 25)
        {$NewIndex = $NewIndex - 26}
         Write-Host -NoNewLine $alphaC[$NewIndex]
            $ptlength --
             $i++
    }
}

$i = 0
$alphaC = ""
$alphaC = [char[]](65..90)
Write-host "Enter Plain Text"
$pt = read-host
Write-host "Enter Key (To decrypt write '-' before key)"
$key = read-host
$ptlength=$pt.length

Write-host "Key`t`tPlain Text`t`t Encrypted Text"
Write-host -NoNewLine $key`t`t$pt`t`t
    
Caesar_Encryption $key $pt
