# End any running simulation
quit -sim

# Set the filename for the transcript file
transcript file ExUFuncTranscript.txt

# Compile the source code in the correct order
vcom -work work -2008 -explicit -stats=none ../tb/TBExec.vhd
vcom -work work -2008 -explicit -stats=none ../rtl/EN_SLL64.vhd
vcom -work work -2008 -explicit -stats=none ../rtl/EN_SRL64.vhd
vcom -work work -2008 -explicit -stats=none ../rtl/EN_SRA64.vhd
vcom -work work -2008 -explicit -stats=none ../rtl/EN_Logic.vhd
vcom -work work -2008 -explicit -stats=none ../rtl/EN_Shifter.vhd
vcom -work work -2008 -explicit -stats=none ../rtl/EN_Adder.vhd
vcom -work work -2008 -explicit -stats=none ../rtl/ExecUnit.vhd
vcom -work work -2008 -explicit -stats=none ../rtl/ExecConfig.vhd


# Start the simulation with logging to the transcript
vsim -gui work.config_functional

# Setup the wave window using a separate script
do scripts/wave.do

# Turn on the wave view
view wave

# Turn on the transcription
transcript on

# Restart the simulation
restart -force

# Run the simulation
run -all

# Turn off the transcription
transcript off

# Set the transcript filename to an empty string to stop further messages
transcript file ""