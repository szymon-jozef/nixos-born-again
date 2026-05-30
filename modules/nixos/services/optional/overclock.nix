{ ... }:
{
  flake.nixosModules.services-hardware-overclock =
    { ... }:
    {
      hardware.amdgpu.overdrive.enable = true;
      services.lact.enable = true;
    };
}
