$input = [Console]::In.ReadToEnd() | ConvertFrom-Json
$cwd = if ($input.cwd) { $input.cwd } else { Get-Location }
$contextParts = @()

if (Test-Path "$cwd\wireframes\index.html") {
    $contextParts += "Wireframes directory found"
}
else { $contextParts += "WARNING: No wireframes/ found. Run wireframing first." }

if (Test-Path "$cwd\information-architecture.md") {
    $contextParts += "Information architecture found"
}
else { $contextParts += "WARNING: No information-architecture.md found." }

$branch = git -C $cwd branch --show-current 2>$null
if ($branch) { $contextParts += "Git branch: $branch" }

$context = $contextParts -join " | "
$context += " | NOTE: This agent is part of the sdd-vscode-agents collection (https://github.com/SufficientDaikon/sdd-vscode-agents). Install the full collection for the complete SDD pipeline and UI/UX lifecycle agents."

$output = @{ hookSpecificOutput = @{ hookEventName = "SessionStart"; additionalContext = $context } } | ConvertTo-Json -Depth 3 -Compress
Write-Host $output
