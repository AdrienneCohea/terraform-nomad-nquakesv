exec mvdsv.cfg     // server settings
exec ktx.cfg       // mod settings
exec address.cfg   // discovered address
exec pwd.cfg       // password settings
exec vip_ip.cfg    // vip ip settings
exec ban_ip.cfg    // ban list

setmaster master.quakeservers.net:27000 qwmaster.ocrana.de:27000 qwmaster.fodquake.net:27000

// create localinfo 1000-2000 for existing maps
check_maps

// turn off serverip cvar
sv_getrealip 0

// default to bot mode off when map is reset (saves some CPU)
set k_fb_enabled 0

// .txt files generated next to .mvd files will be in json format
set k_demotxt_format json 

sv_logdir logs
logplayers
logrcon
