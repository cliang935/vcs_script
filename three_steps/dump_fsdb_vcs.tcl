global env
fsdbDumpfile $env(DESIGN_NAME).fsdb 
fsdbDumpvars 0 $env(TB_NAME)
# Dumps the value changes of MDA(multidimensional array) signals to the FSDB file
fsdbDumpMDA 0 $env(TB_NAME)
run 2800000 ns
quit
