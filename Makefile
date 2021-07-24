FILENAME   := main
PORT       := /dev/cu.usbserial-00000000
DEVICE     := atmega32
PROGRAMMER := arduino
BAUD       := 115200
COMPILE    := avr-gcc -Wall -Os -mmcu=$(DEVICE)

default: build upload clean

print_msg:
	@echo "Building process started..."
	@echo "--------------------------------"

build: print_msg
	@$(COMPILE) -c $(FILENAME).c -o $(FILENAME).o
	@$(COMPILE) -o $(FILENAME).elf $(FILENAME).o
	@avr-objcopy -j .text -j .data -O ihex $(FILENAME).elf $(FILENAME).hex 
	@avr-size --format=avr --mcu=$(DEVICE) $(FILENAME).elf
	
upload:
	@avrdude -v -p $(DEVICE) -c $(PROGRAMMER) -P $(PORT) -b $(BAUD) -U flash:w:$(FILENAME).hex:i

clean:
	@rm $(FILENAME).o
	@rm $(FILENAME).elf