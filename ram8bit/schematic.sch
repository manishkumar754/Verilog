# File saved with Nlview 6.8.5  2018-01-30 bk=1.4354 VDI=40 GEI=35 GUI=JA:1.6 non-TLS
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 12
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new ram8bit work:ram8bit:NOFILE -nosplit
load symbol RTL_AND work AND pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_MUX work MUX pin I0 input.left pin I1 input.left pin O output.right pin S input.bot fillcolor 1
load symbol RTL_RAM work GEN pin WCLK input.clk.left pin WE1 input.left pinBus RA2 input.left [4:0] pinBus RO2 output.right [7:0] pinBus WA1 input.left [4:0] pinBus WD1 input.left [7:0] fillcolor 1
load symbol RTL_REG__BREG_1 work[5:0]ssww GEN pin C input.clk.left pin CE input.left pinBus D input.left [5:0] pinBus Q output.right [5:0] fillcolor 1 sandwich 3 prop @bundle 6
load port cs input -pg 1 -y 140
load port wr_e input -pg 1 -y 120
load port clk input -pg 1 -y 180
load portBus addr_ram input [5:0] -attr @name addr_ram[5:0] -pg 1 -y 220
load portBus data_in input [7:0] -attr @name data_in[7:0] -pg 1 -y 300
load portBus data_out output [7:0] -attr @name data_out[7:0] -pg 1 -y 200
load inst addr_register1_i RTL_AND work -attr @cell(#000000) RTL_AND -pg 1 -lvl 1 -y 130
load inst addr_register_reg[5:0] RTL_REG__BREG_1 work[5:0]ssww -attr @cell(#000000) RTL_REG -pinBusAttr Q @attr n/c -pg 1 -lvl 3 -y 200
load inst addr_register_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b1 -pinAttr I1 @attr S=default -pg 1 -lvl 2 -y 70
load inst ram_memory_reg RTL_RAM work -attr @cell(#000000) RTL_RAM -pinBusAttr RA2 @name RA2[4:0] -pinBusAttr RO2 @name RO2[7:0] -pinBusAttr WA1 @name WA1[4:0] -pinBusAttr WD1 @name WD1[7:0] -pg 1 -lvl 4 -y 200
load net addr_ram[4] -attr @rip addr_ram[4] -port addr_ram[4] -pin addr_register_reg[5:0] D[4] -pin ram_memory_reg WA1[4]
load net addr_register[2] -attr @rip 2 -pin addr_register_reg[5:0] Q[2] -pin ram_memory_reg RA2[2]
load net data_in[0] -attr @rip data_in[0] -port data_in[0] -pin ram_memory_reg WD1[0]
load net data_out[7] -attr @rip RO2[7] -port data_out[7] -pin ram_memory_reg RO2[7]
load net data_in[5] -attr @rip data_in[5] -port data_in[5] -pin ram_memory_reg WD1[5]
load net addr_ram[1] -attr @rip addr_ram[1] -port addr_ram[1] -pin addr_register_reg[5:0] D[1] -pin ram_memory_reg WA1[1]
load net data_out[1] -attr @rip RO2[1] -port data_out[1] -pin ram_memory_reg RO2[1]
load net data_out[6] -attr @rip RO2[6] -port data_out[6] -pin ram_memory_reg RO2[6]
load net <const0> -ground -pin addr_register_i I0
load net addr_register1 -pin addr_register1_i O -pin addr_register_i S -pin ram_memory_reg WE1
netloc addr_register1 1 1 3 N N 440 110 700J
load net addr_register[0] -attr @rip 0 -pin addr_register_reg[5:0] Q[0] -pin ram_memory_reg RA2[0]
load net data_in[4] -attr @rip data_in[4] -port data_in[4] -pin ram_memory_reg WD1[4]
load net addr_register[3] -attr @rip 3 -pin addr_register_reg[5:0] Q[3] -pin ram_memory_reg RA2[3]
load net cs -pin addr_register1_i I1 -port cs
netloc cs 1 0 1 NJ
load net addr_ram[5] -attr @rip addr_ram[5] -port addr_ram[5] -pin addr_register_reg[5:0] D[5]
load net data_in[3] -attr @rip data_in[3] -port data_in[3] -pin ram_memory_reg WD1[3]
load net data_in[6] -attr @rip data_in[6] -port data_in[6] -pin ram_memory_reg WD1[6]
load net data_out[5] -attr @rip RO2[5] -port data_out[5] -pin ram_memory_reg RO2[5]
load net addr_ram[2] -attr @rip addr_ram[2] -port addr_ram[2] -pin addr_register_reg[5:0] D[2] -pin ram_memory_reg WA1[2]
load net addr_register_i_n_0 -pin addr_register_i O -pin addr_register_reg[5:0] CE
netloc addr_register_i_n_0 1 2 1 460
load net data_out[2] -attr @rip RO2[2] -port data_out[2] -pin ram_memory_reg RO2[2]
load net <const1> -power -pin addr_register_i I1
load net addr_register[1] -attr @rip 1 -pin addr_register_reg[5:0] Q[1] -pin ram_memory_reg RA2[1]
load net data_in[2] -attr @rip data_in[2] -port data_in[2] -pin ram_memory_reg WD1[2]
load net data_out[4] -attr @rip RO2[4] -port data_out[4] -pin ram_memory_reg RO2[4]
load net addr_register[4] -attr @rip 4 -pin addr_register_reg[5:0] Q[4] -pin ram_memory_reg RA2[4]
load net wr_e -pin addr_register1_i I0 -port wr_e
netloc wr_e 1 0 1 NJ
load net addr_ram[3] -attr @rip addr_ram[3] -port addr_ram[3] -pin addr_register_reg[5:0] D[3] -pin ram_memory_reg WA1[3]
load net clk -pin addr_register_reg[5:0] C -port clk -pin ram_memory_reg WCLK
netloc clk 1 0 4 NJ 180 NJ 180 480 130 680J
load net data_in[1] -attr @rip data_in[1] -port data_in[1] -pin ram_memory_reg WD1[1]
load net data_in[7] -attr @rip data_in[7] -port data_in[7] -pin ram_memory_reg WD1[7]
load net addr_ram[0] -attr @rip addr_ram[0] -port addr_ram[0] -pin addr_register_reg[5:0] D[0] -pin ram_memory_reg WA1[0]
load net data_out[3] -attr @rip RO2[3] -port data_out[3] -pin ram_memory_reg RO2[3]
load net data_out[0] -attr @rip RO2[0] -port data_out[0] -pin ram_memory_reg RO2[0]
load netBundle @addr_ram 6 addr_ram[5] addr_ram[4] addr_ram[3] addr_ram[2] addr_ram[1] addr_ram[0] -autobundled
netbloc @addr_ram 1 0 4 NJ 220 NJ 220 460 280 680J
load netBundle @data_out 8 data_out[7] data_out[6] data_out[5] data_out[4] data_out[3] data_out[2] data_out[1] data_out[0] -autobundled
netbloc @data_out 1 4 1 N
load netBundle @addr_register 5 addr_register[4] addr_register[3] addr_register[2] addr_register[1] addr_register[0] -autobundled
netbloc @addr_register 1 3 1 N
load netBundle @data_in 8 data_in[7] data_in[6] data_in[5] data_in[4] data_in[3] data_in[2] data_in[1] data_in[0] -autobundled
netbloc @data_in 1 0 4 NJ 300 NJ 300 NJ 300 700J
levelinfo -pg 1 0 50 310 550 730 900 -top 0 -bot 320
show
fullfit
#
# initialize ictrl to current module ram8bit work:ram8bit:NOFILE
ictrl init topinfo |
ictrl layer glayer install
ictrl layer glayer config ibundle 1
ictrl layer glayer config nbundle 0
ictrl layer glayer config pbundle 0
ictrl layer glayer config cache 1
