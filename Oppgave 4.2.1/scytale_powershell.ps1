function scytaleEncode($cipher, $key) {
    if($key -ge $cipher.Length -or $key -le 0) {
        return $cipher
    } else {
        while($cipher.Length % $key -ne 0) {
            $cipher += " ";
        }

        [int]$numOfCols = ($cipher.Length / $key)
    
        for($i = 0; $i -lt $numOfCols; $i++){
            for($y = $i; $y -lt $cipher.Length; $y += $numOfCols) {
                $encodedText += $cipher[$y]
            }
        }
    }   
return $encodedText 
} 


$cipher = "POWERSHELL" #Read-Host -Prompt "input text to encrypt"
$key = 5 #Read-Host -Prompt "input key"

    Write-Host "Plain Text"
    scytaleEncode $cipher $key
