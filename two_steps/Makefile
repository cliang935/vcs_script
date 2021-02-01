export DESIGN_NAME= nnic
export TB_NAME = ok_for_nnic_tb

DESIGN_NAME = nnic
TB_NAME = ok_for_nnic_tb

VERDI_HOME = /harddisk/disk1/eda/synopsys/verdi-2019/verdi/P-2019.06-SP1-1
PLATFORM = linux64

VERDI = -P 	${VERDI_HOME}/share/PLI/VCS/${PLATFORM}/novas.tab \
						${VERDI_HOME}/share/PLI/VCS/${PLATFORM}/pli.a 

FILE_LIST = ./file_list.f


INCDIR1 = +incdir+../example_design/sim
INCDIR2 = +incdir+../example_design/rtl/rtl_axi_0907
INCDIR3 = +incdir+../example_design/sim/oksim

DEFINE = +define+x4Gb+sg125+x16 

OPT = -full64 -sverilog +v2k +vcs+flush+all -timescale=1ns/1ps -Mupdate -debug_pp +notimingcheck +nospecify

comp:
	vcs -full64 \
	-f ${FILE_LIST} \
	${OPT} \
	${INCDIR1} \
	${INCDIR2} \
	${INCDIR3} \
	${DEFINE}
	-o ${DESIGN_NAME}_simv \
	${VERDI} \
	-l comp.log

run:
	./${DESIGN_NAME}_simv \
  -ucli -i ./dump_fsdb_vcs.tcl \
  +fsdb+autoflush \
  -l run.log 

all: comp run

dbg:
	verdi \
	-sv \
	-f ${FILE_LIST} \
	${INCDIR1} \
	${INCDIR2} \
	${INCDIR3} \
	${DEFINE} \
	-top ${TB_NAME} \
	-ssf ${DESIGN_NAME}.fsdb \
	-nologo&

clean:
	@rm -rf \
		*.log \
		csrc \
		*.conf \
		*.rc simv \
		*.daidir \
		ucli.key \
		*Log \
		*.fsdb
