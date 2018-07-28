TBL=Fires_100.xlsx
DB=fire17_1.zip
GDB=fire17_1.gdb

FILES=$(TBL) $(GDB)
all: $(FILES)

$(GDB): $(DB)
	# unpacking into Geodatabase
	unzip -o $(DB)

$(DB):
	# Downloading GIS database
	wget -O $(DB) http://frap.fire.ca.gov/data/statewide/fire17_1.zip

$(TBL):
	# Downloading Excel table
	wget -O $(TBL) http://frap.fire.ca.gov/data/statewide/Fires_100.xlsx

clean:
	rm -fr $(GDB)
	rm -f $(DB)
	rm -f $(TBL)

refresh: clean all
