$UserList = Import-Csv -Path 'C:\temp\CorpUserlist.csv' 

foreach ($User in $UserList) {

     $Attributes = @{

        Enabled = $true
        ChangePasswordAtLogon = $false
#        Path = "OU=Users,DC=corp,DC=fivetalenttest,DC=com"

        Name = "$($User.First) $($User.Last)"
        UserPrincipalName = "$($User.First).$($User.Last)@corp.fivetalenttest.com"
        SamAccountName = "$($User.First).$($User.Last)"

        GivenName = $User.First
        Surname = $User.Last

        Company = $User.Company
        Department = $User.Department
        Title = $User.Title
        AccountPassword = "FTSPassword123" | ConvertTo-SecureString -AsPlainText -Force

     }

    New-ADUser @Attributes

}