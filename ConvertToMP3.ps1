param (
     [Parameter(
            Mandatory=$True,
            ValueFromRemainingArguments=$true,
            Position = 0
        )][string[]]
        $inputFiles
)


foreach ($inputFile in $inputFiles) {
    $fileNoExtension = [System.IO.Path]::ChangeExtension($inputFile, ".mp3")
    Write-Output $inputFile
    Write-Output $fileNoExtension
    
    & ffmpeg -i $inputFile -ar 44100 -ac 2 -b:a 320k $fileNoExtension
}

Pause