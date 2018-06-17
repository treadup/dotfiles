# Dual Boot
The simplest way of dual booting Windows and Linux is the following.
Make sure that Windows is installed on the computer before you try to
install Linux. This is due to the fact that the Linux installer can
handle being installed alongside other operating systems while the
windows installer cannot.

## Create free space
First we need to create free space on the Windows machine where Linux
can be installed. This is done by partitioning the drive in Windows.

### Existing partitions
Do not touch the EFI partition or the recovery partition.

### Shrink partition
All we do is shrink the existing partition. You should not create any
new partitions from Windows.

## Windows not detected by Linux installer
There is a feature in Windows called Fast Startup. When this feature
is enabled (and it is enabled by default) Windows does not perform a
shutdown when you click the shutdown button. Instead it performs a
hybrid shutdown.

This causes Windows not to be detected by the Linux installer. So
before we can run the Linux installer we have to disable Fast Boot.

### Disable Fast Boot
To disable fast boot perform the following steps.

1. Open Control Panel

2. Click Hardware and Sound

3. Click Power Options

4. In the menu on the side select Choose what the power buttons do

5. Press Change Settings that are currently unavailable

6. Uncheck Turn on fast startup

7. Click the Save Changes button

## Not working
I have still not been able to make this work.
