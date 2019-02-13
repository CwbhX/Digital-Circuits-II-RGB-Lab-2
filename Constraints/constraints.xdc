# Clock signal
#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	
#Pmod Header JA
    #Bank = 15, Pin name = IO_L1N_T0_AD0N_15,                    Sch name = JA1
    set_property PACKAGE_PIN B13 [get_ports {JA[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JA[0]}]
    #Bank = 15, Pin name = IO_L5N_T0_AD9N_15,                    Sch name = JA2
    set_property PACKAGE_PIN F14 [get_ports {JA[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JA[1]}]
    #Bank = 15, Pin name = IO_L16N_T2_A27_15,                    Sch name = JA3
    set_property PACKAGE_PIN D17 [get_ports {JA[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JA[2]}]
    #Bank = 15, Pin name = IO_L16P_T2_A28_15,                    Sch name = JA4
    set_property PACKAGE_PIN E17 [get_ports {JA[3]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}]
    #Bank = 15, Pin name = IO_0_15,                                Sch name = JA7
    set_property PACKAGE_PIN G13 [get_ports {JA[4]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JA[4]}]
    #Bank = 15, Pin name = IO_L20N_T3_A19_15,                    Sch name = JA8
    set_property PACKAGE_PIN C17 [get_ports {JA[5]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JA[5]}]
    #Bank = 15, Pin name = IO_L21N_T3_A17_15,                    Sch name = JA9
    set_property PACKAGE_PIN D18 [get_ports {JA[6]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JA[6]}]
    #Bank = 15, Pin name = IO_L21P_T3_DQS_15,                    Sch name = JA10
    set_property PACKAGE_PIN E18 [get_ports {JA[7]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JA[7]}]
        
#Pmod Header JB
    #Bank = 15, Pin name = IO_L15N_T2_DQS_ADV_B_15,                Sch name = JB1
    set_property PACKAGE_PIN G14 [get_ports {JB[0]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JB[0]}]
    #Bank = 14, Pin name = IO_L13P_T2_MRCC_14,                    Sch name = JB2
    set_property PACKAGE_PIN P15 [get_ports {JB[1]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JB[1]}]
    #Bank = 14, Pin name = IO_L21N_T3_DQS_A06_D22_14,            Sch name = JB3
    set_property PACKAGE_PIN V11 [get_ports {JB[2]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JB[2]}]
    #Bank = CONFIG, Pin name = IO_L16P_T2_CSI_B_14,                Sch name = JB4
    set_property PACKAGE_PIN V15 [get_ports {JB[3]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JB[3]}]
    #Bank = 15, Pin name = IO_25_15,                            Sch name = JB7
    set_property PACKAGE_PIN K16 [get_ports {JB[4]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JB[4]}]
    #Bank = CONFIG, Pin name = IO_L15P_T2_DQS_RWR_B_14,            Sch name = JB8
    set_property PACKAGE_PIN R16 [get_ports {JB[5]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JB[5]}]
    #Bank = 14, Pin name = IO_L24P_T3_A01_D17_14,                Sch name = JB9
    set_property PACKAGE_PIN T9 [get_ports {JB[6]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JB[6]}]
    #Bank = 14, Pin name = IO_L19N_T3_A09_D25_VREF_14,            Sch name = JB10 
    set_property PACKAGE_PIN U11 [get_ports {JB[7]}]                    
        set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]
        
#Bank = 15, Pin name = IO_L11N_T1_SRCC_15,					Sch name = BTNC
    set_property PACKAGE_PIN E16 [get_ports btnC]                        
        set_property IOSTANDARD LVCMOS33 [get_ports btnC]