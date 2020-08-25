.PHONY: clean All

All:
	@echo "----------Building project:[ wujian100_vs1053 - BuildSet ]----------"
	@make -f "wujian100_vs1053.mk" clean_internal 
	@
	@make -f "wujian100_vs1053.mk" MakeIntermediateDirs && make -f "wujian100_vs1053.mk" -j 8
	@echo Executing Post Build commands ...
	@export CDKPath="D:/C-Sky/CDK" ProjectPath="D:/wulian/github/KWS-SOC-8bit-detective/sdk/projects/examples/kws/CDK" && "D:/wulian/github/KWS-SOC-8bit-detective/sdk/projects/examples/kws/CDK//../../../../utilities//aft_build.sh"
	@echo Done

clean:
	@echo "----------Cleaning project:[ wujian100_vs1053 - BuildSet ]----------"
	@make -f  "wujian100_vs1053.mk" clean
