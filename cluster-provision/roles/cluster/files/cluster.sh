cluster="base6"
     public_bridge="br0"
     private_bridge="br1"
     for i in {1001,1002,1005,1006,1007,1008,1009}
     do
     vzctl create $i  --ostemplate centos-6-x86_64
     if [ $i == 1001 ]
     then
     vzctl set $i --hostname router.$cluster.vlabs.ac.in --save
     vzctl set $i --netif_add eth0,,,,$public_bridge --save
     vzctl set $i --netif_add eth1,,,,$private_bridge --save
     vzctl start $i
     vzctl set $i --onboot yes --save
     elif [ $i == 1002 ]
     then 
     vzctl set $i --hostname ansible.$cluster.vlabs.ac.in --save
     vzctl set $i --netif_add eth0,,,,$public_bridge --save
     vzctl set $i --netif_add eth1,,,,$private_bridge --save
     vzctl start $i
     vzctl set $i --onboot yes --save
     elif [ $i == 1005 ]
     then
     vzctl set $i --hostname privatedns.$cluster.vlabs.ac.in --save
     vzctl set $i --netif_add eth1,,,,$private_bridge --save
     vzctl start $i
     vzctl set $i --onboot yes --save
     
     elif [ $i == 1006 ]
     then
     vzctl set $i --hostname publicdns.$cluster.vlabs.ac.in --save
     vzctl set $i --netif_add eth1,,,,$private_bridge --save
     vzctl start $i
     vzctl set $i --onboot yes --save
     elif [ $i == 1007 ]
     then
     vzctl set $i --hostname reverseproxy.$cluster.vlabs.ac.in --save
     vzctl set $i --netif_add eth1,,,,$private_bridge --save
     vzctl start $i
     vzctl set $i --onboot yes --save
     elif [ $i == 1009 ]
     then
     vzctl set $i --hostname ads.$cluster.vlabs.ac.in --save
     vzctl set $i --netif_add eth1,,,,$private_bridge --diskspace 20G --save
     vzctl start $i
     vzctl set $i --onboot yes --save
     fi
     done
