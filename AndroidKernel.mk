KERNEL_OUT := $(TARGET_OUT_INTERMEDIATES)/KERNEL
KERNEL_CONFIG := $(KERNEL_OUT)/.config
TARGET_PREBUILT_KERNEL := $(KERNEL_OUT)/arch/arm/boot/Image

$(TARGET_PREBUILT_KERNEL) : $(KERNEL_OUT) $(KERNEL_CONFIG)
	$(MAKE) -C kernel ARM=arm CROSS_COMPILE=$(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- O=../$(KERNEL_OUT) kernel.img

$(KERNEL_CONFIG) : $(KERNEL_OUT)
	$(MAKE) -C kernel ARM=arm CROSS_COMPILE=$(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi- O=../$(KERNEL_OUT) $(KERNEL_DEFCONFIG)

$(KERNEL_OUT) :
	mkdir -p $(KERNEL_OUT)

.PHONY : $(KERNEL_CONFIG) $(TARGET_PREBUILT_KERNEL)
