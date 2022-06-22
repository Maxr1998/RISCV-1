# ----------------------------------------------------------------------------
#     _____
#    / #   /____   \____
#  / \===\   \==/
# /___\===\___\/  AVNET Design Resource Center
#      \======/         www.em.avnet.com/drc
#       \====/
# ----------------------------------------------------------------------------
#
#  Created With Avnet UCF Generator V0.4.0
#     Date: Saturday, June 30, 2012
#     Time: 12:18:55 AM
#
#  This design is the property of Avnet.  Publication of this
#  design is not authorized without written consent from Avnet.
#
#  Please direct any questions to:
#     ZedBoard.org Community Forums
#     http://www.zedboard.org
#
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2012 Avnet, Inc.
#                              All rights reserved.
#
# ----------------------------------------------------------------------------
#
#  Notes:
#
#  10 August 2012
#     IO standards based upon Bank 34 and Bank 35 Vcco supply options of 1.8V,
#     2.5V, or 3.3V are possible based upon the Vadj jumper (J18) settings.
#     By default, Vadj is expected to be set to 1.8V but if a different
#     voltage is used for a particular design, then the corresponding IO
#     standard within this UCF should also be updated to reflect the actual
#     Vadj jumper selection.
#
#  09 September 2012
#     Net names are not allowed to contain hyphen characters '-' since this
#     is not a legal VHDL87 or Verilog character within an identifier.
#     HDL net names are adjusted to contain no hyphen characters '-' but
#     rather use underscore '_' characters.  Comment net name with the hyphen
#     characters will remain in place since these are intended to match the
#     schematic net names in order to better enable schematic search.
#
#  17 April 2014
#     Pin constraint for toggle switch SW7 was corrected to M15 location.
#
#  16 April 2015
#     Corrected the way that entire banks are assigned to a particular IO
#     standard so that it works with more recent versions of Vivado Design
#     Suite and moved the IO standard constraints to the end of the file
#     along with some better organization and notes like we do with our SOMs.
#
#   6 June 2016
#     Corrected error in signal name for package pin N19 (FMC Expansion Connector)
#
#
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Audio Codec - Bank 13
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN AB1 [get_ports {AC_ADR0}];  # "AC-ADR0"
#set_property PACKAGE_PIN Y5  [get_ports {AC_ADR1}];  # "AC-ADR1"
#set_property PACKAGE_PIN Y8  [get_ports {SDATA_O}];  # "AC-GPIO0"
#set_property PACKAGE_PIN AA7 [get_ports {SDATA_I}];  # "AC-GPIO1"
#set_property PACKAGE_PIN AA6 [get_ports {BCLK_O}];  # "AC-GPIO2"
#set_property PACKAGE_PIN Y6  [get_ports {LRCLK_O}];  # "AC-GPIO3"
#set_property PACKAGE_PIN AB2 [get_ports {MCLK_O}];  # "AC-MCLK"
#set_property PACKAGE_PIN AB4 [get_ports {iic_rtl_scl_io}];  # "AC-SCK"
#set_property PACKAGE_PIN AB5 [get_ports {iic_rtl_sda_io}];  # "AC-SDA"

# ----------------------------------------------------------------------------
# Clock Source - Bank 13
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN Y9 [get_ports GCLK]

# ----------------------------------------------------------------------------
# JA Pmod - Bank 13
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN Y11  [get_ports {JA1}];  # "JA1"
#set_property PACKAGE_PIN AA8  [get_ports {JA10}];  # "JA10"
#set_property PACKAGE_PIN AA11 [get_ports {JA2}];  # "JA2"
#set_property PACKAGE_PIN Y10  [get_ports {JA3}];  # "JA3"
#set_property PACKAGE_PIN AA9  [get_ports {JA4}];  # "JA4"
#set_property PACKAGE_PIN AB11 [get_ports {JA7}];  # "JA7"
#set_property PACKAGE_PIN AB10 [get_ports {JA8}];  # "JA8"
#set_property PACKAGE_PIN AB9  [get_ports {JA9}];  # "JA9"


# ----------------------------------------------------------------------------
# JB Pmod - Bank 13
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN W12 [get_ports {JB1}];  # "JB1"
#set_property PACKAGE_PIN W11 [get_ports {JB2}];  # "JB2"
#set_property PACKAGE_PIN V10 [get_ports {JB3}];  # "JB3"
#set_property PACKAGE_PIN W8 [get_ports {JB4}];  # "JB4"
#set_property PACKAGE_PIN V12 [get_ports {JB7}];  # "JB7"
#set_property PACKAGE_PIN W10 [get_ports {JB8}];  # "JB8"
#set_property PACKAGE_PIN V9 [get_ports {JB9}];  # "JB9"
#set_property PACKAGE_PIN V8 [get_ports {JB10}];  # "JB10"

# ----------------------------------------------------------------------------
# JC Pmod - Bank 13
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN AB6 [get_ports {JC1_N}];  # "JC1_N"
#set_property PACKAGE_PIN AB7 [get_ports {JC1_P}];  # "JC1_P"
#set_property PACKAGE_PIN AA4 [get_ports {JC2_N}];  # "JC2_N"
#set_property PACKAGE_PIN Y4  [get_ports {JC2_P}];  # "JC2_P"
#set_property PACKAGE_PIN T6  [get_ports {JC3_N}];  # "JC3_N"
#set_property PACKAGE_PIN R6  [get_ports {JC3_P}];  # "JC3_P"
#set_property PACKAGE_PIN U4  [get_ports {JC4_N}];  # "JC4_N"
#set_property PACKAGE_PIN T4  [get_ports {JC4_P}];  # "JC4_P"

# ----------------------------------------------------------------------------
# JD Pmod - Bank 13
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN W7 [get_ports {JD1_N}];  # "JD1_N"
#set_property PACKAGE_PIN V7 [get_ports {JD1_P}];  # "JD1_P"
#set_property PACKAGE_PIN V4 [get_ports {JD2_N}];  # "JD2_N"
#set_property PACKAGE_PIN V5 [get_ports {JD2_P}];  # "JD2_P"
#set_property PACKAGE_PIN W5 [get_ports {JD3_N}];  # "JD3_N"
#set_property PACKAGE_PIN W6 [get_ports {JD3_P}];  # "JD3_P"
#set_property PACKAGE_PIN U5 [get_ports {JD4_N}];  # "JD4_N"
#set_property PACKAGE_PIN U6 [get_ports {JD4_P}];  # "JD4_P"

# ----------------------------------------------------------------------------
# OLED Display - Bank 13
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN U10  [get_ports {OLED_DC}];  # "OLED-DC"
#set_property PACKAGE_PIN U9   [get_ports {OLED_RES}];  # "OLED-RES"
#set_property PACKAGE_PIN AB12 [get_ports {OLED_SCLK}];  # "OLED-SCLK"
#set_property PACKAGE_PIN AA12 [get_ports {OLED_SDIN}];  # "OLED-SDIN"
#set_property PACKAGE_PIN U11  [get_ports {OLED_VBAT}];  # "OLED-VBAT"
#set_property PACKAGE_PIN U12  [get_ports {OLED_VDD}];  # "OLED-VDD"

# ----------------------------------------------------------------------------
# HDMI Output - Bank 33
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN W18  [get_ports {HD_CLK}];  # "HD-CLK"
#set_property PACKAGE_PIN Y13  [get_ports {HD_D0}];  # "HD-D0"
#set_property PACKAGE_PIN AA13 [get_ports {HD_D1}];  # "HD-D1"
#set_property PACKAGE_PIN W13  [get_ports {HD_D10}];  # "HD-D10"
#set_property PACKAGE_PIN W15  [get_ports {HD_D11}];  # "HD-D11"
#set_property PACKAGE_PIN V15  [get_ports {HD_D12}];  # "HD-D12"
#set_property PACKAGE_PIN U17  [get_ports {HD_D13}];  # "HD-D13"
#set_property PACKAGE_PIN V14  [get_ports {HD_D14}];  # "HD-D14"
#set_property PACKAGE_PIN V13  [get_ports {HS_D15}];  # "HD-D15"
#set_property PACKAGE_PIN AA14 [get_ports {HD_D2}];  # "HD-D2"
#set_property PACKAGE_PIN Y14  [get_ports {HD_D3}];  # "HD-D3"
#set_property PACKAGE_PIN AB15 [get_ports {HD_D4}];  # "HD-D4"
#set_property PACKAGE_PIN AB16 [get_ports {HD_D5}];  # "HD-D5"
#set_property PACKAGE_PIN AA16 [get_ports {HD_D6}];  # "HD-D6"
#set_property PACKAGE_PIN AB17 [get_ports {HD_D7}];  # "HD-D7"
#set_property PACKAGE_PIN AA17 [get_ports {HD_D8}];  # "HD-D8"
#set_property PACKAGE_PIN Y15  [get_ports {HD_D9}];  # "HD-D9"
#set_property PACKAGE_PIN U16  [get_ports {HD_DE}];  # "HD-DE"
#set_property PACKAGE_PIN V17  [get_ports {HD_HSYNC}];  # "HD-HSYNC"
#set_property PACKAGE_PIN W16  [get_ports {HD_INT}];  # "HD-INT"
#set_property PACKAGE_PIN AA18 [get_ports {HD_SCL}];  # "HD-SCL"
#set_property PACKAGE_PIN Y16  [get_ports {HD_SDA}];  # "HD-SDA"
#set_property PACKAGE_PIN U15  [get_ports {HD_SPDIF}];  # "HD-SPDIF"
#set_property PACKAGE_PIN Y18  [get_ports {HD_SPDIFO}];  # "HD-SPDIFO"
#set_property PACKAGE_PIN W17  [get_ports {HD_VSYNC}];  # "HD-VSYNC"

# ----------------------------------------------------------------------------
# User LEDs - Bank 33
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN T22 [get_ports {LD0}];  # "LD0"
#set_property PACKAGE_PIN T21 [get_ports {LD1}];  # "LD1"
#set_property PACKAGE_PIN U22 [get_ports {LD2}];  # "LD2"
#set_property PACKAGE_PIN U21 [get_ports {LD3}];  # "LD3"
#set_property PACKAGE_PIN V22 [get_ports {LD4}];  # "LD4"
#set_property PACKAGE_PIN W22 [get_ports {LD5}];  # "LD5"
#set_property PACKAGE_PIN U19 [get_ports {LD6}];  # "LD6"
#set_property PACKAGE_PIN U14 [get_ports {LD7}];  # "LD7"

# ----------------------------------------------------------------------------
# VGA Output - Bank 33
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN Y21  [get_ports {VGA_B1}];  # "VGA-B1"
#set_property PACKAGE_PIN Y20  [get_ports {VGA_B2}];  # "VGA-B2"
#set_property PACKAGE_PIN AB20 [get_ports {VGA_B3}];  # "VGA-B3"
#set_property PACKAGE_PIN AB19 [get_ports {VGA_B4}];  # "VGA-B4"
#set_property PACKAGE_PIN AB22 [get_ports {VGA_G1}];  # "VGA-G1"
#set_property PACKAGE_PIN AA22 [get_ports {VGA_G2}];  # "VGA-G2"
#set_property PACKAGE_PIN AB21 [get_ports {VGA_G3}];  # "VGA-G3"
#set_property PACKAGE_PIN AA21 [get_ports {VGA_G4}];  # "VGA-G4"
#set_property PACKAGE_PIN AA19 [get_ports {VGA_HS}];  # "VGA-HS"
#set_property PACKAGE_PIN V20  [get_ports {VGA_R1}];  # "VGA-R1"
#set_property PACKAGE_PIN U20  [get_ports {VGA_R2}];  # "VGA-R2"
#set_property PACKAGE_PIN V19  [get_ports {VGA_R3}];  # "VGA-R3"
#set_property PACKAGE_PIN V18  [get_ports {VGA_R4}];  # "VGA-R4"
#set_property PACKAGE_PIN Y19  [get_ports {VGA_VS}];  # "VGA-VS"

# ----------------------------------------------------------------------------
# User Push Buttons - Bank 34
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN P16 [get_ports {BTNC}];  # "BTNC"
#set_property PACKAGE_PIN R16 [get_ports {BTND}];  # "BTND"
set_property PACKAGE_PIN N15 [get_ports BTNL]
#set_property PACKAGE_PIN R18 [get_ports {BTNR}];  # "BTNR"
#set_property PACKAGE_PIN T18 [get_ports {BTNU}];  # "BTNU"

# ----------------------------------------------------------------------------
# USB OTG Reset - Bank 34
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN L16 [get_ports {OTG_VBUSOC}];  # "OTG-VBUSOC"

# ----------------------------------------------------------------------------
# XADC GIO - Bank 34
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN H15 [get_ports {XADC_GIO0}];  # "XADC-GIO0"
#set_property PACKAGE_PIN R15 [get_ports {XADC_GIO1}];  # "XADC-GIO1"
#set_property PACKAGE_PIN K15 [get_ports {XADC_GIO2}];  # "XADC-GIO2"
#set_property PACKAGE_PIN J15 [get_ports {XADC_GIO3}];  # "XADC-GIO3"

# ----------------------------------------------------------------------------
# Miscellaneous - Bank 34
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN K16 [get_ports {PUDC_B}];  # "PUDC_B"

## ----------------------------------------------------------------------------
## USB OTG Reset - Bank 35
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN G17 [get_ports {OTG_RESETN}];  # "OTG-RESETN"

## ----------------------------------------------------------------------------
## User DIP Switches - Bank 35
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN F22 [get_ports {SW0}];  # "SW0"
#set_property PACKAGE_PIN G22 [get_ports {SW1}];  # "SW1"
#set_property PACKAGE_PIN H22 [get_ports {SW2}];  # "SW2"
#set_property PACKAGE_PIN F21 [get_ports {SW3}];  # "SW3"
#set_property PACKAGE_PIN H19 [get_ports {SW4}];  # "SW4"
#set_property PACKAGE_PIN H18 [get_ports {SW5}];  # "SW5"
#set_property PACKAGE_PIN H17 [get_ports {SW6}];  # "SW6"
#set_property PACKAGE_PIN M15 [get_ports {SW7}];  # "SW7"

## ----------------------------------------------------------------------------
## XADC AD Channels - Bank 35
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN E16 [get_ports {AD0N_R}];  # "XADC-AD0N-R"
#set_property PACKAGE_PIN F16 [get_ports {AD0P_R}];  # "XADC-AD0P-R"
#set_property PACKAGE_PIN D17 [get_ports {AD8N_N}];  # "XADC-AD8N-R"
#set_property PACKAGE_PIN D16 [get_ports {AD8P_R}];  # "XADC-AD8P-R"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 13
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN R7 [get_ports {FMC_SCL}];  # "FMC-SCL"
#set_property PACKAGE_PIN U7 [get_ports {FMC_SDA}];  # "FMC-SDA"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 33
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN AB14 [get_ports {FMC_PRSNT}];  # "FMC-PRSNT"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 34
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN L19 [get_ports {FMC_CLK0_N}];  # "FMC-CLK0_N"
#set_property PACKAGE_PIN L18 [get_ports {FMC_CLK0_P}];  # "FMC-CLK0_P"
#set_property PACKAGE_PIN M20 [get_ports {FMC_LA00_CC_N}];  # "FMC-LA00_CC_N"
#set_property PACKAGE_PIN M19 [get_ports {FMC_LA00_CC_P}];  # "FMC-LA00_CC_P"
#set_property PACKAGE_PIN N20 [get_ports {FMC_LA01_CC_N}];  # "FMC-LA01_CC_N"
#set_property PACKAGE_PIN N19 [get_ports {FMC_LA01_CC_P}];  # "FMC-LA01_CC_P" - corrected 6/6/16 GE
#set_property PACKAGE_PIN P18 [get_ports {FMC_LA02_N}];  # "FMC-LA02_N"
#set_property PACKAGE_PIN P17 [get_ports {FMC_LA02_P}];  # "FMC-LA02_P"
#set_property PACKAGE_PIN P22 [get_ports {FMC_LA03_N}];  # "FMC-LA03_N"
#set_property PACKAGE_PIN N22 [get_ports {FMC_LA03_P}];  # "FMC-LA03_P"
#set_property PACKAGE_PIN M22 [get_ports {FMC_LA04_N}];  # "FMC-LA04_N"
#set_property PACKAGE_PIN M21 [get_ports {FMC_LA04_P}];  # "FMC-LA04_P"
#set_property PACKAGE_PIN K18 [get_ports {FMC_LA05_N}];  # "FMC-LA05_N"
#set_property PACKAGE_PIN J18 [get_ports {FMC_LA05_P}];  # "FMC-LA05_P"
#set_property PACKAGE_PIN L22 [get_ports {FMC_LA06_N}];  # "FMC-LA06_N"
#set_property PACKAGE_PIN L21 [get_ports {FMC_LA06_P}];  # "FMC-LA06_P"
#set_property PACKAGE_PIN T17 [get_ports {FMC_LA07_N}];  # "FMC-LA07_N"
#set_property PACKAGE_PIN T16 [get_ports {FMC_LA07_P}];  # "FMC-LA07_P"
#set_property PACKAGE_PIN J22 [get_ports {FMC_LA08_N}];  # "FMC-LA08_N"
#set_property PACKAGE_PIN J21 [get_ports {FMC_LA08_P}];  # "FMC-LA08_P"
#set_property PACKAGE_PIN R21 [get_ports {FMC_LA09_N}];  # "FMC-LA09_N"
#set_property PACKAGE_PIN R20 [get_ports {FMC_LA09_P}];  # "FMC-LA09_P"
#set_property PACKAGE_PIN T19 [get_ports {FMC_LA10_N}];  # "FMC-LA10_N"
#set_property PACKAGE_PIN R19 [get_ports {FMC_LA10_P}];  # "FMC-LA10_P"
#set_property PACKAGE_PIN N18 [get_ports {FMC_LA11_N}];  # "FMC-LA11_N"
#set_property PACKAGE_PIN N17 [get_ports {FMC_LA11_P}];  # "FMC-LA11_P"
#set_property PACKAGE_PIN P21 [get_ports {FMC_LA12_N}];  # "FMC-LA12_N"
#set_property PACKAGE_PIN P20 [get_ports {FMC_LA12_P}];  # "FMC-LA12_P"
#set_property PACKAGE_PIN M17 [get_ports {FMC_LA13_N}];  # "FMC-LA13_N"
#set_property PACKAGE_PIN L17 [get_ports {FMC_LA13_P}];  # "FMC-LA13_P"
#set_property PACKAGE_PIN K20 [get_ports {FMC_LA14_N}];  # "FMC-LA14_N"
#set_property PACKAGE_PIN K19 [get_ports {FMC_LA14_P}];  # "FMC-LA14_P"
#set_property PACKAGE_PIN J17 [get_ports {FMC_LA15_N}];  # "FMC-LA15_N"
#set_property PACKAGE_PIN J16 [get_ports {FMC_LA15_P}];  # "FMC-LA15_P"
#set_property PACKAGE_PIN K21 [get_ports {FMC_LA16_N}];  # "FMC-LA16_N"
#set_property PACKAGE_PIN J20 [get_ports {FMC_LA16_P}];  # "FMC-LA16_P"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 35
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN C19 [get_ports {FMC_CLK1_N}];  # "FMC-CLK1_N"
#set_property PACKAGE_PIN D18 [get_ports {FMC_CLK1_P}];  # "FMC-CLK1_P"
#set_property PACKAGE_PIN B20 [get_ports {FMC_LA17_CC_N}];  # "FMC-LA17_CC_N"
#set_property PACKAGE_PIN B19 [get_ports {FMC_LA17_CC_P}];  # "FMC-LA17_CC_P"
#set_property PACKAGE_PIN C20 [get_ports {FMC_LA18_CC_N}];  # "FMC-LA18_CC_N"
#set_property PACKAGE_PIN D20 [get_ports {FMC_LA18_CC_P}];  # "FMC-LA18_CC_P"
#set_property PACKAGE_PIN G16 [get_ports {FMC_LA19_N}];  # "FMC-LA19_N"
#set_property PACKAGE_PIN G15 [get_ports {FMC_LA19_P}];  # "FMC-LA19_P"
#set_property PACKAGE_PIN G21 [get_ports {FMC_LA20_N}];  # "FMC-LA20_N"
#set_property PACKAGE_PIN G20 [get_ports {FMC_LA20_P}];  # "FMC-LA20_P"
#set_property PACKAGE_PIN E20 [get_ports {FMC_LA21_N}];  # "FMC-LA21_N"
#set_property PACKAGE_PIN E19 [get_ports {FMC_LA21_P}];  # "FMC-LA21_P"
#set_property PACKAGE_PIN F19 [get_ports {FMC_LA22_N}];  # "FMC-LA22_N"
#set_property PACKAGE_PIN G19 [get_ports {FMC_LA22_P}];  # "FMC-LA22_P"
#set_property PACKAGE_PIN D15 [get_ports {FMC_LA23_N}];  # "FMC-LA23_N"
#set_property PACKAGE_PIN E15 [get_ports {FMC_LA23_P}];  # "FMC-LA23_P"
#set_property PACKAGE_PIN A19 [get_ports {FMC_LA24_N}];  # "FMC-LA24_N"
#set_property PACKAGE_PIN A18 [get_ports {FMC_LA24_P}];  # "FMC-LA24_P"
#set_property PACKAGE_PIN C22 [get_ports {FMC_LA25_N}];  # "FMC-LA25_N"
#set_property PACKAGE_PIN D22 [get_ports {FMC_LA25_P}];  # "FMC-LA25_P"
#set_property PACKAGE_PIN E18 [get_ports {FMC_LA26_N}];  # "FMC-LA26_N"
#set_property PACKAGE_PIN F18 [get_ports {FMC_LA26_P}];  # "FMC-LA26_P"
#set_property PACKAGE_PIN D21 [get_ports {FMC_LA27_N}];  # "FMC-LA27_N"
#set_property PACKAGE_PIN E21 [get_ports {FMC_LA27_P}];  # "FMC-LA27_P"
#set_property PACKAGE_PIN A17 [get_ports {FMC_LA28_N}];  # "FMC-LA28_N"
#set_property PACKAGE_PIN A16 [get_ports {FMC_LA28_P}];  # "FMC-LA28_P"
#set_property PACKAGE_PIN C18 [get_ports {FMC_LA29_N}];  # "FMC-LA29_N"
#set_property PACKAGE_PIN C17 [get_ports {FMC_LA29_P}];  # "FMC-LA29_P"
#set_property PACKAGE_PIN B15 [get_ports {FMC_LA30_N}];  # "FMC-LA30_N"
#set_property PACKAGE_PIN C15 [get_ports {FMC_LA30_P}];  # "FMC-LA30_P"
#set_property PACKAGE_PIN B17 [get_ports {FMC_LA31_N}];  # "FMC-LA31_N"
#set_property PACKAGE_PIN B16 [get_ports {FMC_LA31_P}];  # "FMC-LA31_P"
#set_property PACKAGE_PIN A22 [get_ports {FMC_LA32_N}];  # "FMC-LA32_N"
#set_property PACKAGE_PIN A21 [get_ports {FMC_LA32_P}];  # "FMC-LA32_P"
#set_property PACKAGE_PIN B22 [get_ports {FMC_LA33_N}];  # "FMC-LA33_N"
#set_property PACKAGE_PIN B21 [get_ports {FMC_LA33_P}];  # "FMC-LA33_P"


# ----------------------------------------------------------------------------
# IOSTANDARD Constraints
#
# Note that these IOSTANDARD constraints are applied to all IOs currently
# assigned within an I/O bank.  If these IOSTANDARD constraints are
# evaluated prior to other PACKAGE_PIN constraints being applied, then
# the IOSTANDARD specified will likely not be applied properly to those
# pins.  Therefore, bank wide IOSTANDARD constraints should be placed
# within the XDC file in a location that is evaluated AFTER all
# PACKAGE_PIN constraints within the target bank have been evaluated.
#
# Un-comment one or more of the following IOSTANDARD constraints according to
# the bank pin assignments that are required within a design.
# ----------------------------------------------------------------------------

# Note that the bank voltage for IO Bank 33 is fixed to 3.3V on ZedBoard.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]];

# Set the bank voltage for IO Bank 34 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 34]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]]

# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];

# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]]

set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[0]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[1]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[10]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[11]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[12]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[13]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[14]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[15]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[16]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[17]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[18]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[19]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[2]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[20]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[21]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[22]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[23]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[24]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[25]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[26]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[27]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[28]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[29]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[3]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[30]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[31]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[4]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[5]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[6]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[7]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[8]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/A[9]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[0]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[1]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[10]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[11]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[12]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[13]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[14]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[15]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[16]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[17]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[18]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[19]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[2]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[20]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[21]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[22]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[23]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[24]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[25]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[26]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[27]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[28]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[29]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[3]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[30]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[31]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[4]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[5]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[6]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[7]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[8]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/B[9]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/Funct[0]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/Funct[1]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/Funct[2]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[0]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[1]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[10]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[11]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[12]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[13]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[14]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[15]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[16]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[17]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[18]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[19]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[2]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[20]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[21]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[22]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[23]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[24]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[25]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[26]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[27]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[28]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[29]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[3]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[30]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[31]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[4]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[5]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[6]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[7]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[8]}]
set_property MARK_DEBUG true [get_nets {processor_i/ALU_0/X[9]}]
set_property MARK_DEBUG true [get_nets processor_i/GCLK]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list GCLK_IBUF]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[0]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[1]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[2]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[3]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[4]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[5]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[6]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[7]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[8]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[9]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[10]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[11]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[12]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[13]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[14]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[15]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[16]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[17]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[18]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[19]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[20]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[21]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[22]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[23]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[24]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[25]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[26]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[27]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[28]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[29]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[30]} {processor_i/RegisterSet_0/U0/Registers_reg[8]_8[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[0]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[1]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[2]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[3]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[4]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[5]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[6]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[7]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[8]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[9]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[10]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[11]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[12]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[13]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[14]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[15]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[16]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[17]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[18]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[19]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[20]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[21]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[22]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[23]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[24]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[25]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[26]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[27]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[28]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[29]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[30]} {processor_i/RegisterSet_0/U0/Registers_reg[30]_30[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[0]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[1]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[2]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[3]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[4]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[5]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[6]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[7]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[8]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[9]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[10]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[11]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[12]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[13]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[14]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[15]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[16]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[17]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[18]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[19]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[20]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[21]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[22]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[23]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[24]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[25]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[26]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[27]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[28]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[29]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[30]} {processor_i/RegisterSet_0/U0/Registers_reg[2]_2[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[0]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[1]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[2]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[3]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[4]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[5]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[6]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[7]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[8]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[9]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[10]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[11]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[12]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[13]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[14]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[15]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[16]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[17]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[18]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[19]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[20]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[21]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[22]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[23]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[24]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[25]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[26]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[27]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[28]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[29]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[30]} {processor_i/RegisterSet_0/U0/Registers_reg[29]_29[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[0]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[1]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[2]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[3]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[4]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[5]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[6]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[7]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[8]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[9]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[10]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[11]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[12]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[13]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[14]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[15]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[16]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[17]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[18]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[19]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[20]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[21]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[22]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[23]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[24]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[25]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[26]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[27]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[28]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[29]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[30]} {processor_i/RegisterSet_0/U0/Registers_reg[28]_28[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[0]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[1]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[2]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[3]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[4]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[5]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[6]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[7]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[8]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[9]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[10]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[11]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[12]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[13]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[14]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[15]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[16]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[17]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[18]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[19]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[20]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[21]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[22]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[23]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[24]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[25]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[26]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[27]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[28]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[29]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[30]} {processor_i/RegisterSet_0/U0/Registers_reg[24]_24[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[0]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[1]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[2]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[3]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[4]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[5]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[6]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[7]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[8]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[9]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[10]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[11]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[12]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[13]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[14]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[15]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[16]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[17]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[18]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[19]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[20]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[21]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[22]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[23]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[24]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[25]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[26]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[27]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[28]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[29]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[30]} {processor_i/RegisterSet_0/U0/Registers_reg[1]_1[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[0]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[1]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[2]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[3]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[4]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[5]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[6]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[7]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[8]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[9]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[10]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[11]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[12]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[13]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[14]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[15]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[16]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[17]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[18]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[19]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[20]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[21]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[22]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[23]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[24]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[25]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[26]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[27]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[28]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[29]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[30]} {processor_i/RegisterSet_0/U0/Registers_reg[19]_19[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[0]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[1]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[2]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[3]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[4]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[5]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[6]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[7]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[8]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[9]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[10]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[11]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[12]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[13]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[14]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[15]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[16]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[17]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[18]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[19]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[20]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[21]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[22]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[23]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[24]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[25]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[26]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[27]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[28]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[29]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[30]} {processor_i/RegisterSet_0/U0/Registers_reg[18]_18[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[0]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[1]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[2]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[3]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[4]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[5]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[6]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[7]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[8]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[9]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[10]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[11]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[12]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[13]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[14]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[15]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[16]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[17]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[18]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[19]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[20]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[21]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[22]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[23]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[24]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[25]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[26]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[27]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[28]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[29]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[30]} {processor_i/RegisterSet_0/U0/Registers_reg[14]_14[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[0]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[1]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[2]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[3]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[4]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[5]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[6]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[7]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[8]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[9]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[10]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[11]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[12]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[13]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[14]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[15]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[16]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[17]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[18]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[19]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[20]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[21]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[22]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[23]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[24]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[25]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[26]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[27]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[28]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[29]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[30]} {processor_i/RegisterSet_0/U0/Registers_reg[11]_11[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 32 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[0]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[1]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[2]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[3]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[4]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[5]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[6]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[7]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[8]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[9]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[10]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[11]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[12]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[13]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[14]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[15]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[16]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[17]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[18]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[19]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[20]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[21]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[22]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[23]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[24]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[25]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[26]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[27]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[28]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[29]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[30]} {processor_i/RegisterSet_0/U0/Registers_reg[6]_6[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 32 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[0]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[1]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[2]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[3]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[4]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[5]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[6]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[7]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[8]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[9]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[10]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[11]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[12]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[13]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[14]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[15]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[16]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[17]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[18]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[19]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[20]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[21]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[22]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[23]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[24]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[25]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[26]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[27]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[28]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[29]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[30]} {processor_i/RegisterSet_0/U0/Registers_reg[7]_7[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 32 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[0]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[1]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[2]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[3]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[4]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[5]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[6]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[7]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[8]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[9]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[10]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[11]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[12]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[13]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[14]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[15]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[16]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[17]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[18]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[19]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[20]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[21]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[22]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[23]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[24]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[25]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[26]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[27]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[28]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[29]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[30]} {processor_i/RegisterSet_0/U0/Registers_reg[27]_27[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 32 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[0]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[1]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[2]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[3]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[4]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[5]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[6]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[7]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[8]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[9]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[10]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[11]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[12]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[13]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[14]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[15]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[16]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[17]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[18]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[19]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[20]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[21]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[22]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[23]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[24]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[25]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[26]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[27]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[28]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[29]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[30]} {processor_i/RegisterSet_0/U0/Registers_reg[26]_26[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 32 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[0]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[1]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[2]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[3]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[4]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[5]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[6]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[7]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[8]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[9]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[10]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[11]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[12]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[13]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[14]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[15]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[16]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[17]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[18]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[19]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[20]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[21]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[22]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[23]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[24]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[25]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[26]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[27]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[28]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[29]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[30]} {processor_i/RegisterSet_0/U0/Registers_reg[25]_25[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 32 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[0]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[1]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[2]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[3]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[4]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[5]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[6]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[7]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[8]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[9]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[10]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[11]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[12]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[13]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[14]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[15]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[16]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[17]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[18]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[19]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[20]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[21]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[22]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[23]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[24]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[25]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[26]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[27]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[28]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[29]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[30]} {processor_i/RegisterSet_0/U0/Registers_reg[0]_0[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 32 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[0]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[1]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[2]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[3]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[4]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[5]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[6]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[7]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[8]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[9]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[10]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[11]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[12]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[13]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[14]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[15]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[16]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[17]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[18]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[19]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[20]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[21]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[22]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[23]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[24]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[25]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[26]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[27]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[28]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[29]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[30]} {processor_i/RegisterSet_0/U0/Registers_reg[12]_12[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 32 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[0]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[1]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[2]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[3]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[4]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[5]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[6]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[7]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[8]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[9]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[10]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[11]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[12]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[13]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[14]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[15]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[16]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[17]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[18]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[19]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[20]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[21]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[22]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[23]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[24]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[25]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[26]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[27]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[28]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[29]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[30]} {processor_i/RegisterSet_0/U0/Registers_reg[9]_9[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 32 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[0]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[1]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[2]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[3]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[4]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[5]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[6]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[7]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[8]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[9]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[10]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[11]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[12]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[13]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[14]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[15]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[16]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[17]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[18]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[19]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[20]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[21]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[22]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[23]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[24]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[25]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[26]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[27]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[28]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[29]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[30]} {processor_i/RegisterSet_0/U0/Registers_reg[5]_5[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 32 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[0]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[1]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[2]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[3]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[4]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[5]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[6]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[7]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[8]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[9]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[10]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[11]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[12]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[13]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[14]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[15]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[16]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[17]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[18]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[19]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[20]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[21]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[22]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[23]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[24]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[25]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[26]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[27]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[28]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[29]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[30]} {processor_i/RegisterSet_0/U0/Registers_reg[4]_4[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 32 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[0]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[1]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[2]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[3]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[4]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[5]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[6]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[7]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[8]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[9]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[10]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[11]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[12]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[13]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[14]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[15]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[16]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[17]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[18]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[19]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[20]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[21]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[22]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[23]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[24]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[25]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[26]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[27]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[28]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[29]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[30]} {processor_i/RegisterSet_0/U0/Registers_reg[3]_3[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 32 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[0]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[1]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[2]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[3]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[4]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[5]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[6]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[7]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[8]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[9]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[10]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[11]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[12]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[13]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[14]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[15]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[16]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[17]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[18]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[19]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[20]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[21]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[22]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[23]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[24]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[25]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[26]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[27]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[28]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[29]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[30]} {processor_i/RegisterSet_0/U0/Registers_reg[31]_31[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 32 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[0]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[1]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[2]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[3]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[4]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[5]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[6]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[7]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[8]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[9]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[10]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[11]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[12]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[13]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[14]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[15]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[16]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[17]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[18]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[19]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[20]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[21]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[22]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[23]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[24]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[25]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[26]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[27]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[28]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[29]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[30]} {processor_i/RegisterSet_0/U0/Registers_reg[23]_23[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 32 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[0]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[1]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[2]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[3]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[4]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[5]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[6]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[7]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[8]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[9]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[10]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[11]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[12]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[13]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[14]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[15]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[16]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[17]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[18]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[19]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[20]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[21]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[22]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[23]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[24]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[25]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[26]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[27]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[28]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[29]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[30]} {processor_i/RegisterSet_0/U0/Registers_reg[21]_21[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 32 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[0]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[1]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[2]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[3]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[4]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[5]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[6]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[7]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[8]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[9]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[10]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[11]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[12]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[13]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[14]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[15]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[16]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[17]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[18]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[19]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[20]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[21]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[22]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[23]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[24]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[25]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[26]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[27]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[28]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[29]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[30]} {processor_i/RegisterSet_0/U0/Registers_reg[16]_16[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 32 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[0]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[1]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[2]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[3]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[4]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[5]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[6]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[7]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[8]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[9]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[10]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[11]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[12]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[13]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[14]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[15]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[16]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[17]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[18]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[19]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[20]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[21]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[22]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[23]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[24]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[25]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[26]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[27]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[28]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[29]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[30]} {processor_i/RegisterSet_0/U0/Registers_reg[22]_22[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 32 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[0]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[1]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[2]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[3]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[4]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[5]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[6]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[7]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[8]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[9]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[10]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[11]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[12]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[13]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[14]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[15]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[16]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[17]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[18]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[19]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[20]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[21]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[22]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[23]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[24]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[25]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[26]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[27]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[28]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[29]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[30]} {processor_i/RegisterSet_0/U0/Registers_reg[20]_20[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 32 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[0]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[1]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[2]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[3]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[4]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[5]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[6]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[7]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[8]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[9]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[10]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[11]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[12]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[13]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[14]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[15]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[16]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[17]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[18]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[19]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[20]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[21]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[22]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[23]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[24]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[25]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[26]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[27]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[28]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[29]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[30]} {processor_i/RegisterSet_0/U0/Registers_reg[17]_17[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 32 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[0]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[1]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[2]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[3]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[4]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[5]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[6]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[7]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[8]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[9]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[10]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[11]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[12]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[13]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[14]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[15]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[16]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[17]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[18]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[19]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[20]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[21]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[22]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[23]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[24]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[25]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[26]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[27]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[28]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[29]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[30]} {processor_i/RegisterSet_0/U0/Registers_reg[15]_15[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 32 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[0]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[1]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[2]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[3]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[4]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[5]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[6]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[7]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[8]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[9]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[10]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[11]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[12]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[13]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[14]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[15]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[16]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[17]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[18]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[19]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[20]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[21]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[22]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[23]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[24]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[25]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[26]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[27]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[28]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[29]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[30]} {processor_i/RegisterSet_0/U0/Registers_reg[13]_13[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 32 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[0]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[1]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[2]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[3]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[4]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[5]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[6]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[7]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[8]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[9]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[10]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[11]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[12]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[13]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[14]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[15]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[16]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[17]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[18]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[19]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[20]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[21]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[22]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[23]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[24]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[25]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[26]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[27]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[28]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[29]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[30]} {processor_i/RegisterSet_0/U0/Registers_reg[10]_10[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 32 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {processor_i/ALU_0/B[0]} {processor_i/ALU_0/B[1]} {processor_i/ALU_0/B[2]} {processor_i/ALU_0/B[3]} {processor_i/ALU_0/B[4]} {processor_i/ALU_0/B[5]} {processor_i/ALU_0/B[6]} {processor_i/ALU_0/B[7]} {processor_i/ALU_0/B[8]} {processor_i/ALU_0/B[9]} {processor_i/ALU_0/B[10]} {processor_i/ALU_0/B[11]} {processor_i/ALU_0/B[12]} {processor_i/ALU_0/B[13]} {processor_i/ALU_0/B[14]} {processor_i/ALU_0/B[15]} {processor_i/ALU_0/B[16]} {processor_i/ALU_0/B[17]} {processor_i/ALU_0/B[18]} {processor_i/ALU_0/B[19]} {processor_i/ALU_0/B[20]} {processor_i/ALU_0/B[21]} {processor_i/ALU_0/B[22]} {processor_i/ALU_0/B[23]} {processor_i/ALU_0/B[24]} {processor_i/ALU_0/B[25]} {processor_i/ALU_0/B[26]} {processor_i/ALU_0/B[27]} {processor_i/ALU_0/B[28]} {processor_i/ALU_0/B[29]} {processor_i/ALU_0/B[30]} {processor_i/ALU_0/B[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 32 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {processor_i/ALU_0/A[0]} {processor_i/ALU_0/A[1]} {processor_i/ALU_0/A[2]} {processor_i/ALU_0/A[3]} {processor_i/ALU_0/A[4]} {processor_i/ALU_0/A[5]} {processor_i/ALU_0/A[6]} {processor_i/ALU_0/A[7]} {processor_i/ALU_0/A[8]} {processor_i/ALU_0/A[9]} {processor_i/ALU_0/A[10]} {processor_i/ALU_0/A[11]} {processor_i/ALU_0/A[12]} {processor_i/ALU_0/A[13]} {processor_i/ALU_0/A[14]} {processor_i/ALU_0/A[15]} {processor_i/ALU_0/A[16]} {processor_i/ALU_0/A[17]} {processor_i/ALU_0/A[18]} {processor_i/ALU_0/A[19]} {processor_i/ALU_0/A[20]} {processor_i/ALU_0/A[21]} {processor_i/ALU_0/A[22]} {processor_i/ALU_0/A[23]} {processor_i/ALU_0/A[24]} {processor_i/ALU_0/A[25]} {processor_i/ALU_0/A[26]} {processor_i/ALU_0/A[27]} {processor_i/ALU_0/A[28]} {processor_i/ALU_0/A[29]} {processor_i/ALU_0/A[30]} {processor_i/ALU_0/A[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 3 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {processor_i/ALU_0/Funct[0]} {processor_i/ALU_0/Funct[1]} {processor_i/ALU_0/Funct[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 32 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {processor_i/MUX_0_O[0]} {processor_i/MUX_0_O[1]} {processor_i/MUX_0_O[2]} {processor_i/MUX_0_O[3]} {processor_i/MUX_0_O[4]} {processor_i/MUX_0_O[5]} {processor_i/MUX_0_O[6]} {processor_i/MUX_0_O[7]} {processor_i/MUX_0_O[8]} {processor_i/MUX_0_O[9]} {processor_i/MUX_0_O[10]} {processor_i/MUX_0_O[11]} {processor_i/MUX_0_O[12]} {processor_i/MUX_0_O[13]} {processor_i/MUX_0_O[14]} {processor_i/MUX_0_O[15]} {processor_i/MUX_0_O[16]} {processor_i/MUX_0_O[17]} {processor_i/MUX_0_O[18]} {processor_i/MUX_0_O[19]} {processor_i/MUX_0_O[20]} {processor_i/MUX_0_O[21]} {processor_i/MUX_0_O[22]} {processor_i/MUX_0_O[23]} {processor_i/MUX_0_O[24]} {processor_i/MUX_0_O[25]} {processor_i/MUX_0_O[26]} {processor_i/MUX_0_O[27]} {processor_i/MUX_0_O[28]} {processor_i/MUX_0_O[29]} {processor_i/MUX_0_O[30]} {processor_i/MUX_0_O[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 32 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {processor_i/MemMux_0_WrData[0]} {processor_i/MemMux_0_WrData[1]} {processor_i/MemMux_0_WrData[2]} {processor_i/MemMux_0_WrData[3]} {processor_i/MemMux_0_WrData[4]} {processor_i/MemMux_0_WrData[5]} {processor_i/MemMux_0_WrData[6]} {processor_i/MemMux_0_WrData[7]} {processor_i/MemMux_0_WrData[8]} {processor_i/MemMux_0_WrData[9]} {processor_i/MemMux_0_WrData[10]} {processor_i/MemMux_0_WrData[11]} {processor_i/MemMux_0_WrData[12]} {processor_i/MemMux_0_WrData[13]} {processor_i/MemMux_0_WrData[14]} {processor_i/MemMux_0_WrData[15]} {processor_i/MemMux_0_WrData[16]} {processor_i/MemMux_0_WrData[17]} {processor_i/MemMux_0_WrData[18]} {processor_i/MemMux_0_WrData[19]} {processor_i/MemMux_0_WrData[20]} {processor_i/MemMux_0_WrData[21]} {processor_i/MemMux_0_WrData[22]} {processor_i/MemMux_0_WrData[23]} {processor_i/MemMux_0_WrData[24]} {processor_i/MemMux_0_WrData[25]} {processor_i/MemMux_0_WrData[26]} {processor_i/MemMux_0_WrData[27]} {processor_i/MemMux_0_WrData[28]} {processor_i/MemMux_0_WrData[29]} {processor_i/MemMux_0_WrData[30]} {processor_i/MemMux_0_WrData[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 32 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {processor_i/ALU_0_MemWrData[0]} {processor_i/ALU_0_MemWrData[1]} {processor_i/ALU_0_MemWrData[2]} {processor_i/ALU_0_MemWrData[3]} {processor_i/ALU_0_MemWrData[4]} {processor_i/ALU_0_MemWrData[5]} {processor_i/ALU_0_MemWrData[6]} {processor_i/ALU_0_MemWrData[7]} {processor_i/ALU_0_MemWrData[8]} {processor_i/ALU_0_MemWrData[9]} {processor_i/ALU_0_MemWrData[10]} {processor_i/ALU_0_MemWrData[11]} {processor_i/ALU_0_MemWrData[12]} {processor_i/ALU_0_MemWrData[13]} {processor_i/ALU_0_MemWrData[14]} {processor_i/ALU_0_MemWrData[15]} {processor_i/ALU_0_MemWrData[16]} {processor_i/ALU_0_MemWrData[17]} {processor_i/ALU_0_MemWrData[18]} {processor_i/ALU_0_MemWrData[19]} {processor_i/ALU_0_MemWrData[20]} {processor_i/ALU_0_MemWrData[21]} {processor_i/ALU_0_MemWrData[22]} {processor_i/ALU_0_MemWrData[23]} {processor_i/ALU_0_MemWrData[24]} {processor_i/ALU_0_MemWrData[25]} {processor_i/ALU_0_MemWrData[26]} {processor_i/ALU_0_MemWrData[27]} {processor_i/ALU_0_MemWrData[28]} {processor_i/ALU_0_MemWrData[29]} {processor_i/ALU_0_MemWrData[30]} {processor_i/ALU_0_MemWrData[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 3 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {processor_i/ExecuteStage_0_FunctO[0]} {processor_i/ExecuteStage_0_FunctO[1]} {processor_i/ExecuteStage_0_FunctO[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 32 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {processor_i/DecodeStage_0_InstO[0]} {processor_i/DecodeStage_0_InstO[1]} {processor_i/DecodeStage_0_InstO[2]} {processor_i/DecodeStage_0_InstO[3]} {processor_i/DecodeStage_0_InstO[4]} {processor_i/DecodeStage_0_InstO[5]} {processor_i/DecodeStage_0_InstO[6]} {processor_i/DecodeStage_0_InstO[7]} {processor_i/DecodeStage_0_InstO[8]} {processor_i/DecodeStage_0_InstO[9]} {processor_i/DecodeStage_0_InstO[10]} {processor_i/DecodeStage_0_InstO[11]} {processor_i/DecodeStage_0_InstO[12]} {processor_i/DecodeStage_0_InstO[13]} {processor_i/DecodeStage_0_InstO[14]} {processor_i/DecodeStage_0_InstO[15]} {processor_i/DecodeStage_0_InstO[16]} {processor_i/DecodeStage_0_InstO[17]} {processor_i/DecodeStage_0_InstO[18]} {processor_i/DecodeStage_0_InstO[19]} {processor_i/DecodeStage_0_InstO[20]} {processor_i/DecodeStage_0_InstO[21]} {processor_i/DecodeStage_0_InstO[22]} {processor_i/DecodeStage_0_InstO[23]} {processor_i/DecodeStage_0_InstO[24]} {processor_i/DecodeStage_0_InstO[25]} {processor_i/DecodeStage_0_InstO[26]} {processor_i/DecodeStage_0_InstO[27]} {processor_i/DecodeStage_0_InstO[28]} {processor_i/DecodeStage_0_InstO[29]} {processor_i/DecodeStage_0_InstO[30]} {processor_i/DecodeStage_0_InstO[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 32 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {processor_i/ALU_0_X[0]} {processor_i/ALU_0_X[1]} {processor_i/ALU_0_X[2]} {processor_i/ALU_0_X[3]} {processor_i/ALU_0_X[4]} {processor_i/ALU_0_X[5]} {processor_i/ALU_0_X[6]} {processor_i/ALU_0_X[7]} {processor_i/ALU_0_X[8]} {processor_i/ALU_0_X[9]} {processor_i/ALU_0_X[10]} {processor_i/ALU_0_X[11]} {processor_i/ALU_0_X[12]} {processor_i/ALU_0_X[13]} {processor_i/ALU_0_X[14]} {processor_i/ALU_0_X[15]} {processor_i/ALU_0_X[16]} {processor_i/ALU_0_X[17]} {processor_i/ALU_0_X[18]} {processor_i/ALU_0_X[19]} {processor_i/ALU_0_X[20]} {processor_i/ALU_0_X[21]} {processor_i/ALU_0_X[22]} {processor_i/ALU_0_X[23]} {processor_i/ALU_0_X[24]} {processor_i/ALU_0_X[25]} {processor_i/ALU_0_X[26]} {processor_i/ALU_0_X[27]} {processor_i/ALU_0_X[28]} {processor_i/ALU_0_X[29]} {processor_i/ALU_0_X[30]} {processor_i/ALU_0_X[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 32 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {processor_i/DecodeStage_0_PCO[0]} {processor_i/DecodeStage_0_PCO[1]} {processor_i/DecodeStage_0_PCO[2]} {processor_i/DecodeStage_0_PCO[3]} {processor_i/DecodeStage_0_PCO[4]} {processor_i/DecodeStage_0_PCO[5]} {processor_i/DecodeStage_0_PCO[6]} {processor_i/DecodeStage_0_PCO[7]} {processor_i/DecodeStage_0_PCO[8]} {processor_i/DecodeStage_0_PCO[9]} {processor_i/DecodeStage_0_PCO[10]} {processor_i/DecodeStage_0_PCO[11]} {processor_i/DecodeStage_0_PCO[12]} {processor_i/DecodeStage_0_PCO[13]} {processor_i/DecodeStage_0_PCO[14]} {processor_i/DecodeStage_0_PCO[15]} {processor_i/DecodeStage_0_PCO[16]} {processor_i/DecodeStage_0_PCO[17]} {processor_i/DecodeStage_0_PCO[18]} {processor_i/DecodeStage_0_PCO[19]} {processor_i/DecodeStage_0_PCO[20]} {processor_i/DecodeStage_0_PCO[21]} {processor_i/DecodeStage_0_PCO[22]} {processor_i/DecodeStage_0_PCO[23]} {processor_i/DecodeStage_0_PCO[24]} {processor_i/DecodeStage_0_PCO[25]} {processor_i/DecodeStage_0_PCO[26]} {processor_i/DecodeStage_0_PCO[27]} {processor_i/DecodeStage_0_PCO[28]} {processor_i/DecodeStage_0_PCO[29]} {processor_i/DecodeStage_0_PCO[30]} {processor_i/DecodeStage_0_PCO[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 32 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {processor_i/ExecuteStage_0_SrcData1O[0]} {processor_i/ExecuteStage_0_SrcData1O[1]} {processor_i/ExecuteStage_0_SrcData1O[2]} {processor_i/ExecuteStage_0_SrcData1O[3]} {processor_i/ExecuteStage_0_SrcData1O[4]} {processor_i/ExecuteStage_0_SrcData1O[5]} {processor_i/ExecuteStage_0_SrcData1O[6]} {processor_i/ExecuteStage_0_SrcData1O[7]} {processor_i/ExecuteStage_0_SrcData1O[8]} {processor_i/ExecuteStage_0_SrcData1O[9]} {processor_i/ExecuteStage_0_SrcData1O[10]} {processor_i/ExecuteStage_0_SrcData1O[11]} {processor_i/ExecuteStage_0_SrcData1O[12]} {processor_i/ExecuteStage_0_SrcData1O[13]} {processor_i/ExecuteStage_0_SrcData1O[14]} {processor_i/ExecuteStage_0_SrcData1O[15]} {processor_i/ExecuteStage_0_SrcData1O[16]} {processor_i/ExecuteStage_0_SrcData1O[17]} {processor_i/ExecuteStage_0_SrcData1O[18]} {processor_i/ExecuteStage_0_SrcData1O[19]} {processor_i/ExecuteStage_0_SrcData1O[20]} {processor_i/ExecuteStage_0_SrcData1O[21]} {processor_i/ExecuteStage_0_SrcData1O[22]} {processor_i/ExecuteStage_0_SrcData1O[23]} {processor_i/ExecuteStage_0_SrcData1O[24]} {processor_i/ExecuteStage_0_SrcData1O[25]} {processor_i/ExecuteStage_0_SrcData1O[26]} {processor_i/ExecuteStage_0_SrcData1O[27]} {processor_i/ExecuteStage_0_SrcData1O[28]} {processor_i/ExecuteStage_0_SrcData1O[29]} {processor_i/ExecuteStage_0_SrcData1O[30]} {processor_i/ExecuteStage_0_SrcData1O[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 32 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {processor_i/ALU_0/X[0]} {processor_i/ALU_0/X[1]} {processor_i/ALU_0/X[2]} {processor_i/ALU_0/X[3]} {processor_i/ALU_0/X[4]} {processor_i/ALU_0/X[5]} {processor_i/ALU_0/X[6]} {processor_i/ALU_0/X[7]} {processor_i/ALU_0/X[8]} {processor_i/ALU_0/X[9]} {processor_i/ALU_0/X[10]} {processor_i/ALU_0/X[11]} {processor_i/ALU_0/X[12]} {processor_i/ALU_0/X[13]} {processor_i/ALU_0/X[14]} {processor_i/ALU_0/X[15]} {processor_i/ALU_0/X[16]} {processor_i/ALU_0/X[17]} {processor_i/ALU_0/X[18]} {processor_i/ALU_0/X[19]} {processor_i/ALU_0/X[20]} {processor_i/ALU_0/X[21]} {processor_i/ALU_0/X[22]} {processor_i/ALU_0/X[23]} {processor_i/ALU_0/X[24]} {processor_i/ALU_0/X[25]} {processor_i/ALU_0/X[26]} {processor_i/ALU_0/X[27]} {processor_i/ALU_0/X[28]} {processor_i/ALU_0/X[29]} {processor_i/ALU_0/X[30]} {processor_i/ALU_0/X[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list processor_i/BTNL_1]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list processor_i/ExecuteStage_0_MemAccessO]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list processor_i/ExecuteStage_0_MemWrEnO]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list processor_i/GCLK]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets GCLK_IBUF]
