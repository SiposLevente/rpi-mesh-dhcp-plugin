<?php
$interfaces = $_POST["interfaces"];
$lease_time = $_POST["lease_time"];
$netmask = $_POST["netmask"];
$range1 = $_POST["range-1"];
$range2 = $_POST["range-2"];
$router = $_POST["router"];
$dns1 = $_POST["dns1"];
$dns2 = $_POST["dns2"];

if ($router == "") {
    $router = "null"
}

if ($dns1 == "") {
    $dns1 = "null"
}

if ($dns2 == "") {
    $dns2 = "null"
}

shell_exec("sudo /etc/node-scripts/apply_dnsmasq.sh $interfaces $lease_time $netmask $range1 $range2 $router $dns1 dns1");

header('Location: ../settings.html');
?>
