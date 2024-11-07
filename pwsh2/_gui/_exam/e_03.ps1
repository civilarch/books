Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$Question = [System.Drawing.Image]::Fromfile('C:\scripts\Icons\Question.jpg')
$Clear = [System.Drawing.Image]::Fromfile('C:\scripts\Icons\Clear.jpg')
$Sunny = [System.Drawing.Image]::Fromfile('C:\scripts\Icons\Sunny.jpg')

# Label to Display Location

$CityLabel = New-Object Windows.Forms.Label
$CityLabel.Text = ""
$CityLabel.Font = New-Object Drawing.Font("Arial", 36, [Drawing.FontStyle]::Bold)
$CityLabel.AutoSize = $true
$CityLabel.Location = New-Object Drawing.Point(10,10)
$CityLabel.ForeColor = [System.Drawing.Color]::Black

# Label to Display Please Wait Message That is Displayed While the Script is Parsing Data

$PleaseWaitLabel = New-Object Windows.Forms.Label
$PleaseWaitLabel.Text = "Please Wait"
$PleaseWaitLabel.Font = New-Object Drawing.Font("Arial", 36, [Drawing.FontStyle]::Bold)
$PleaseWaitLabel.AutoSize = $true
$PleaseWaitLabel.Location = New-Object Drawing.Point(550,450)
$PleaseWaitLabel.ForeColor = [System.Drawing.Color]::Black

# Label to select a time period for a detailed forecast
$DetailLabel = New-Object Windows.Forms.Label
$DetailLabel.Text = "Make a Selection for Detailed Forecast: "
$DetailLabel.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$DetailLabel.AutoSize = $true
$DetailLabel.Location = New-Object Drawing.Point(10,425)
$DetailLabel.ForeColor = [System.Drawing.Color]::Black

# Combo Box for Detailed Forecast

$DropDown = New-Object system.Windows.Forms.ComboBox
$DropDown.text = “”
$DropDown.width = 200
$DropDown.autosize = $true
$DropDown.location = New-Object System.Drawing.Point(500,425)
$DropDown.Font = ‘Microsoft Sans Serif,18’
# Add the items in the dropdown list


# Detailed Forecast
$DisplayDetailedForecast = New-Object System.Windows.Forms.textbox
$DisplayDetailedForecast.Text = ""
$DisplayDetailedForecast.Multiline = $True
$DisplayDetailedForecast.Size = New-Object System.Drawing.Size(800,100)
$DisplayDetailedForecast.Location = new-object System.Drawing.Size(20,475)
$DisplayDetailedForecast.Font=New-Object System.Drawing.Font("Lucida Console",16,[System.Drawing.FontStyle]::Regular)


# Label to display prompt to enter your zip code

$ZipLabel = New-Object Windows.Forms.Label
$ZipLabel.Text = "Please Enter Your Zip Code: "
$ZipLabel.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$ZipLabel.AutoSize = $true
$ZipLabel.Location = New-Object Drawing.Point(10,425)
$ZipLabel.ForeColor = [System.Drawing.Color]::Black

# Field for entering your zip code

$ZipField = New-Object System.Windows.Forms.textbox
$ZipField.Text = ""
$ZipField.Multiline = $False
$ZipField.Size = New-Object System.Drawing.Size(80,100)
$ZipField.Location = new-object System.Drawing.Size(360,425)
$ZipField.Font=New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)

# Submit button used when entering a zip code

$ZipSubmitButton = New-Object System.Windows.Forms.Button
$ZipSubmitButton.Location = New-Object System.Drawing.Size (20,475)
$ZipSubmitButton.Size = New-Object System.Drawing.Size(160,30)
$ZipSubmitButton.Font=New-Object System.Drawing.Font("Lucida Console",18,[System.Drawing.FontStyle]::Regular)
$ZipSubmitButton.BackColor = "LightGray"
$ZipSubmitButton.Text = "Submit"
$ZipSubmitButton.Add_Click({
            $MyZip=$ZipField.Text
            Give-Forecast $MyZip
            })



# Objects for Period 1

$DayLabel1 = New-Object Windows.Forms.Label
$DayLabel1.Text = ""
$DayLabel1.Font = New-Object Drawing.Font("Arial", 12, [Drawing.FontStyle]::Bold)
$DayLabel1.AutoSize = $true
$DayLabel1.Location = New-Object Drawing.Point(5,10)
$DayLabel1.ForeColor = [System.Drawing.Color]::Black

$Icon1 = new-object Windows.Forms.PictureBox 
$Icon1.width=100
$Icon1.height=100
$Icon1.top=60
$Icon1.left=30
$Icon1.Image=$image

$TempLabel1 = New-Object Windows.Forms.Label
$TempLabel1.Text = ""
$TempLabel1.Font = New-Object Drawing.Font("Arial", 36, [Drawing.FontStyle]::Bold)
$TempLabel1.AutoSize = $true
$TempLabel1.Location = New-Object Drawing.Point(40,160)
$TempLabel1.ForeColor = [System.Drawing.Color]::Black

$WindLabel1 = New-Object Windows.Forms.Label
$WindLabel1.Text = ""
$WindLabel1.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel1.AutoSize = $true
$WindLabel1.Location = New-Object Drawing.Point(10,220)
$WindLabel1.ForeColor = [System.Drawing.Color]::Black

$WindLabel1B = New-Object Windows.Forms.Label
$WindLabel1B.Text = ""
$WindLabel1B.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel1B.AutoSize = $true
$WindLabel1B.Location = New-Object Drawing.Point(25,255)
$WindLabel1B.ForeColor = [System.Drawing.Color]::Black

$GroupBox1 = New-Object 'System.Windows.Forms.GroupBox'
$GroupBox1.Location = New-Object System.Drawing.Size (10,100)
$GroupBox1.Size = New-Object System.Drawing.Size(150,300)
$GroupBox1.BackColor='Pink'
$groupbox1.Controls.Add($DayLabel1)
$groupbox1.Controls.Add($Icon1)
$groupbox1.Controls.Add($TempLabel1)
$groupbox1.Controls.Add($WindLabel1)
$groupbox1.Controls.Add($WindLabel1B)

# Objects for Period 2

$DayLabel2 = New-Object Windows.Forms.Label
$DayLabel2.Text = ""
$DayLabel2.Font = New-Object Drawing.Font("Arial", 12, [Drawing.FontStyle]::Bold)
$DayLabel2.AutoSize = $true
$DayLabel2.Location = New-Object Drawing.Point(5,10)
$DayLabel2.ForeColor = [System.Drawing.Color]::Black

$Icon2 = new-object Windows.Forms.PictureBox 
$Icon2.width=100
$Icon2.height=100
$Icon2.top=60
$Icon2.left=30
$Icon2.Image=$image

$TempLabel2 = New-Object Windows.Forms.Label
$TempLabel2.Text = ""
$TempLabel2.Font = New-Object Drawing.Font("Arial", 36, [Drawing.FontStyle]::Bold)
$TempLabel2.AutoSize = $true
$TempLabel2.Location = New-Object Drawing.Point(40,160)
$TempLabel2.ForeColor = [System.Drawing.Color]::Black

$WindLabel2 = New-Object Windows.Forms.Label
$WindLabel2.Text = ""
$WindLabel2.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel2.AutoSize = $true
$WindLabel2.Location = New-Object Drawing.Point(10,220)
$WindLabel2.ForeColor = [System.Drawing.Color]::Black

$WindLabel2B = New-Object Windows.Forms.Label
$WindLabel2B.Text = ""
$WindLabel2B.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel2B.AutoSize = $true
$WindLabel2B.Location = New-Object Drawing.Point(25,255)
$WindLabel2B.ForeColor = [System.Drawing.Color]::Black

$GroupBox2 = New-Object 'System.Windows.Forms.GroupBox'
$GroupBox2.Location = New-Object System.Drawing.Size (210,100)
$GroupBox2.Size = New-Object System.Drawing.Size(150,300)
$GroupBox2.BackColor='Pink'
$groupbox2.Controls.Add($DayLabel2)
$groupbox2.Controls.Add($Icon2)
$groupbox2.Controls.Add($TempLabel2)
$groupbox2.Controls.Add($WindLabel2)
$groupbox2.Controls.Add($WindLabel2B)



# Objects for Period 3

$DayLabel3 = New-Object Windows.Forms.Label
$DayLabel3.Text = ""
$DayLabel3.Font = New-Object Drawing.Font("Arial", 12, [Drawing.FontStyle]::Bold)
$DayLabel3.AutoSize = $true
$DayLabel3.Location = New-Object Drawing.Point(5,10)
$DayLabel3.ForeColor = [System.Drawing.Color]::Black

$Icon3 = new-object Windows.Forms.PictureBox 
$Icon3.width=100
$Icon3.height=100
$Icon3.top=60
$Icon3.left=30
$Icon3.Image=$image

$TempLabel3 = New-Object Windows.Forms.Label
$TempLabel3.Text = ""
$TempLabel3.Font = New-Object Drawing.Font("Arial", 36, [Drawing.FontStyle]::Bold)
$TempLabel3.AutoSize = $true
$TempLabel3.Location = New-Object Drawing.Point(40,160)
$TempLabel3.ForeColor = [System.Drawing.Color]::Black

$WindLabel3 = New-Object Windows.Forms.Label
$WindLabel3.Text = ""
$WindLabel3.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel3.AutoSize = $true
$WindLabel3.Location = New-Object Drawing.Point(10,220)
$WindLabel3.ForeColor = [System.Drawing.Color]::Black

$WindLabel3B = New-Object Windows.Forms.Label
$WindLabel3B.Text = ""
$WindLabel3B.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel3B.AutoSize = $true
$WindLabel3B.Location = New-Object Drawing.Point(25,255)
$WindLabel3B.ForeColor = [System.Drawing.Color]::Black

$GroupBox3 = New-Object 'System.Windows.Forms.GroupBox'
$GroupBox3.Location = New-Object System.Drawing.Size (410,100)
$GroupBox3.Size = New-Object System.Drawing.Size(150,300)
$GroupBox3.BackColor='Pink'
$groupbox3.Controls.Add($DayLabel3)
$groupbox3.Controls.Add($Icon3)
$groupbox3.Controls.Add($TempLabel3)
$groupbox3.Controls.Add($WindLabel3)
$groupbox3.Controls.Add($WindLabel3B)



# Objects for Period 4

$DayLabel4 = New-Object Windows.Forms.Label
$DayLabel4.Text = ""
$DayLabel4.Font = New-Object Drawing.Font("Arial", 12, [Drawing.FontStyle]::Bold)
$DayLabel4.AutoSize = $true
$DayLabel4.Location = New-Object Drawing.Point(5,10)
$DayLabel4.ForeColor = [System.Drawing.Color]::Black

$Icon4 = new-object Windows.Forms.PictureBox 
$Icon4.width=100
$Icon4.height=100
$Icon4.top=60
$Icon4.left=30
$Icon4.Image=$image

$TempLabel4 = New-Object Windows.Forms.Label
$TempLabel4.Text = ""
$TempLabel4.Font = New-Object Drawing.Font("Arial", 36, [Drawing.FontStyle]::Bold)
$TempLabel4.AutoSize = $true
$TempLabel4.Location = New-Object Drawing.Point(40,160)
$TempLabel4.ForeColor = [System.Drawing.Color]::Black

$WindLabel4 = New-Object Windows.Forms.Label
$WindLabel4.Text = ""
$WindLabel4.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel4.AutoSize = $true
$WindLabel4.Location = New-Object Drawing.Point(10,220)
$WindLabel4.ForeColor = [System.Drawing.Color]::Black

$WindLabel4B = New-Object Windows.Forms.Label
$WindLabel4B.Text = ""
$WindLabel4B.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel4B.AutoSize = $true
$WindLabel4B.Location = New-Object Drawing.Point(25,255)
$WindLabel4B.ForeColor = [System.Drawing.Color]::Black

$GroupBox4 = New-Object 'System.Windows.Forms.GroupBox'
$GroupBox4.Location = New-Object System.Drawing.Size (610,100)
$GroupBox4.Size = New-Object System.Drawing.Size(150,300)
$GroupBox4.BackColor='Pink'
$groupbox4.Controls.Add($DayLabel4)
$groupbox4.Controls.Add($Icon4)
$groupbox4.Controls.Add($TempLabel4)
$groupbox4.Controls.Add($WindLabel4)
$groupbox4.Controls.Add($WindLabel4B)



# Objects for Period 5

$DayLabel5 = New-Object Windows.Forms.Label
$DayLabel5.Text = ""
$DayLabel5.Font = New-Object Drawing.Font("Arial", 12, [Drawing.FontStyle]::Bold)
$DayLabel5.AutoSize = $true
$DayLabel5.Location = New-Object Drawing.Point(5,10)
$DayLabel5.ForeColor = [System.Drawing.Color]::Black

$Icon5 = new-object Windows.Forms.PictureBox 
$Icon5.width=100
$Icon5.height=100
$Icon5.top=60
$Icon5.left=30
$Icon5.Image=$image

$TempLabel5 = New-Object Windows.Forms.Label
$TempLabel5.Text = ""
$TempLabel5.Font = New-Object Drawing.Font("Arial", 36, [Drawing.FontStyle]::Bold)
$TempLabel5.AutoSize = $true
$TempLabel5.Location = New-Object Drawing.Point(40,160)
$TempLabel5.ForeColor = [System.Drawing.Color]::Black

$WindLabel5 = New-Object Windows.Forms.Label
$WindLabel5.Text = ""
$WindLabel5.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel5.AutoSize = $true
$WindLabel5.Location = New-Object Drawing.Point(10,220)
$WindLabel5.ForeColor = [System.Drawing.Color]::Black

$WindLabel5B = New-Object Windows.Forms.Label
$WindLabel5B.Text = ""
$WindLabel5B.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel5B.AutoSize = $true
$WindLabel5B.Location = New-Object Drawing.Point(25,255)
$WindLabel5B.ForeColor = [System.Drawing.Color]::Black

$GroupBox5 = New-Object 'System.Windows.Forms.GroupBox'
$GroupBox5.Location = New-Object System.Drawing.Size (810,100)
$GroupBox5.Size = New-Object System.Drawing.Size(150,300)
$GroupBox5.BackColor='Pink'
$groupbox5.Controls.Add($DayLabel5)
$groupbox5.Controls.Add($Icon5)
$groupbox5.Controls.Add($TempLabel5)
$groupbox5.Controls.Add($WindLabel5)
$groupbox5.Controls.Add($WindLabel5B)



# Objects for Period 6

$DayLabel6 = New-Object Windows.Forms.Label
$DayLabel6.Text = ""
$DayLabel6.Font = New-Object Drawing.Font("Arial", 12, [Drawing.FontStyle]::Bold)
$DayLabel6.AutoSize = $true
$DayLabel6.Location = New-Object Drawing.Point(5,10)
$DayLabel6.ForeColor = [System.Drawing.Color]::Black

$Icon6 = new-object Windows.Forms.PictureBox 
$Icon6.width=100
$Icon6.height=100
$Icon6.top=60
$Icon6.left=30
$Icon6.Image=$image

$TempLabel6 = New-Object Windows.Forms.Label
$TempLabel6.Text = ""
$TempLabel6.Font = New-Object Drawing.Font("Arial", 36, [Drawing.FontStyle]::Bold)
$TempLabel6.AutoSize = $true
$TempLabel6.Location = New-Object Drawing.Point(40,160)
$TempLabel6.ForeColor = [System.Drawing.Color]::Black

$WindLabel6 = New-Object Windows.Forms.Label
$WindLabel6.Text = ""
$WindLabel6.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel6.AutoSize = $true
$WindLabel6.Location = New-Object Drawing.Point(10,220)
$WindLabel6.ForeColor = [System.Drawing.Color]::Black

$WindLabel6B = New-Object Windows.Forms.Label
$WindLabel6B.Text = ""
$WindLabel6B.Font = New-Object Drawing.Font("Arial", 18, [Drawing.FontStyle]::Bold)
$WindLabel6B.AutoSize = $true
$WindLabel6B.Location = New-Object Drawing.Point(25,255)
$WindLabel6B.ForeColor = [System.Drawing.Color]::Black

$GroupBox6 = New-Object 'System.Windows.Forms.GroupBox'
$GroupBox6.Location = New-Object System.Drawing.Size (1010,100)
$GroupBox6.Size = New-Object System.Drawing.Size(150,300)
$GroupBox6.BackColor='Pink'
$groupbox6.Controls.Add($DayLabel6)
$groupbox6.Controls.Add($Icon6)
$groupbox6.Controls.Add($TempLabel6)
$groupbox6.Controls.Add($WindLabel6)
$groupbox6.Controls.Add($WindLabel6B)




########   Give Forecast Function  ################


Function Give-Forecast
{
Param($MyZip)


# Clear the Screen

$Form.Controls.Remove($ZipLabel)
$Form.Controls.Remove($ZipField)
$Form.Controls.Remove($ZipSubmitButton)
$Form.Controls.Add($PleaseWaitLabel)

# Display a Please Wait Message that is displayed while data loads


# Import the Zip Code Data From the CSV File
# The data came from: https://simplemaps.com/data/us-zips

$ZipData=Import-CSV -Path C:\Scripts\ZipCodeData\USZips.csv
$MyData=$ZipData | Where-Object {$_.Zip -eq $MyZip}

# Acquire Latitude, Longitude, City, and State

$MyLat = $MyData.Lat
$MyLong = $MyData.lng
$MyCity = $MyData.City
$MyState = $MyData.State_Name
$MyCityState = "Forecast for $MyCity, $MyState"

# Normalize Latitude and Longitude by dropping the last digit of each

$MyLat=$MyLat.SubString(0,$MyLat.Length-1)
$MyLong=$MyLong.SubString(0,$MyLong.Length-1)

# Assemble URI that will be used to retrieve the forecast grid
$URI='https://api.weather.gov/points/'+$MyLat+','+$MyLong


# Make API Call to retrieve weather forecast grid
$Grid=Invoke-RestMethod -Method Get -URI $URI
$ForecastURI=$Grid.Properties.Forecast


# Make API Call to Get the Forecast
$RawForecastData=Invoke-RestMethod -Method Get -URI $ForecastURI

# Assemble the Data for each day (the period)

$Global:PeriodName = @($RawForecastData.Properties.Periods.Name | Select-Object -First 7)
$Temperature = @($RawForecastData.Properties.Periods.Temperature | Select-Object -First 7)
$Wind = @($RawForecastData.Properties.Periods.WindSpeed | Select-Object -First 7)
$WindDirection = @($RawForecastData.Properties.Periods.WindDirection | Select-Object -First 7)
$ShortForecast = @($RawForecastData.Properties.Periods.ShortForecast | Select-Object -First 7)
$Global:DetailedForecast = @($RawForecastData.Properties.Periods.DetailedForecast | Select-Object -First 7)





# Loop to display data

# Add selections to Drop Down Menu

For ($Period=1; $Period -le 6; $Period++){
            $DropDown.Items.Add($PeriodName[$Period-1])

           
# Populate Day of the Week
            $InstructionString='$DayLabel' + $Period + '.Text="' + $PeriodName[$Period-1] + '"'
            Invoke-Expression $InstructionString


# Choose Icons

            Switch ($ShortForecast[$Period])
                        {
                        'Clear' {$InstructionString='$Icon' + $Period + '.Image=$Clear'}
                        'Sunny' {$InstructionString='$Icon' + $Period + '.Image=$Sunny'}
                        Default {$InstructionString='$Icon' + $Period + '.Image=$Question'}
                        }
    
            Invoke-Expression $InstructionString



# Temperature
            $InstructionString='$TempLabel' + $Period + '.Text="' + $Temperature[$Period-1] + '"'
            Invoke-Expression $InstructionString

           
# Wind Speed

            $InstructionString='$WindLabel' + $Period + '.Text="' + $Wind[$Period-1] + '"'
            Invoke-Expression $InstructionString

# Wind Direction

            $InstructionString='$WindLabel' + $Period + 'B.Text="' + $WindDirection[$Period-1] + '"'
            Invoke-Expression $InstructionString
            }



# Clear the Please Wait Message
$Form.Controls.Remove($PleaseWaitLabel)

#Display the controls that will show the weather forecast
$Form.Controls.Add($CityLabel)
$Form.Controls.Add($GroupBox1)
$Form.Controls.Add($GroupBox2)
$Form.Controls.Add($GroupBox3)
$Form.Controls.Add($GroupBox4)
$Form.Controls.Add($GroupBox5)
$Form.Controls.Add($GroupBox6)
$Form.Controls.Add($DetailLabel)
$Form.Controls.Add($DropDown)
$Form.Controls.Add($DisplayDetailedForecast)



#Populate the City Label with the forecast city and state
$CityLabel.Text = $MyCityState

# Logic to detect day selected for the detailed forecast

$DropDown.add_SelectedIndexChanged({
$Selected = $DropDown.SelectedIndex
$Day=$Global:PeriodName[$Selected]
$DetailedWeatherForecast=$Global:DetailedForecast[$Selected]
$DisplayDetailedForecast.Text = 'The Forecast for ' + $Day + ' is ' + $DetailedWeatherForecast
})


}
###   End of Function  ####




$Form = New-Object Windows.Forms.Form  
$Form.Text = "PowerShell Form"
$Form.Width = 1200
$Form.Height = 1000
$Form.BackColor="Silver"






# Add Controls to Form That Will Allow User to Enter Zip Code

$Form.Controls.Add($ZipLabel)
$Form.Controls.Add($ZipField)
$Form.Controls.Add($ZipSubmitButton)

# Display Form

$Form.Add_Shown({$Form.Activate()})
$Form.ShowDialog()



