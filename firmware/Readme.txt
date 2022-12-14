https://www.obdev.at/products/vusb/hidkeys.html

This is the README file for the HIDKeys USB device.

HIDKeys is an example application for implementing an USB keyboard conforming
to the "USB Device Class Definition for Human Interface Devices (HID)". It is
based on Objective Development's firmware-only USB driver for Atmel's AVR
microcontrollers and accepts up to 17 key inputs on an ATMega8. The firmware
should be easily portable to an ATTiny2313 or other tiny devices. Since it
implements a standards compliant keyboard, no separate host software is
needed.

Objective Development's USB driver is a firmware-only implementation of the
USB 1.1 standard (low speed device) on cheap single chip microcomputers of
Atmel's AVR series, such as the ATtiny2313 or even some of the small 8 pin
devices. It implements the standard to the point where useful applications can
be implemented. See the file "usbdrdv/usbdrv.h" for features and limitations.


BUILDING AND INSTALLING
=======================
The firmware for HIDKeys requires avr-gcc and avr-libc (a C-library for
the AVR controller). Please read the instructions at
http://www.nongnu.org/avr-libc/user-manual/install_tools.html for how to
install the GNU toolchain (avr-gcc, assembler, linker etc.) and avr-libc.
If you are on Windows, download WinAVR (see http://winavr.sourceforge.net/).

Once you have the GNU toolchain for AVR microcontrollers installed, you can
run "make". You may have to edit the Makefile to use your preferred downloader
with "make flash". Our current version is built for uisp with the AVR910
serial programmer connected through a USB to serial adapter to a Mac running
Mac OS X. Before you download the firmware, run "make fuse" to configure the
device for an external crystal.

NEVER LET A DEVICE WITH THIS FIRMWARE ESCAPE YOUR LAB! It uses a Vendor-ID
which is dedicated to education only. See the remarks in usbconfig.h and the
design hints below.


FILES IN THE DISTRIBUTION
=========================
Readme.txt ........ The file you are currently reading.
main.c ............ Source code of the controller firmware.
Makefile .......... The makefile for compiling the firmware.
checksize ......... A utility to check the code size (used by Makefile).
usbconfig.h ....... Header file with configuration options for the driver.
usbdrv ............ USB driver -- See Readme.txt in that directory for info.
circuit ........... Circuit diagrams in PDF and EAGLE 4 format. A free version
                    of EAGLE is available for Linux, Mac OS X and Windows from
                    http://www.cadsoft.de/.
License.txt ....... Public license (GPL2) for all contents of this project.
Changelog.txt ..... Logfile documenting changes in soft-, firm- and hardware.


WHY SHOULD I IMPLEMENT MY DEVICE AS A HID?
==========================================
HID does not necessarily mean keyboards, mice and joysticks. Any device which
requires only a moderate transfer rate can be designed as HID. So, should you
make a HID or a custom device with its own driver? The answer depends mostly
on the targetted operating system.

The main advantage of a HID compliant device is that you don't need a kernel
driver on Windows. This means that you can start the controlling software
application WITHOUT installation by an Administrator, e.g. directly from CD.
Since other operating systems don't need a kernel driver for USB devices, this
advantage is mostly Windows-only. The main disadvantage is the added
complexity (you need to understand how Report Descriptors are built) and that
you must conform to the framework defined by the HID specification.

Writing your own driver (e.g. with libusb) gives you much more flexibility and
less complexity, but you must install a kernel driver on Windows.


HINTS FOR DESIGNING YOUR OWN HID
================================
Designing a keyboard, mouse or joystick is relatively easy. There are enough
example Report Descriptors available and you can start with these. But if you
design something like e.g. our PowerSwitch, you must try to fit it into the
framework of "HID Usages" defined in usb.org's "HID Usage Tables" document.
The hints given here are mostly for this case:

(1) Use usb.org's "HID Descriptor Tool" available from
http://www.usb.org/developers/hidpage/ to build the Report Descriptor. You can
save the descriptor as "C" header file in the "Save As..." dialog.

(2) NEVER declare your device as keyboard or mouse, unless it actually IS a
keyboard or mouse. Keyboards and mice are hogged by the operating system
immediately after they have been connected.

(3) If you convert a keyboard or mouse into something different (by modifying
the Report Descriptor), you must delete the device in the Windows Device
Manager. Otherwise Windows will still bind the keyboard or mouse driver to the
device because this binding is established to the Vendor- and Product-ID, not
the device class.

(4) NEVER use Objective Development's free shared VID/PID pair for HIDs. Since
Windows binds the driver by VID/PID, you would bind the HID driver instead of
libusb to the IDs.

(5) Windows is very strict (more than usb.org's Descriptor Tool) when checking
Report Descriptors. If the descriptor check fails, the device will not even be
listed as HID.

(6) Windows checks reports against the Report Descriptor. If your device sends
more or less data than specified in the descriptor, the message is discarded.

(7) Use a USB Sniffer if something does not work as expected. You can usually
see where the communication aborts.

(8) Here is an example Report Descriptor to start with. It defines one input
report with up to 7 bytes for receiving interrupts from the device and 3
feature reports for reading/writing data from/to the device in blocks of 7, 15
or 31 bytes. Each report is prefixed by its report ID for a total of 8, 16 or
32 bytes. All blocks are defined as opaque data buffers with no particular
usage.

    0x06, 0x00, 0xff,              // USAGE_PAGE (Vendor Defined Page 1)
    0x09, 0x01,                    // USAGE (Vendor Usage 1)
    0xa1, 0x01,                    // COLLECTION (Application)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x26, 0xff, 0x00,              //   LOGICAL_MAXIMUM (255)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x85, 0x01,                    //   REPORT_ID (1)
    0x95, 0x07,                    //   REPORT_COUNT (7)
    0x09, 0x00,                    //   USAGE (Undefined)
    0x82, 0x02, 0x01,              //   INPUT (Data,Var,Abs,Buf)
    0x85, 0x02,                    //   REPORT_ID (2)
    0x95, 0x07,                    //   REPORT_COUNT (7)
    0x09, 0x00,                    //   USAGE (Undefined)
    0xb2, 0x02, 0x01,              //   FEATURE (Data,Var,Abs,Buf)
    0x85, 0x03,                    //   REPORT_ID (3)
    0x95, 0x0f,                    //   REPORT_COUNT (15)
    0x09, 0x00,                    //   USAGE (Undefined)
    0xb2, 0x02, 0x01,              //   FEATURE (Data,Var,Abs,Buf)
    0x85, 0x04,                    //   REPORT_ID (4)
    0x95, 0x1f,                    //   REPORT_COUNT (31)
    0x09, 0x00,                    //   USAGE (Undefined)
    0xb2, 0x02, 0x01,              //   FEATURE (Data,Var,Abs,Buf)
    0xc0                           // END_COLLECTION



ABOUT THE LICENSE
=================
It is our intention to make our USB driver and this demo application
available to everyone. Moreover, we want to make a broad range of USB
projects and ideas for USB devices available to the general public. We
therefore want that all projects built with our USB driver are published
under an Open Source license. Our license for the USB driver and demo code is
the GNU General Public License Version 2 (GPL2). See the file "License.txt"
for details.

If you don't want to publish your source code under the GPL2, you can simply
pay money for AVR-USB. As an additional benefit you get USB PIDs for free,
licensed exclusively to you. See the file "CommercialLicense.txt" for details.


MORE INFORMATION
================
For more information about Objective Development's firmware-only USB driver
for Atmel's AVR microcontrollers please visit the URL

    http://www.obdev.at/products/avrusb/

A technical documentation of the driver's interface can be found in the file
"usbdrv/usbdrv.h".


--
(c) 2006, 2007 by OBJECTIVE DEVELOPMENT Software GmbH.
http://www.obdev.at/
