# Convert ASL Operational Manual from Markdown to Word
# Requires: Pandoc installed (https://pandoc.org/installing.html)

[CmdletBinding()]
param(
    [Parameter()]
    [string]$InputFile = "OPERATIONAL_MANUAL.md",
    
    [Parameter()]
    [string]$OutputFile = "ASL_Operational_Manual.docx",
    
    [Parameter()]
    [switch]$OpenAfterConversion
)

# Check if Pandoc is installed
$pandocInstalled = Get-Command pandoc -ErrorAction SilentlyContinue

if (-not $pandocInstalled) {
    Write-Host "ERROR: Pandoc is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Pandoc from: https://pandoc.org/installing.html" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Installation methods:" -ForegroundColor Cyan
    Write-Host "  1. Using Chocolatey:  choco install pandoc" -ForegroundColor White
    Write-Host "  2. Using Winget:      winget install --id JohnMacFarlane.Pandoc" -ForegroundColor White
    Write-Host "  3. Download installer from pandoc.org" -ForegroundColor White
    exit 1
}

# Get script directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$inputPath = Join-Path $scriptDir $InputFile
$outputPath = Join-Path $scriptDir $OutputFile

# Check if input file exists
if (-not (Test-Path $inputPath)) {
    Write-Host "ERROR: Input file not found: $inputPath" -ForegroundColor Red
    exit 1
}

Write-Host "Converting Markdown to Word..." -ForegroundColor Cyan
Write-Host "  Input:  $inputPath" -ForegroundColor Gray
Write-Host "  Output: $outputPath" -ForegroundColor Gray
Write-Host ""

try {
    # Convert with Pandoc
    # Options:
    #   --toc = Table of Contents
    #   --toc-depth=3 = Include up to heading level 3
    #   --highlight-style=tango = Code syntax highlighting
    #   -s = Standalone document
    
    $pandocArgs = @(
        $inputPath,
        "-o", $outputPath,
        "--toc",
        "--toc-depth=3",
        "--highlight-style=tango",
        "-s"
    )
    
    & pandoc @pandocArgs
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Conversion successful!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Document created: $outputPath" -ForegroundColor Green
        Write-Host ""
        Write-Host "Next steps:" -ForegroundColor Yellow
        Write-Host "  1. Open the Word document" -ForegroundColor White
        Write-Host "  2. Add screenshots at [SCREENSHOT PLACEHOLDER] locations" -ForegroundColor White
        Write-Host "  3. Adjust formatting as needed" -ForegroundColor White
        Write-Host "  4. Save and distribute" -ForegroundColor White
        Write-Host ""
        
        # Get file size
        $fileInfo = Get-Item $outputPath
        $fileSizeMB = [math]::Round($fileInfo.Length / 1MB, 2)
        Write-Host "File size: $fileSizeMB MB" -ForegroundColor Gray
        
        # Open file if requested
        if ($OpenAfterConversion) {
            Write-Host "Opening document..." -ForegroundColor Cyan
            Start-Process $outputPath
        }
    }
    else {
        Write-Host "✗ Conversion failed!" -ForegroundColor Red
        Write-Host "Pandoc exit code: $LASTEXITCODE" -ForegroundColor Red
        exit $LASTEXITCODE
    }
}
catch {
    Write-Host "✗ Error during conversion: $_" -ForegroundColor Red
    exit 1
}
