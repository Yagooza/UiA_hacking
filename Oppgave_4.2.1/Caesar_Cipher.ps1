$type = read-host "Enter 'encrypt' for Encryption or Enter 'decrypt' from Decryption"
[int]$key = read-host "Enter key"
$text = read-host "Enter text"
Write-Host "-------------------------------------------------" 

#Encryption
if ($type -eq "encrypt") {

    $String = [char[]]$text

    foreach ($letter in $String) {
        $number = [int[]][char]$letter
        #ASCII Codes
        If ($number -ge 0 -and $number -le 64) { 
            [string]$Snbr = $number
            [int]$Nnbr = $Snbr  
            [int]$Enbr = $Nnbr 
            [string]$ELetter = [char]$Enbr
        }
        #Alphabet UpperCase
        If ($number -ge 65 -and $number -le 90) { 
            [string]$Snbr = $number
            [int]$Nnbr = $Snbr 
            [int]$nkey = $key
            [int]$Enbr = $Nnbr + $nkey 
            If ($Enbr -gt 90) { $Enbr = $Enbr - 26 }
            If ($Enbr -lt 65) { $Enbr = $Enbr + 26 }
            [string]$ELetter = [char]$Enbr    
        } 
        #ASCII Codes
        If ($number -ge 91 -and $number -le 96) { 
            [string]$Snbr = $number
            [int]$Nnbr = $Snbr  
            [int]$Enbr = $Nnbr 
            [string]$ELetter = [char]$Enbr
        }
        #Alphabet Lowercase
        If ($number -ge 97 -and $number -le 122) { #Alphabet Lowercase
            [string]$Snbr = $number
            [int]$Nnbr = $Snbr 
            [int]$nkey = $key
            [int]$Enbr = $Nnbr + $nkey 
            If ($Enbr -gt 122) { $Enbr = $Enbr - 26 }
            If ($Enbr -lt 97) { $Enbr = $Enbr + 26 }
            [string]$ELetter = [char]$Enbr   
        }
        #ASCII Codes
        If ($number -ge 123 -and $number -le 127) { 
            [string]$Snbr = $number
            [int]$Nnbr = $Snbr  
            [int]$Enbr = $Nnbr 
            [string]$ELetter = [char]$Enbr
        }    

        $EMsg = $EMsg + $ELetter 
    
    } 
    Write-Host "Encrypted Text: " $EMsg 
    Clear-variable EMsg
    Write-Host "-------------------------------------------------" 
}
  
#Decrypt
if ($type -eq "decrypt") {
    $String = [char[]]$text

    foreach ($letter in $String) {
        $number = [int[]][char]$letter
        #ASCII Codes
        If ($number -ge 0 -and $number -le 64) { 
            [string]$Snbr = $number
            [int]$Nnbr = $Snbr  
            [int]$Enbr = $Nnbr 
            [string]$ELetter = [char]$Enbr
        }
        #Alphabet UpperCase
        If ($number -ge 65 -and $number -le 90) {  
            [string]$Snbr = $number
            [int]$Nnbr = $Snbr 
            [int]$nkey = $key
            [int]$Enbr = $Nnbr - $nkey 
            If ($Enbr -gt 90) {
                $Enbr = $Enbr - 26
            }
            If ($Enbr -lt 65) {
                $Enbr = $Enbr + 26
            }
            [string]$ELetter = [char]$Enbr  
        }  
        #ASCII Codes
        If ($number -ge 91 -and $number -le 96) { 
            [string]$Snbr = $number
            [int]$Nnbr = $Snbr  
            [int]$Enbr = $Nnbr 
            [string]$ELetter = [char]$Enbr
        }
        #Alphabet LowerCase 
        If ($number -ge 97 -and $number -le 122) { 
            [string]$Snbr = $number
            [int]$Nnbr = $Snbr 
            [int]$nkey = $key
            [int]$Enbr = $Nnbr - $nkey 
            If ($Enbr -gt 122) { $Enbr = $Enbr - 26 }
            If ($Enbr -lt 97) { $Enbr = $Enbr + 26 }
            [string]$ELetter = [char]$Enbr       
        }    
        #ASCII Codes
        If ($number -ge 123 -and $number -le 127) { 
            [string]$Snbr = $number
            [int]$Nnbr = $Snbr  
            [int]$Enbr = $Nnbr 
            [string]$ELetter = [char]$Enbr
        }    

        $EMsg = $EMsg + $ELetter    
    } 
    Write-Host "PlainText: " $EMsg
    Clear-variable EMsg
    Write-Host "-------------------------------------------------"
}