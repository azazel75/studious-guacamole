# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:
let
  nur = import (builtins.fetchTarball "https://github.com/nix-community/nur-combined/archive/master.tar.gz") {};
in {
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    /home/azazel/wip/nixos/nixos-hardware/lenovo/thinkpad/x1/6th-gen/QHD/default.nix
    # nur.repos.moredread.modules.throttled
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [ "intel_iommu=nobounce" ];
  boot.extraModulePackages = [ ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/9efb0739-a437-47cf-936b-dd45f5465d89";
      fsType = "btrfs";
    };

    "/home" = {
      device = "/dev/disk/by-uuid/570de865-292a-4375-ad47-6f68d74e17af";
      fsType = "btrfs";
    };

    "/boot/efi" = {
      device = "/dev/disk/by-uuid/8437-033C";
      fsType = "vfat";
    };

    "/mnt/giskard/data" = {
      device = "giskard:/mnt/data";
      fsType = "nfs";
      options = [
        "noauto"
        "x-systemd.automount"
      ];
    };

    "/mnt/giskard/musica" = {
      device = "giskard:/mnt/musica";
      fsType = "nfs";
      options = [
        "noauto"
        "x-systemd.automount"
      ];
    };

    "/mnt/giskard/books" = {
      device = "giskard:/mnt/books";
      fsType = "nfs";
      options = [
        "noauto"
        "x-systemd.automount"
      ];
    };

    "/mnt/portable/samsung" = {
      device = "UUID=df6cab1a-128d-4a6c-89fe-64b5ee54d1fd";
      fsType = "ext4";
      options = [
        "noauto"
        "x-systemd.automount"
      ];
    };

  };

  swapDevices = [ { device="/dev/system/swap"; } ];

  hardware.trackpoint = {
    enable = true;
    sensitivity = 170;
  };
  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.pulseaudio.enable = true;
  systemd.timers.cpu-throttling.enable = lib.mkForce false;
  services.throttled.enable = true;
}
