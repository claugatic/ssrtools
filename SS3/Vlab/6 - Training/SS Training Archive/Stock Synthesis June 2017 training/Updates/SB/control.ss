#V3.30.04.02-trans
#C -- Striped bass example using SS-V3.24S-safe and ADMB_10.1 
#_data_and_control_files: sb.dat // sb.ctl
#_SS-V3.30.04.02-trans;_2017_05_31;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_SS-V3.30.04.02-trans;user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_SS-V3.30.04.02-trans;user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
4 #_Nblock_Patterns
 3 3 4 1 #_blocks_per_pattern 
# begin and end years of blocks
 1985 1989 1990 1995 1996 2015
 1985 1989 1990 1996 1997 2015
 1985 1989 1990 1996 1997 2002 2003 2015
 1981 1981
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
1 1 1 1 1 # autogen
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if min=-12345
# 1st element for biology, 2nd for SR, 3rd for Q, 5th for selex, 4th reserved
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
 #_Age_natmort_by sex x growthpattern
 1.13 0.68 0.45 0.33 0.25 0.19 0.15 0.15 0.15 0.15 0.15 0.15 0.15
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
0.5 #_Growth_Age_for_L1
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
3 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Age_Maturity by growth pattern
 0 0 0 0.0208 0.0741 0.2925 0.6497 0.7614 0.88 0.92 0.95 0.97 1
0 #_First_Mature_Age
3 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
 15 40 20 20 0.01 0 -4 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 80 100 82.5 82.5 0.01 0 -4 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.15 0.04 0.01 0 -4 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.01 0.25 0.07 0.1 0.15 0 -4 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.01 0.25 0.12 0.1 0.04 0 -4 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
 4e-006 2e-005 9.32e-006 9.32e-009 0.01 0 -3 0 0 0 0 0 0 0 # Wtlen_1_Fem
 2.8 3.2 3.03 3.03 0.01 0 -3 0 0 0 0 0 0 0 # Wtlen_2_Fem
 1.57 4.7 2.35 2.35 0.1 0 -3 0 0 0 0 0 0 0 # Mat50%_Fem
 -14.5 -4.85 -7.275 -7.275 0.1 0 -3 0 0 0 0 0 0 0 # Mat_slope_Fem
 -3 3 1 1 10 0 -99 0 0 0 0 0 0 0 # Eggs_scalar_Fem
 -3 3 1 1 10 0 -99 0 0 0 0 0 0 0 # Eggs_exp_wt_Fem
 -4 4 0 0 0.1 0 -2 0 0 0 0 0 0 0 # RecrDist_GP_1
 -4 4 0 1 0.1 0 -2 0 0 0 0 0 0 0 # RecrDist_Area_1
 -4 4 0 -4 0.1 0 -2 0 0 0 0 0 0 0 # RecrDist_timing_1
 1 1 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
 0.000001 0.999999 0.999999 0.5  0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
          0.27            25            12            10           0.1             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1          0.79             1           0.1             0          1          0          0          0          0          0          0          0 # SR_BH_steep
          0.15           2.4           0.6           0.6           0.1             0          2          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0           0.1             0         -3          0          0          0          0          0          0          0 # SR_regime
         -0.01          0.01             0             0           0.1             0         -3          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1989 # first year of main recr_devs; early devs can preceed this era
2015 # last year of main recr_devs; forecast devs start in following year
2 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1970 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 2 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1970 #_last_early_yr_nobias_adj_in_MPD
 1987.6 #_first_yr_fullbias_adj_in_MPD
 2012.7 #_last_yr_fullbias_adj_in_MPD
 2027 #_first_recent_yr_nobias_adj_in_MPD
 0.9916 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -20 #min rec_dev
 20 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1970E 1971E 1972E 1973E 1974E 1975E 1976E 1977E 1978E 1979E 1980E 1981E 1982E 1983E 1984E 1985E 1986E 1987E 1988E 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
0.2 # F ballpark
-2003 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
6 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 3
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
 0.001 4 0.1 0.1 0.01 0 2 # InitF_seas_1_flt_1Bay
 0.001 4 0.1 0.1 0.01 0 2 # InitF_seas_1_flt_2Ocean
 0.001 4 0.05 0.1 0.01 0 2 # InitF_seas_1_flt_3Comm_Discard
#2016 2016
# F rates by fleet
# Yr:  1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Bay 0.21014 3.19068 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 1.52712e-032
# Ocean 0.364144 4.75163 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 1.52712e-032
# Comm_Discard 0.0461946 0.460841 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 1.52712e-032
#
#_Q_setup
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         4         1         0         0         0         1  #  NY_YOY
         5         1         0         0         0         1  #  NJ_YOY
         6         1         0         0         0         1  #  MD_YOY
         7         1         0         0         0         1  #  VA_YOY
         8         1         0         0         0         1  #  MD_Age_1
         9         1         0         0         0         1  #  NY_Age_1
        10         1         0         0         0         1  #  MRIP
        11         1         0         0         0         1  #  NEFSC
        12         1         0         0         0         1  #  CT_Trawl
        13         1         0         0         0         1  #  NY_OHS
        14         1         0         0         0         1  #  NJ_Trawl
        15         1         0         0         0         1  #  MD_SSN
        16         1         0         0         0         1  #  DE_SSN
        17         1         0         0         0         1  #  VA_Poundnet
        18         1         0         0         0         0  #  VA_Poundnet
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_NY_YOY(4)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_NJ_YOY(5)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_MD_YOY(6)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_VA_YOY(7)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_MD_Age_1(8)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_NY_Age_1(9)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_MRIP(10)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_NEFSC(11)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_CT_Trawl(12)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_NY_OHS(13)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_NJ_Trawl(14)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_MD_SSN(15)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_DE_SSN(16)
           -50             10           -16            -1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_VA_Poundnet(17)
           -50             10           1            1          0.01             0         -6          0          0          0          0          0          0          0  #  LnQ_base_VA_Poundnet(17)
#_no timevary Q parameters
#
#_size_selex_types
#discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead
#_Pattern Discard Male Special
 0 0 0 0 # 1 Bay
 0 0 0 0 # 2 Ocean
 0 0 0 0 # 3 Comm_Discard
 0 0 0 0 # 4 NY_YOY
 0 0 0 0 # 5 NJ_YOY
 0 0 0 0 # 6 MD_YOY
 0 0 0 0 # 7 VA_YOY
 0 0 0 0 # 8 MD_Age_1
 0 0 0 0 # 9 NY_Age_1
 0 0 0 0 # 10 MRIP
 0 0 0 0 # 11 NEFSC
 0 0 0 0 # 12 CT_Trawl
 0 0 0 0 # 13 NY_OHS
 0 0 0 0 # 14 NJ_Trawl
 0 0 0 0 # 15 MD_SSN
 0 0 0 0 # 16 DE_SSN
 0 0 0 0 # 17 VA_Poundnet
 0 0 0 0 # 17 VA_Poundnet
#
#_age_selex_types
#_Pattern Discard Male Special
 17 0 0 9 # 1 Bay
 26 0 0 0 # 2 Ocean
 26 0 0 0 # 3 Comm_Discard
 11 0 0 0 # 4 NY_YOY
 11 0 0 0 # 5 NJ_YOY
 11 0 0 0 # 6 MD_YOY
 11 0 0 0 # 7 VA_YOY
 11 0 0 0 # 8 MD_Age_1
 11 0 0 0 # 9 NY_Age_1
 11 0 0 0 # 10 MRIP
 11 0 0 0 # 11 NEFSC
 11 0 0 0 # 12 CT_Trawl
 26 0 0 0 # 13 NY_OHS
 26 0 0 0 # 14 NJ_Trawl
 26 0 0 0 # 15 MD_SSN
 26 0 0 0 # 16 DE_SSN
 26 0 0 0 # 17 VA_Poundnet
 10 0 0 0 # 17 VA_Poundnet
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
         -1000            10             0         -1000             3             0         -2          0          0          0          0          0          0          0  #  AgeSel_P1_FISHERY1(1)
           -10            10       3.12476             3             3             0          2          0          0       1948       2011          4          1          2  #  AgeSel_P2_FISHERY1(1)
           -10            10        1.0328             0             3             6          2          0          0       1948       2011          4          1          2  #  AgeSel_P3_FISHERY1(1)
           -10            10     0.0879183             0             3             6          2          0          0       1948       2011          4          1          2  #  AgeSel_P4_FISHERY1(1)
           -10            10      0.855117             0             3             6          2          0          0       1948       2011          4          0          0  #  AgeSel_P5_FISHERY1(1)
           -10            10         0.328             0             3             6          2          0          0       1948       2011          4          0          0  #  AgeSel_P6_FISHERY1(1)
           -10            10     0.0962402             0             3             6          2          0          0       1948       2011          4          0          0  #  AgeSel_P7_FISHERY1(1)
           -10            10     0.0909622             0             3             6          2          0          0       1948       2011          4          0          0  #  AgeSel_P8_FISHERY1(1)
           -10            10    -0.0444583             0             3             6          2          0          0       1948       2011          4          0          0  #  AgeSel_P9_FISHERY1(1)
           -10            10             0             0             3             0         -5          0          0          0          0       0.25          0          0  #  AgeSel_P11_FISHERY1(1)
          0.02             1           0.1           0.1             3             0          2          0          0          0          0          0          2          2  #  AgeSel_P1_Ocean(2)
          0.01          0.99           0.5           0.5             3             0          2          0          0          0          0          0          2          2  #  AgeSel_P2_Ocean(2)
         0.001           0.5          0.01          0.01             3             0          2          0          0          0          0          0          2          2  #  AgeSel_P3_Ocean(2)
          0.02             1           0.1           0.1             3             0          2          0          0          0          0          0          3          2  #  AgeSel_P1_Comm_Discard(3)
          0.01          0.99           0.5           0.5             3             0          2          0          0          0          0          0          3          2  #  AgeSel_P2_Comm_Discard(3)
         0.001           0.5          0.01          0.01             3             0          2          0          0          0          0          0          3          2  #  AgeSel_P3_Comm_Discard(3)
           0.1           0.2             0             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_NY_YOY(4)
           0.1           0.2             0             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_NY_YOY(4)
           0.1           0.2             0             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_NJ_YOY(5)
           0.1           0.2             0             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_NJ_YOY(5)
           0.1           0.2             0             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_MD_YOY(6)
           0.1           0.2             0             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_MD_YOY(6)
           0.1           0.2             0             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_VA_YOY(7)
           0.1           0.2             0             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_VA_YOY(7)
           1.1           1.2             1             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_MD_Age_1(8)
           1.1           1.2             1             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_MD_Age_1(8)
           1.1           1.2             1             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_NY_Age_1(9)
           1.1           1.2             1             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_NY_Age_1(9)
           2.1           2.2             2             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_MRIP(10)
          12.1          12.2            12             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_MRIP(10)
           1.1           1.2             1             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_NEFSC(11)
           8.1           8.2             8             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_NEFSC(11)
           3.1           3.2             3             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P1_CT_Trawl(12)
           5.1           5.2             5             0            99             0         -1          0          0          0          0          0          0          0  #  AgeSel_P2_CT_Trawl(12)
          0.02             1           0.1           0.1             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P1_NY_OHS(13)
          0.01          0.99           0.5           0.5             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P2_NY_OHS(13)
         0.001           0.5          0.01          0.01             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P3_NY_OHS(13)
          0.02             1           0.1           0.1             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P1_NJ_Trawl(14)
          0.01          0.99           0.5           0.5             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P2_NJ_Trawl(14)
         0.001           0.5          0.01          0.01             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P3_NJ_Trawl(14)
          0.02             1           0.1           0.1             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P1_MD_SSN(15)
          0.01          0.99           0.5           0.5             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P2_MD_SSN(15)
         0.001           0.5          0.01          0.01             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P3_MD_SSN(15)
          0.02             1           0.1           0.1             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P1_DE_SSN(16)
          0.01          0.99           0.5           0.5             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P2_DE_SSN(16)
         0.001           0.5          0.01          0.01             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P3_DE_SSN(16)
          0.02             1           0.1           0.1             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P1_VA_Poundnet(17)
          0.01          0.99           0.5           0.5             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P2_VA_Poundnet(17)
         0.001           0.5          0.01          0.01             3             0          2          0          0          0          0          0          0          0  #  AgeSel_P3_VA_Poundnet(17)
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
           -10            10        1.0328           1.0             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1985
           -10            10        1.0328           1.0             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1985
           -10            10        1.0328           1.0             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1985
           -10            10        1.0328           1.0             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1985
           -10            10        1.0328           1.0             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1985
           -10            10        1.0328           1.0             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1985
           -10            10        1.0328           1.0             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1985
           -10            10        1.0328           1.0             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1985
           -10            10        1.0328           1.0             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1985


          0.02             1           0.1           0.1             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1985
          0.02             1           0.1           0.1             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1990
          0.02             1           0.1           0.1             3             0      2  # AgeSel_P1_Ocean(2)_BLK2repl_1997
          0.01          0.99           0.5           0.5             3             0      2  # AgeSel_P2_Ocean(2)_BLK2repl_1985
          0.01          0.99           0.5           0.5             3             0      2  # AgeSel_P2_Ocean(2)_BLK2repl_1990
          0.01          0.99           0.5           0.5             3             0      2  # AgeSel_P2_Ocean(2)_BLK2repl_1997
         0.001           0.5          0.01          0.01             3             0      2  # AgeSel_P3_Ocean(2)_BLK2repl_1985
         0.001           0.5          0.01          0.01             3             0      2  # AgeSel_P3_Ocean(2)_BLK2repl_1990
         0.001           0.5          0.01          0.01             3             0      2  # AgeSel_P3_Ocean(2)_BLK2repl_1997
          0.02             1           0.1           0.1             3             0      2  # AgeSel_P1_Comm_Discard(3)_BLK3repl_1985
          0.02             1           0.1           0.1             3             0      2  # AgeSel_P1_Comm_Discard(3)_BLK3repl_1990
          0.02             1           0.1           0.1             3             0      2  # AgeSel_P1_Comm_Discard(3)_BLK3repl_1997
          0.02             1           0.1           0.1             3             0      2  # AgeSel_P1_Comm_Discard(3)_BLK3repl_2003
          0.01          0.99           0.5           0.5             3             0      2  # AgeSel_P2_Comm_Discard(3)_BLK3repl_1985
          0.01          0.99           0.5           0.5             3             0      2  # AgeSel_P2_Comm_Discard(3)_BLK3repl_1990
          0.01          0.99           0.5           0.5             3             0      2  # AgeSel_P2_Comm_Discard(3)_BLK3repl_1997
          0.01          0.99           0.5           0.5             3             0      2  # AgeSel_P2_Comm_Discard(3)_BLK3repl_2003
         0.001           0.5          0.01          0.01             3             0      2  # AgeSel_P3_Comm_Discard(3)_BLK3repl_1985
         0.001           0.5          0.01          0.01             3             0      2  # AgeSel_P3_Comm_Discard(3)_BLK3repl_1990
         0.001           0.5          0.01          0.01             3             0      2  # AgeSel_P3_Comm_Discard(3)_BLK3repl_1997
         0.001           0.5          0.01          0.01             3             0      2  # AgeSel_P3_Comm_Discard(3)_BLK3repl_2003
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5     1     1     1     2     2     0     0     0     0     0     0
#      5     2     4     1     2     2     0     0     0     0     0     0
#      5     3     7     1     2     2     0     0     0     0     0     0
#      5     4    10     2     2     2     0     0     0     0     0     0
#      5     5    13     2     2     2     0     0     0     0     0     0
#      5     6    16     2     2     2     0     0     0     0     0     0
#      5     7    19     3     2     2     0     0     0     0     0     0
#      5     8    23     3     2     2     0     0     0     0     0     0
#      5     9    27     3     2     2     0     0     0     0     0     0
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
 -9999   1    0  # terminator
#
7 #_maxlambdaphase
1 #_sd_offset
# read 3 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
 9 1 1 0 1
 9 2 1 0 1
 9 3 1 0 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 0 0 0 #_CPUE/survey:_3
#  1 1 1 1 1 1 1 #_CPUE/survey:_4
#  1 1 1 1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 1 1 1 #_CPUE/survey:_7
#  1 1 1 1 1 1 1 #_CPUE/survey:_8
#  1 1 1 1 1 1 1 #_CPUE/survey:_9
#  1 1 1 1 1 1 1 #_CPUE/survey:_10
#  1 1 1 1 1 1 1 #_CPUE/survey:_11
#  1 1 1 1 1 1 1 #_CPUE/survey:_12
#  1 1 1 1 1 1 1 #_CPUE/survey:_13
#  1 1 1 1 1 1 1 #_CPUE/survey:_14
#  1 1 1 1 1 1 1 #_CPUE/survey:_15
#  1 1 1 1 1 1 1 #_CPUE/survey:_16
#  1 1 1 1 1 1 1 #_CPUE/survey:_17
#  1 1 1 1 1 1 1 #_agecomp:_1
#  1 1 1 1 1 1 1 #_agecomp:_2
#  1 1 1 1 1 1 1 #_agecomp:_3
#  0 0 0 0 0 0 0 #_agecomp:_4
#  0 0 0 0 0 0 0 #_agecomp:_5
#  0 0 0 0 0 0 0 #_agecomp:_6
#  0 0 0 0 0 0 0 #_agecomp:_7
#  0 0 0 0 0 0 0 #_agecomp:_8
#  0 0 0 0 0 0 0 #_agecomp:_9
#  0 0 0 0 0 0 0 #_agecomp:_10
#  0 0 0 0 0 0 0 #_agecomp:_11
#  0 0 0 0 0 0 0 #_agecomp:_12
#  1 1 1 1 1 1 1 #_agecomp:_13
#  1 1 1 1 1 1 1 #_agecomp:_14
#  1 1 1 1 1 1 1 #_agecomp:_15
#  1 1 1 1 1 1 1 #_agecomp:_16
#  1 1 1 1 1 1 1 #_agecomp:_17
#  0 0 0 0 0 0 0 #_init_equ_catch
#  1 1 1 1 1 1 1 #_recruitments
#  1 1 1 1 1 1 1 #_parameter-priors
#  1 1 1 1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 1 1 1 #_crashPenLambda
#  0 0 0 0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 1 -1 5 1 5 1 -1 5 # placeholder for selex type, len/age, year, N selex bins, Growth pattern, N growth ages, NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

