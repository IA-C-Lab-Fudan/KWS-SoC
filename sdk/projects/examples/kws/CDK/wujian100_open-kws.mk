##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=wujian100_open-kws
ConfigurationName      :=BuildSet
WorkspacePath          :=D:/wulian/github/KWS-SoC/sdk/projects/examples/kws/CDK/
ProjectPath            :=D:/wulian/github/KWS-SoC/sdk/projects/examples/kws/CDK/
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=Constantine
Date                   :=08/07/2020
CDKPath                :=D:/C-Sky/CDK/
LinkerName             :=riscv32-unknown-elf-gcc
LinkerNameoption       :=
SIZE                   :=riscv32-unknown-elf-size
READELF                :=riscv32-unknown-elf-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="wujian100_open-kws.txt"
MakeDirCommand         :=mkdir
LinkOptions            := -mabi=ilp32e -march=rv32emc  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/../../../../board/wujian100_open_evb/gcc_csky.ld"
LinkOtherFlagsOption   :=-Wl,-zmax-page-size=1024
IncludeCPath           :=$(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)../../../../csi_core/include" $(IncludeSwitch)"$(ProjectPath)../../../../csi_driver/include" $(IncludeSwitch)"$(ProjectPath)../../../../libs/include" $(IncludeSwitch)"$(ProjectPath)../../../../csi_driver/wujian100_open/include" $(IncludeSwitch)"$(ProjectPath)../../../../csi_kernel/include" $(IncludeSwitch)"$(ProjectPath)../../../../board/wujian100_open_evb/include" $(IncludeSwitch)"$(ProjectPath)../../../../projects/examples/kws/configs" 
IncludeAPath           :=$(IncludeSwitch)"$(ProjectPath)" -Wa,$(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)../../../../projects/examples/kws/configs" -Wa,$(IncludeSwitch)"$(ProjectPath)../../../../projects/examples/kws/configs" 
IncludePackagePath     :=
Libs                   := -Wl,--start-group $(LibrarySwitch)m   -Wl,--end-group 
ArLibs                 := "m" 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch) "$(ProjectPath)$(IntermediateDirectory)"  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=riscv32-unknown-elf-ar rcu
CXX      :=riscv32-unknown-elf-g++
CC       :=riscv32-unknown-elf-gcc
AS       :=riscv32-unknown-elf-gcc
OBJDUMP  :=riscv32-unknown-elf-objdump
OBJCOPY  :=riscv32-unknown-elf-objcopy
CXXFLAGS := -mabi=ilp32e -march=rv32emc    -Os  -g3  -Wall -ffunction-sections -fdata-sections 
CFLAGS   := -mabi=ilp32e -march=rv32emc    -Os  -g3  -Wall -ffunction-sections -fdata-sections 
ASFLAGS  := -mabi=ilp32e -march=rv32emc    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix) \
	$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix) \
	$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix) $(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) $(IntermediateDirectory)/libc__init$(ObjectSuffix) $(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) \
	$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) $(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) $(IntermediateDirectory)/kws_main$(ObjectSuffix) \
	



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean MakeIntermediateDirs
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@echo "" > $(IntermediateDirectory)/.d
	@touch  $(ObjectsFileList)
	@echo $(Objects0)  > $(ObjectsFileList)
	@echo linking...
	@$(LinkerName) $(OutputSwitch)"$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" $(LinkerNameoption) @$(ObjectsFileList) $(LibraryPathSwitch)D:/wulian/github/KWS-SoC/sdk/libs  -Wl,--whole-archive $(LibrarySwitch)newlib_wrap   -Wl,--no-whole-archive $(LinkOptions) $(LibPath) $(Libs) $(LinkOtherFlagsOption)
	@echo size of target:
	@$(SIZE) "$(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" 
	@echo -n "checksum value of target:  "
	@$(CHECKSUM) "$(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" 
	
MakeIntermediateDirs:
	@test -d Obj || $(MakeDirCommand) Obj

	@test -d Lst || $(MakeDirCommand) Lst

$(IntermediateDirectory)/.d:
	@test -d Obj || $(MakeDirCommand) Obj
	@test -d Lst || $(MakeDirCommand) Lst



##
## Objects
##
$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/board/wujian100_open_evb/board_init.c  
	@echo compiling board_init.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/board/wujian100_open_evb/board_init.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_evb_board_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_evb_board_init$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/board/wujian100_open_evb/board_init.c
	@echo generating preprocess file of board_init.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_evb_board_init$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/board/wujian100_open_evb/board_init.c"

$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_dmac_v2.c  
	@echo compiling wj_dmac_v2.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_dmac_v2.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_dmac_v2$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_dmac_v2.c
	@echo generating preprocess file of wj_dmac_v2.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_dmac_v2$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_dmac_v2.c"

$(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_irq.c  
	@echo compiling wj_irq.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_irq.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_irq$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_irq$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_irq.c
	@echo generating preprocess file of wj_irq.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_irq$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_irq.c"

$(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_pwm.c  
	@echo compiling wj_pwm.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_pwm.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_pwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_pwm$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_pwm.c
	@echo generating preprocess file of wj_pwm.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_pwm$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_pwm.c"

$(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_rtc.c  
	@echo compiling wj_rtc.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_rtc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_rtc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_rtc$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_rtc.c
	@echo generating preprocess file of wj_rtc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_rtc$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_rtc.c"

$(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi.c  
	@echo compiling wj_usi.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi.c
	@echo generating preprocess file of wj_usi.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi.c"

$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_iic.c  
	@echo compiling wj_usi_iic.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_iic.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_iic$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_iic.c
	@echo generating preprocess file of wj_usi_iic.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_iic$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_iic.c"

$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_spi.c  
	@echo compiling wj_usi_spi.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_spi.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_spi$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_spi.c
	@echo generating preprocess file of wj_usi_spi.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_spi$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_spi.c"

$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_usart.c  
	@echo compiling wj_usi_usart.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_usart.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_usart$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_usart.c
	@echo generating preprocess file of wj_usi_usart.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_usart$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_usart.c"

$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_wrap.c  
	@echo compiling wj_usi_wrap.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_wrap.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_wrap$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_wrap.c
	@echo generating preprocess file of wj_usi_wrap.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_wrap$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_usi_wrap.c"

$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/devices.c  
	@echo compiling devices.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/devices.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_devices$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_devices$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/devices.c
	@echo generating preprocess file of devices.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_devices$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/devices.c"

$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_gpio.c  
	@echo compiling wj_oip_gpio.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_gpio.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_oip_gpio$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_gpio.c
	@echo generating preprocess file of wj_oip_gpio.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_oip_gpio$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_gpio.c"

$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_timer.c  
	@echo compiling wj_oip_timer.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_timer.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_oip_timer$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_timer.c
	@echo generating preprocess file of wj_oip_timer.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_oip_timer$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_timer.c"

$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_wdt.c  
	@echo compiling wj_oip_wdt.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_wdt.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_oip_wdt$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_wdt.c
	@echo generating preprocess file of wj_oip_wdt.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_oip_wdt$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/wj_oip_wdt.c"

$(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/isr.c  
	@echo compiling isr.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/isr.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_isr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_isr$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/isr.c
	@echo generating preprocess file of isr.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_isr$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/isr.c"

$(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/lib.c  
	@echo compiling lib.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/lib.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_lib$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_lib$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/lib.c
	@echo generating preprocess file of lib.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_lib$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/lib.c"

$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/novic_irq_tbl.c  
	@echo compiling novic_irq_tbl.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/novic_irq_tbl.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_novic_irq_tbl$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/novic_irq_tbl.c
	@echo generating preprocess file of novic_irq_tbl.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_novic_irq_tbl$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/novic_irq_tbl.c"

$(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/pinmux.c  
	@echo compiling pinmux.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/pinmux.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_pinmux$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_pinmux$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/pinmux.c
	@echo generating preprocess file of pinmux.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_pinmux$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/pinmux.c"

$(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/startup.S  
	@echo assembling startup.S...
	@$(AS) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/startup.S" $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_startup$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/wujian100_open_startup$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/startup.S
	@echo generating preprocess file of startup.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_startup$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/startup.S"

$(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/sys_freq.c  
	@echo compiling sys_freq.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/sys_freq.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_sys_freq$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_sys_freq$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/sys_freq.c
	@echo generating preprocess file of sys_freq.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_sys_freq$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/sys_freq.c"

$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/system.c  
	@echo compiling system.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/system.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_system$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_system$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/system.c
	@echo generating preprocess file of system.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_system$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/system.c"

$(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/trap_c.c  
	@echo compiling trap_c.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/trap_c.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_trap_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_trap_c$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/trap_c.c
	@echo generating preprocess file of trap_c.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_trap_c$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/trap_c.c"

$(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/vectors.S  
	@echo assembling vectors.S...
	@$(AS) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/vectors.S" $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_vectors$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/wujian100_open_vectors$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/vectors.S
	@echo generating preprocess file of vectors.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_vectors$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/csi_driver/wujian100_open/vectors.S"

$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/libc/clock_gettime.c  
	@echo compiling clock_gettime.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/libc/clock_gettime.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_clock_gettime$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_clock_gettime$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/libc/clock_gettime.c
	@echo generating preprocess file of clock_gettime.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_clock_gettime$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/libc/clock_gettime.c"

$(IntermediateDirectory)/libc__init$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/libc/_init.c  
	@echo compiling _init.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/libc/_init.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc__init$(ObjectSuffix) -MF$(IntermediateDirectory)/libc__init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc__init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc__init$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/libc/_init.c
	@echo generating preprocess file of _init.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc__init$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/libc/_init.c"

$(IntermediateDirectory)/libc_malloc$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/libc/malloc.c  
	@echo compiling malloc.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/libc/malloc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_malloc$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/libc/malloc.c
	@echo generating preprocess file of malloc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_malloc$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/libc/malloc.c"

$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/libc/minilibc_port.c  
	@echo compiling minilibc_port.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/libc/minilibc_port.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_minilibc_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_minilibc_port$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/libc/minilibc_port.c
	@echo generating preprocess file of minilibc_port.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_minilibc_port$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/libc/minilibc_port.c"

$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/dq_addlast.c  
	@echo compiling dq_addlast.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/mm/dq_addlast.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_addlast$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_dq_addlast$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/dq_addlast.c
	@echo generating preprocess file of dq_addlast.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_addlast$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/mm/dq_addlast.c"

$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/dq_rem.c  
	@echo compiling dq_rem.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/mm/dq_rem.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_rem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_dq_rem$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/dq_rem.c
	@echo generating preprocess file of dq_rem.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_rem$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/mm/dq_rem.c"

$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/lib_mallinfo.c  
	@echo compiling lib_mallinfo.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/mm/lib_mallinfo.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_lib_mallinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_lib_mallinfo$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/lib_mallinfo.c
	@echo generating preprocess file of lib_mallinfo.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_lib_mallinfo$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/mm/lib_mallinfo.c"

$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_addfreechunk.c  
	@echo compiling mm_addfreechunk.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_addfreechunk.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_addfreechunk$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_addfreechunk$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_addfreechunk.c
	@echo generating preprocess file of mm_addfreechunk.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_addfreechunk$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_addfreechunk.c"

$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_free.c  
	@echo compiling mm_free.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_free.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_free$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_free$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_free.c
	@echo generating preprocess file of mm_free.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_free$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_free.c"

$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_initialize.c  
	@echo compiling mm_initialize.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_initialize.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_initialize$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_initialize$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_initialize.c
	@echo generating preprocess file of mm_initialize.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_initialize$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_initialize.c"

$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_leak.c  
	@echo compiling mm_leak.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_leak.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_leak$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_leak$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_leak.c
	@echo generating preprocess file of mm_leak.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_leak$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_leak.c"

$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_mallinfo.c  
	@echo compiling mm_mallinfo.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_mallinfo.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_mallinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_mallinfo$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_mallinfo.c
	@echo generating preprocess file of mm_mallinfo.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_mallinfo$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_mallinfo.c"

$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_malloc.c  
	@echo compiling mm_malloc.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_malloc.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_malloc$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_malloc.c
	@echo generating preprocess file of mm_malloc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_malloc$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_malloc.c"

$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_size2ndx.c  
	@echo compiling mm_size2ndx.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_size2ndx.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_size2ndx$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_size2ndx$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_size2ndx.c
	@echo generating preprocess file of mm_size2ndx.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_size2ndx$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/mm/mm_size2ndx.c"

$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/ringbuffer/ringbuffer.c  
	@echo compiling ringbuffer.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/ringbuffer/ringbuffer.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) -MF$(IntermediateDirectory)/ringbuffer_ringbuffer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ringbuffer_ringbuffer$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/ringbuffer/ringbuffer.c
	@echo generating preprocess file of ringbuffer.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ringbuffer_ringbuffer$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/ringbuffer/ringbuffer.c"

$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/libs/syslog/syslog.c  
	@echo compiling syslog.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/libs/syslog/syslog.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) -MF$(IntermediateDirectory)/syslog_syslog$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/syslog_syslog$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/libs/syslog/syslog.c
	@echo generating preprocess file of syslog.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/syslog_syslog$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/libs/syslog/syslog.c"

$(IntermediateDirectory)/kws_main$(ObjectSuffix): D:/wulian/github/KWS-SoC/sdk/projects/examples/kws/main.c  
	@echo compiling main.c...
	@$(CC) $(SourceSwitch) "D:/wulian/github/KWS-SoC/sdk/projects/examples/kws/main.c" $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/kws_main$(ObjectSuffix) -MF$(IntermediateDirectory)/kws_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/kws_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/kws_main$(PreprocessSuffix): D:/wulian/github/KWS-SoC/sdk/projects/examples/kws/main.c
	@echo generating preprocess file of main.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/kws_main$(PreprocessSuffix) "D:/wulian/github/KWS-SoC/sdk/projects/examples/kws/main.c"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	@echo Cleaning target...
	@rm -rf $(IntermediateDirectory)/ $(ObjectsFileList) wujian100_open-kws.mk Lst/

clean_internal:
	@rm -rf $(IntermediateDirectory)/*.o $(IntermediateDirectory)/.d $(IntermediateDirectory)/*.d $(IntermediateDirectory)/*.a $(IntermediateDirectory)/*.elf $(IntermediateDirectory)/*.ihex Lst/

