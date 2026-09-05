[Defines]
  PLATFORM_NAME                  = EXYNOS850Pkg
  PLATFORM_GUID                  = a29a79f1-f509-406a-99d8-7dbff08b2e89
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = EXYNOS850Pkg/EXYNOS850Pkg.fdf

!include EXYNOS850Pkg/EXYNOS850Pkg.dsc

[PcdsFixedAtBuild.common]
  # System Memory (3GB)
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xC0000000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x80C00000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gEXYNOS850PkgTokenSpaceGuid.PcdUefiMemPoolBase|0x80D00000         # DXE Heap base address
  gEXYNOS850PkgTokenSpaceGuid.PcdUefiMemPoolSize|0x03300000         # UefiMemorySize, DXE heap size
  # Framebuffer (1080x2408)
  gEXYNOS850PkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0xfa000000
  gEXYNOS850PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gEXYNOS850PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2408
  gEXYNOS850PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleWidth|1080
  gEXYNOS850PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleHeight|2408
