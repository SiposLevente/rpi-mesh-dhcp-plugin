const IP_PLACEHOLDER = "xxx.xxx.xxx.xxx";
var interfaces = [];

$.ajax({
        method: "POST",
        url: "../../../scripts/interfaceIp.php",
    })
    .done(function(response) {
        var data_entries = response.replaceAll(/<.?p>|<.?span>/gm, '').split('\n').filter(function(element) {
            return element != ""
        });
        var selector = document.getElementById("dhcp_selector");
        for (var i = 0; i < data_entries.length; i++) {

            var split_data = data_entries[i].split('/');
            var interface_plus_ip = split_data[0].split(':');
            if (interface_plus_ip[1].trim() == "Offline") {
                interfaces[i] = {
                    interface: interface_plus_ip[0],
                    ip: IP_PLACEHOLDER,
                    mask: "24"
                };
            } else {
                interfaces[i] = {
                    interface: interface_plus_ip[0],
                    ip: interface_plus_ip[1].trim(),
                    mask: split_data[1].trim()
                };
            }
            selector.options[selector.options.length] = new Option(interfaces[i].interface, interfaces[i].interface);

        }
    });


$.ajax({
        method: "POST",
        url: "./scripts/get_dnsmasq_status.php",
    })
    .done(function(response) {
    status_placeholder= document.getElementById("dhcp-status");
        status_placeholder.innerHTML = response;


    });

function toggle_dhcp() {
    var interface = interfaces[selector.selectedIndex].interface;
    $.ajax({
            method: "POST",
            url: "./scripts/toggle_dhcp.php",
            data: {}
        })
        .done(function(response) {});
}
