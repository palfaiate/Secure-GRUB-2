# Securing-GRUB-2

This is a tutorial which explain how to secure the access of GRUB 2 at Linux startup.

Table of Content

- [Securing-GRUB-2](#securing-grub-2)
  - [GRUB](#grub)
  - [Boot process of Linux](#boot-process-of-linux)
    - [1. The BIOS (**B**asic **I**nput **O**utput **S**ystem)](#1-the-bios-basic-input-output-system)
    - [2. MBR (**M**aster **B**oot **R**ecord)](#2-mbr-master-boot-record)
    - [3. GRUB](#3-grub)
    - [4. Kernel (Linux kernel)](#4-kernel-linux-kernel)
    - [5. Init](#5-init)
  - [So why do you need to secure GRUB ?](#so-why-do-you-need-to-secure-grub-)
    - [The "flaw" of GRUB : editing at the startup](#the-flaw-of-grub--editing-at-the-startup)
  - [Secure GRUB with an encrypted password](#secure-grub-with-an-encrypted-password)
  - [Allow automatic boot](#allow-automatic-boot)

## GRUB

First of all GNU GRUB (**GR**and **U**nified **B**ootloader) is a boot loader and boot manager from the [GNU Project](https://www.gnu.org/).  
Excuted after the booting of the BIOS or UEFI it allows user to select in which operating system he wants to boot and it serves in the same time as a Linux boot loader.

## Boot process of Linux

They are usually 5 different stages of Linux boot process involved during the startup of a Linux distro :

### 1. The BIOS (**B**asic **I**nput **O**utput **S**ystem)

Stored in a memory location called EEPROM (**E**lectrically-**E**rasable **P**rogrammable **R**ead-only **M**emory) of the motherboard, the BIOS is a set of functions (written in Assembly Language) which allow the first interaction with the physical material (Hard drives, Keyboard, Mouse, ...).  
It scans all the internal and external devices and interfaces connected to the motherboard and performs some system integrity checks.  
Then, depending of the boot order configured in the BIOS, it loads and executes the 512 bytes of the disk, know as the MBR.

> Nowadays the BIOS is replaced by UEFI (**U**nified **E**xtensible **F**irmware **I**nterface) that can act as a boot loader and manager and a replacement of GRUB.

### 2. MBR (**M**aster **B**oot **R**ecord)

The first 512 bytes of the disk are called the MBR. It conatains :

- boot code or bootstrap code which contains informations about the boot loader (446 bytes)
- partitions table to indesx all the partitions of the disk (64 bytes)
- boot signature to check if the disk is bootable or not (2 bytes)

In a nutshell, the MBR is charged of loading and executing the boot loader in our case : GRUB.

### 3. GRUB

Here comes our famous GRUB !  
It loads all the available operating system (Linux kernels precisly) or other boot loaders like Windows Boot Manager.
If we don't do anything at the GRUB screen, it loads and executes automatically the default Linux kernel (vmlinuz) and initrd (inital ramdisk) images.

>Loaded into the RAM, initrd is a filsystem which is used for the Linux startup process. It contains all the additional modules and drivers for the the kernel.

### 4. Kernel (Linux kernel)

### 5. Init

## So why do you need to secure GRUB ?

### The "flaw" of GRUB : editing at the startup

## Secure GRUB with an encrypted password

## Allow automatic boot

___
Author : AnthonyF