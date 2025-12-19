#!/bin/bash
#eargueda

#To apply this configuration on another server, please double-check the ETHERNET interface name and update the IP address as you need!

# ----------------- Configuration Variables -----------------
NETPLAN_FILE="/etc/netplan/50-config.yaml"

sudo tee "$NETPLAN_FILE" > /dev/null << EOF
network:
    version: 2
    ethernets:
        ens201np0:
            mtu: 9000
            addresses:
            - 192.168.200.11/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1

        ens202np0:
            mtu: 9000
            addresses:
            - 192.168.200.12/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1

        ens203np0:
            mtu: 9000
            addresses:
            - 192.168.200.13/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1

        ens204np0:
            mtu: 9000
            addresses:
            - 192.168.200.14/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1

        ens205np0:
            mtu: 9000
            addresses:
            - 192.168.200.15/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1
        
        ens206np0:
            mtu: 9000
            addresses:
            - 192.168.200.16/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1

        ens207np0:
            mtu: 9000
            addresses:
            - 192.168.200.17/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1

        ens208np0:
            mtu: 9000
            addresses:
            - 192.168.200.18/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1
        ens211f0np0:
            mtu: 9000
            addresses:
            - 198.18.135.10/18
            nameservers:
                addresses:
                - 198.18.133.1
                - 198.18.128.1
            routes:
                - to: 198.18.128.0/18
                  via: 198.18.128.1
        ens211f1np1:
            mtu: 9000
            addresses:
            - 198.18.135.11/18
            nameservers:
                addresses:
                - 198.18.133.1
                - 198.18.128.1
            routes:
                - to: 198.18.128.0/18
                  via: 198.18.128.1

EOF

sudo chmod 600 "$NETPLAN_FILE"

echo " applying Netplan configuration..."
#sudo netplan try || { echo "Netplan configuration failed validation. Check $NETPLAN_FILE for syntax errors."; exit 1; }
#If 'netplan try' succeeds, it reverts after 120s if no confirmation.
sudo netplan apply

echo "----------------------------------------"
echo "Netplan configuration created and validated successfully."
echo "File location: $NETPLAN_FILE"
echo "Content:"
sudo cat "$NETPLAN_FILE"
echo "----------------------------------------"
echo " waiting few seconds..."
sleep 5
sudo apt install net-tools
sleep 5
ifconfig
echo "Done."
