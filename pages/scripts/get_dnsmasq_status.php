<?php
$active = exec("systemctl is-active dnsmasq.service");
$result = "";
if($active == "active")
{
    $result = "ON ";
}
else
{
    $result =  "OFF ";
}

echo $result;
?>
