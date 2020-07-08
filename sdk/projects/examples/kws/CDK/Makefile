.PHONY: clean All

All:
	@echo "----------Building project:[ wujian100_open-kws - BuildSet ]----------"
	@
	@make -f "wujian100_open-kws.mk" MakeIntermediateDirs && make -f "wujian100_open-kws.mk" -j 8
	@echo Executing Post Build commands ...
	@export CDKPath="D:/C-Sky/CDK" ProjectPath="D:/wulian/github/KWS-SoC/sdk/projects/examples/kws/CDK" && "D:/wulian/github/KWS-SoC/sdk/projects/examples/kws/CDK//../../../../utilities//aft_build.sh"
	@echo Done

clean:
	@echo "----------Cleaning project:[ wujian100_open-kws - BuildSet ]----------"
	@make -f  "wujian100_open-kws.mk" clean
