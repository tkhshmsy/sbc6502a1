PLATFORM = sbc6502a1

all: hello.srec

hello.srec: hello
	# srec_cat hello -binary -offset 0x0300 -o hello.srec -Execution_Start_Address 0x0300
	objcopy -I binary -O srec --change-addresses 0x0300 hello hello.srec

hello: hello.s
	CC65_HOME=/usr/local/share/cc65 cl65 -O -vm -m hello.map -l hello.lst -t $(PLATFORM) hello.s

clean:
	$(RM) *.lst *.map *.srec hello

