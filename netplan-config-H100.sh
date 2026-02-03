#!/bin/bash
#eargueda

#To apply this configuration on another server, please double-check the ETHERNET interface name and update the IP address as you need!

# ----------------- Configuration Variables -----------------
NETPLAN_FILE="/etc/netplan/50-config.yaml"

sudo tee "$NETPLAN_FILE" > /dev/null << EOF
network:
    version: 2
    ethernets:
        ens201f0np0:
            mtu: 9000
            addresses:
            - 192.168.200.2/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1

        ens202f0np0:
            mtu: 9000
            addresses:
            - 192.168.200.3/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1


        ens203f0np0:
            mtu: 9000
            addresses:
            - 192.168.200.4/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1


        ens204f0np0:
            mtu: 9000
            addresses:
            - 192.168.200.5/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1

        ens205f0np0:
            mtu: 9000
            addresses:
            - 192.168.200.6/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1

        ens206f0np0:
            mtu: 9000
            addresses:
            - 192.168.200.7/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1


        ens207f0np0:
            mtu: 9000
            addresses:
            - 192.168.200.8/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1


        ens208f0np0:
            mtu: 9000
            addresses:
            - 192.168.200.9/24
            nameservers:
                addresses:
                - 192.168.200.1
            routes:
                - to: 192.168.200.0/24
                  via: 192.168.200.1

              

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
ifconfig
echo "Done."
