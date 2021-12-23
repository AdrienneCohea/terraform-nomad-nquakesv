// IP BASED VIP
//
//  1 - normal VIP (default)
//  2 - not kickable VIP by elected admins
//  4 - VIP with admin rights
//  8 - VIP with demo admin rights
// 16 - VIP with judge rights
// 32 - VIP with rcon admin rights
//
// examples:
//  vip_addip 1.2.3.4 2  = not kickable VIP
//  vip_addip 1.2.3.4 6  = not kickable VIP with admin rights
//  vip_addip 1.2.3.4 63 = VIP with all permissions

%{ for ip in admin_client_ips }
vip_addip ${ip} 63
%{ endfor } 


// CHANGE & UNCOMMENT THESE! (1=normal vip, 6=not kickable real admin)
//vip_password    "changethis changethistoo"
//vip_values      "1          6            "
