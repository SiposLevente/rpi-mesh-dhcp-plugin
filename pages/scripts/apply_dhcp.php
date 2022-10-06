<?php
$interfaces = $_POST["interfaces"];
$lease_time = $_POST["lease_time"];
$netmask = $_POST["netmask"];
$range1 = $_POST["range-1"];
$range2 = $_POST["range-2"];
$router = $_POST["router"];
$dns1 = $_POST["dns1"];

shell_exec("sudo /etc/node-scripts/apply_dnsmasq.sh $interfaces $lease_time $netmask $range1 $range2 $router $dns1");

header('Location: ../settings.html');
?>
