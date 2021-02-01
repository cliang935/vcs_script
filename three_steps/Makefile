export DESIGN_NAME= nnic
export TB_NAME = ok_for_nnic_tb

VERDI_HOME = /harddisk/disk1/eda/synopsys/verdi-2019/verdi/P-2019.06-SP1-1
PLATFORM = linux64

VERDI = -P 	${VERDI_HOME}/share/PLI/VCS/${PLATFORM}/novas.tab \
						${VERDI_HOME}/share/PLI/VCS/${PLATFORM}/pli.a 

FILE_LIST = ./file_list.f
WORK = xilinx_vcs_lib

DESIGN_NAME = nnic
TB_NAME = ok_for_nnic_tb

INCDIR1 = +incdir+../example_design/sim
INCDIR2 = +incdir+../example_design/rtl/rtl_axi_0907
INCDIR3 = +incdir+../example_design/sim/oksim
DEFINE = +define+x4Gb+sg125+x16 

OPTS1 = -full64 -sverilog +v2k +vcs+flush+all -timescale=1ns/1ps
OPTS2 = -full64 -Mupdate -debug_pp 


comp:
	#for multi-person work
	rm -rf /harddisk/disk1/xilinx_vcs_lib/AN.DB/
	mkdir -m 777 /harddisk/disk1/xilinx_vcs_lib/AN.DB/
	#Step1
	vlogan -sverilog \
	-f ${FILE_LIST} \
	-work ${WORK} \
	${OPTS1} \
	${INCDIR1} \
	${INCDIR2} \
	${INCDIR3} \
	${DEFINE}
	
	#Step2
	vcs -full64 \
	${WORK}.${TB_NAME} ${WORK}.glbl \
	${VERDI} \
	${OPTS2} \
	-o ${DESIGN_NAME}_simv \
	-l comp.log
	
run:
	#Step3
	./${DESIGN_NAME}_simv \
	-ucli -i ./dump_fsdb_vcs.tcl \
	+fsdb+autoflush \
	-l run.log

dbg:
	verdi \
	-sv \
	-f ${FILE_LIST} \
	-work ${WORK} \
	${INCDIR1} \
	${INCDIR2} \
	${INCDIR3} \
	${DEFINE} \
	-top ${TB_NAME} \
	-ssf ${DESIGN_NAME}.fsdb \
	-nologo&


all: comp run


clean:
	@rm -rf \
		*.log \
		*Log \
		csrc \
		*.conf \
		*.rc \
		*simv \
		*.daidir \
		ucli.key \
		*.fsdb* \
		novas* \
		.cxl.* 

