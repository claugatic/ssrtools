# Pacific sardine stock assessment (2017-18)
# P.R. Crone, K.T. Hill, J.P. Zwolinski (Nov 2016)
# Model ALT: number of fisheries = 3 / surveys = 1 / time-step = semester / biological distributions = age / selectivity = age-based / growth = emp. WAA
# SS model (ver. 3.24s)
# Forecast file
#
# Note: for all year entries except rebuilder, enter either: actual year, -999 for styr, 0 for endyr, neg number for relative endyr
1 #_Benchmarks: 0=skip, 1=calc F_spr,F_btgt,F_msy
2 #_MSY: 1= set to F(SPR), 2=calc F(MSY), 3=set to F(Btgt), 4=set to F(endyr)
0.4 #_SPR target (e.g., 0.40)
0.4 #_Biomass target (e.g., 0.40)
# Bmark_years: beg_bio, end_bio, beg_selex, end_selex, beg_relF, end_relF (enter actual year, or values of 0 or -integer to be rel. endyr)
0 0 0 0 0 0
1 # Bmark_relF_basis: 1 = use year range; 2 = set relF same as forecast below
1 # Forecast: 0=none; 1=F(SPR); 2=F(MSY) 3=F(Btgt); 4=Ave F (uses first-last relF yrs); 5=input annual F scalar
1 # N forecast years
0 # F scalar (only used for Do_Forecast==5)
# Fcast_years: beg_selex, end_selex, beg_relF, end_relF (enter actual year, or values of 0 or -integer to be rel. endyr)
0 0 0 0
1 # Control rule method (1=catch=f(SSB) west coast, 2=F=f(SSB) )
0.5 # Control rule Biomass level for constant F (as frac of Bzero, e.g. 0.40); (Must be > the no F level below)
0.1 # Control rule Biomass level for no F (as frac of Bzero, e.g. 0.10)
0.75 # Control rule target as fraction of Flimit (e.g. 0.75)
3 # N forecast loops
3 # First forecast loop with stochastic recruitment
0 # Forecast loop control #3 (reserved for future bells&whistles) 
0 # Forecast loop control #4 (reserved for future bells&whistles)
0 # Forecast loop control #5 (reserved for future bells&whistles)
2020 # FirstYear for caps and allocations (should be after years with fixed inputs)
0 # Stddev of log(realized catch/target catch) in forecast (set value>0.0 to cause active impl_error)
0 # Do West Coast gfish rebuilder output (0/1)
0 # Rebuilder: first year catch could have been set to zero (Ydecl)(-1 to set to 1999)
0 # Rebuilder: year for current age structure (Yinit) (-1 to set to endyear+1)
1 # Fleet relative F: 1=use first-last alloc year, 2=read seas(row) x fleet(col) below
# Note: fleet allocation is used directly as average F if Do_Forecast=4
2 # Basis for forecast catch tuning and for forecast catch caps and allocation: 2=deadbio, 3=retainbio, 5=deadnum, 6=retainnum
# Conditional input if relative F option=2
# Fleet relative F: rows are seasons, columns are fleets
# Fleet: MEXCAL_S1 MEXCAL_S2 PNW
# 0 0 0 # S1
# 0 0 0 # S2
# Max total catch by fleet (-1 to have no max): must enter value for each fleet
-1 -1 -1
# Max total catch by area (-1 to have no max): must enter value for each fleet
-1
# Fleet assignment to allocation group (enter group ID# for each fleet, 0 for not included in an alloc group)
0 0 0
# Conditional on >1 allocation group
# Allocation fraction for each of: 0 allocation groups
# No allocation groups
6 # Number of forecast catch levels to input (or else calculate catch from forecast F)
2 # Basis for input forecast catch: 2=dead catch, 3=retained catch, 99 = input Hrate(F) with units that are from fishery units
# Input fixed catch values
# Year Season Fleet Catch/F
2017 1 1 10.30
2017 2 1 0.00
2017 1 2 0.00
2017 2 2 185.87
2017 1 3 87.90
2017 2 3 0.70
999 # End of file

