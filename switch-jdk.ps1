$jdkVer = $args[0]


$installedJdks = @{
    8 = @{
        jdkHome = "C:\Program Files\Java\jdk1.8.0_341"
    };

    11 = @{
        jdkHome = "C:\Program Files\Java\jdk-11.0.16"
    };

    17 = @{
        jdkHome = "C:\Program Files\Java\jdk-17.0.4"
    }
}

if ($installedJdks.ContainsKey($jdkVer)){
    Write-Host 'Switching to JDK :' $jdkVer
    Write-Host 'Setting JAVA_HOME to : ' $installedJdks[$jdkVer]["jdkHome"]

    $env:JAVA_HOME = $installedJdks[$jdkVer]["jdkHome"]
    $env:Path = $env:JAVA_HOME+'\bin;'+$env:Path

    Write-Host '--------------------'
    java -version

} else {
    Write-Host 'This version of JDK is not installed. Please check.'
    Write-Host 'Available JDK versions are ' $installedJdks.Keys
}

Write-Host
