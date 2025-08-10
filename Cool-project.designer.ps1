[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[SYstem.Windows.Forms.Application]::EnableVisualStyles()
$Cool-project = New-Object -TypeName System.Windows.Forms.Form
function InitializeComponent
{
$Cool-project.SuspendLayout()
#
#Cool-project
#
$Cool-project.Name = 'Cool-project'
$Cool-project.ResumeLayout($false)
}

InitializeComponent