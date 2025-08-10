. (Join-Path $PSScriptRoot 'Cool-project.designer.ps1')
Add-Type -AssemblyName System.Windows.Forms, System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()
# Create the form
#$form.Icon = $Formatter_binaryFomatter.Deserialize($System_IO_MemoryStream)
#$Formatter_binaryFomatter 
#$System_IO_MemoryStrea
#$form.icon=$($PSScriptRoot)'c:\users\dave5\downloads\watford-fc.png'


$form                   = New-Object Windows.Forms.Form
$form.Text              = 'Activation'
$form.Icon              = ([System.Drawing.Icon]$resources.'C:\Users\Dave 5\Pictures\Watford_result_result.ico')
$form.Size              = New-Object System.Drawing.Size(275,250)
$form.StartPosition     = [System.Windows.Forms.FormStartPosition]::CenterScreen

# Create the collection of radio buttons
$RadioButton1           = New-Object System.Windows.Forms.RadioButton
$RadioButton1.Location  = '60,20' 
$RadioButton1.AutoSize  = $true
$RadioButton1.Checked   = $false 
$RadioButton1.Text      = 'Windows 10 and Office'
$Radiobutton1.add_click({ if ($Radiobutton1.Checked=$true) {$EnterButton.Enabled=$true}}) 


$RadioButton2           = New-Object System.Windows.Forms.RadioButton
$RadioButton2.Location  = '60,60'
$RadioButton2.AutoSize  = $true
$RadioButton2.Checked   = $false
$RadioButton2.Text      = 'Windows 10 only'
$Radiobutton2.add_click({ if ($Radiobutton2.Checked=$true) {$EnterButton.Enabled=$true}}) 

$RadioButton3           = New-Object System.Windows.Forms.RadioButton
$RadioButton3.Location  = '60,100'
$RadioButton3.AutoSize  = $true
$RadioButton3.Checked   = $false
$RadioButton3.Text      = 'Office only'
$Radiobutton3.add_click({if($Radiobutton3.Checked=$true) {$EnterButton.Enabled=$true}})  

# Create button control
$EnterButton            = New-Object System.Windows.Forms.Button
$EnterButton.BackColor  = "green"
$EnterButton.text       = "Enter"
$EnterButton.Size       = New-Object System.Drawing.Point (70,30)
$EnterButton.location   = New-Object System.Drawing.Point(55,150)
$EnterButton.ForeColor  = "#ffffff"
$EnterButton.Enabled    = $false

$cancelButton           = New-Object System.Windows.Forms.Button
$cancelButton.BackColor = "red"
$cancelButton.text      = "Cancel"
$cancelButton.Size      = New-Object System.Drawing.Point (70,30)
$cancelButton.location  = New-Object System.Drawing.Point(125,150)
$cancelButton.ForeColor = "#ffffff"
$cancelButton.Enabled   = $true

# Event handler when click the buttons
# Check the current state of each radio button and respond accordingly

        $EnterButton.add_click({
                
        if ($RadioButton1.Checked -eq $True)                            
		{
		[System.Windows.Forms.MessageBox]::Show("You selected Activate Windows 10 and Office")
		start-process start-process -FilePath "E:\Activation\HWID_Activation.cmd" -verb runas -wait			
        start-process start-process -FilePath "E:\Activation\Ohook_Activation_AIO"-verb runas 			 
        }
		elseif ($RadioButton2.Checked -eq $True)
		{
		[System.Windows.Forms.MessageBox]::Show("You selected Activate Windows 10 only")
		start-process -FilePath "E:\Activation\HWID_Activation.cmd" -verb runas 
         }
		elseif ($RadioButton3.Checked -eq $True)
		{
		[System.Windows.Forms.MessageBox]::Show("You selected Activate Office only")
		 start-process -FilePath "E:\Activation\Ohook_Activation_AIO" -verb runas 
        }  
 } )

	
# Add the controls to the form then display the dialog.
$form.controls.AddRange(@($Radiobutton1,$RadioButton2,$RadioButton3,$cancelButton,$EnterButton))

	
                    		 
$cancelButton.add_click({
$form.Close()
})
$Cool-project.ShowDialog()