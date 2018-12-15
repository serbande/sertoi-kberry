# Using the UART
# The default usage of the UART Interface is serial console. To use the UART we must turning off the UART functioning as a serial console.

# Warning
# The Raspberry Pi 3 does not use the correct baud rate in Raspian out of the box, so kBerry will not work. To fix this, the overlay pi3-miniuart-bt-overlay must be activated.

sudo sh -c "echo dtoverlay=pi3-miniuart-bt >>/boot/config.txt"

# Open /boot/cmdline.txt and remove console=ttyAMA0,115200 from the file For Raspbian Jessie and newer the entry you have to remove is console=serial0,115200
sudo sed -ie "s/console=[a-Z]*0,[0-9]* //g" /boot/cmdline.txt

sudo nano /boot/cmdline.txt


# Reboot it.

sudo reboot
# Make sure the user has the rights to access the ttyAMA0

# Check the group of the device
ls -l /dev/ttyAMA0
crw-rw---- 1 root dialout 204, 64 Aug  4 11:33 /dev/ttyAMA0
# Note
# If the group is tty the device is still used be the kernel serial console, check your /boot/cmdline.txt to fix this and make sure the device is rebooted after modifying this file

# Add the user pi to the group seen above
sudo usermod -a -G dialout pi

# Reboot it. Now you could use the UART in your application.

sudo reboot




sudo apt-get update
sudo apt-get install git cmake libboost-dev 

# BOBAOS
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs


sudo npm install -g bdsd.sock --unsafe-perm