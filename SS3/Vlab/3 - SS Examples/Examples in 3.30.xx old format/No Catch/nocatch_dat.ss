#V3.30.10.02-safe;_2018_02_02;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_Start_time: Fri Feb  2 16:29:38 2018
#V3.30.10.02-safe;_2018_02_02;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6
1971 #_StartYr
2001 #_EndYr
1 #_Nseas
 12 #_months/season
2 #_Nsubseasons (even number, minimum is 2)
1 #_spawn_month
2 #_Ngenders
40 #_Nages=accumulator age
1 #_Nareas
2 #_Nfleets (including surveys)
#_fleet_type: 1=catch fleet; 2=bycatch only fleet; 3=survey; 4=ignore 
#_survey_timing: -1=for use of catch-at-age to override the month value associated with a datum 
#_fleet_area:  area the fleet/survey operates in 
#_units of catch:  1=bio; 2=num (ignored for surveys; their units read later)
#_catch_mult: 0=no; 1=yes
#_rows are fleets
#_fleet_type timing area units need_catch_mult fleetname
 1 -1 1 1 0 FISHERY  # 1
 3 0.5 1 2 0 SURVEY1  # 2
#Bycatch_fleet_input_goes_next
#a:  fleet index
#b:  1=include dead bycatch in total dead catch for F0.1 and MSY optimizations and forecast ABC; 2=omit from total catch for these purposes (but still include the mortality)
#c:  1=Fmult scales with other fleets; 2=bycatch F constant at input value; 3=bycatch F from range of years
#d:  F or first year of range
#e:  last year of range
#f:  not used
# a   b   c   d   e   f 
#_Catch data: yr, seas, fleet, catch, catch_se
#_catch_se:  standard error of log(catch)
#_NOTE:  catch data is ignored for survey fleets
-999 1 1 0 0.01
1971 1 1 0 0.01
1972 1 1 0 0.01
1973 1 1 0 0.01
1974 1 1 0 0.01
1975 1 1 0 0.01
1976 1 1 0 0.01
1977 1 1 0 0.01
1978 1 1 0 0.01
1979 1 1 0 0.01
1980 1 1 0 0.01
1981 1 1 0 0.01
1982 1 1 0 0.01
1983 1 1 0 0.01
1984 1 1 0 0.01
1985 1 1 0 0.01
1986 1 1 0 0.01
1987 1 1 0 0.01
1988 1 1 0 0.01
1989 1 1 0 0.01
1990 1 1 0 0.01
1991 1 1 0 0.01
1992 1 1 0 0.01
1993 1 1 0 0.01
1994 1 1 0 0.01
1995 1 1 0 0.01
1996 1 1 0 0.01
1997 1 1 0 0.01
1998 1 1 0 0.01
1999 1 1 0 0.01
2000 1 1 0 0.01
2001 1 1 0 0.01
-9999 0 0 0 0
#
 #_CPUE_and_surveyabundance_observations
#_Units:  0=numbers; 1=biomass; 2=F; >=30 for special types
#_Errtype:  -1=normal; 0=lognormal; >0=T
#_SD_Report: 0=no sdreport; 1=enable sdreport
#_Fleet Units Errtype SD_Report
1 1 0 0 # FISHERY
2 1 0 0 # SURVEY1
#_yr month fleet obs stderr
1977 7 2 339689 0.3 #_ SURVEY1
1980 7 2 193353 0.3 #_ SURVEY1
1983 7 2 151984 0.3 #_ SURVEY1
1986 7 2 55221.8 0.3 #_ SURVEY1
1989 7 2 59232.3 0.3 #_ SURVEY1
1992 7 2 31137.5 0.3 #_ SURVEY1
1995 7 2 35845.4 0.3 #_ SURVEY1
1998 7 2 27492.6 0.3 #_ SURVEY1
2001 7 2 37338.3 0.3 #_ SURVEY1
-9999 1 1 1 1 # terminator for survey observations 
#
0 #_N_fleets_with_discard
#_discard_units (1=same_as_catchunits(bio/num); 2=fraction; 3=numbers)
#_discard_errtype:  >0 for DF of T-dist(read CV below); 0 for normal with CV; -1 for normal with se; -2 for lognormal; -3 for trunc normal with CV
# note, only have units and errtype for fleets with discard 
#_Fleet units errtype
# -9999 0 0 0.0 0.0 # terminator for discard data 
#
0 #_use meanbodysize_data (0/1)
#_COND_0 #_DF_for_meanbodysize_T-distribution_like
# note:  use positive partition value for mean body wt, negative partition for mean body length 
#_yr month fleet part obs stderr
#  -9999 0 0 0 0 0 # terminator for mean body size data 
#
# set up population length bin structure (note - irrelevant if not using size data and using empirical wtatage
2 # length bin method: 1=use databins; 2=generate from binwidth,min,max below; 3=read vector
2 # binwidth for population size comp 
10 # minimum size in the population (lower edge of first bin and size at age 0.00) 
94 # maximum size in the population (lower edge of last bin) 
1 # use length composition data (0/1)
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet
#_Comp_Error2:  parm number  for dirichlet
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
0 1e-07 0 0 0 0 1 #_fleet:1_FISHERY
0 1e-07 0 0 0 0 1 #_fleet:2_SURVEY1
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
25 #_N_LengthBins; then enter lower edge of each length bin
 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 68 72 76 80 90
#_yr month fleet sex part Nsamp datavector(female-male)
 1977 7 2 3 0 125 0 0 0 0 3 0 0 2 2 3 1 2 5 0 5 6 5 3 3 8 4 10 0 0 0 0 0 0 0 0 0 6 3 3 2 2 5 2 3 3 8 1 1 6 5 8 3 2 0 0
 1980 7 2 3 0 125 0 0 0 0 1 1 1 3 2 2 1 3 6 1 2 5 1 3 3 8 3 3 4 1 0 0 0 0 0 1 1 2 3 4 4 4 4 4 1 1 1 5 3 5 14 7 5 2 0 0
 1983 7 2 3 0 125 0 0 0 0 2 3 3 5 2 4 5 2 3 2 5 5 6 5 3 3 1 8 0 0 0 0 0 0 0 2 2 1 2 2 4 2 6 2 3 5 2 4 4 1 6 10 0 0 0 0
 1986 7 2 3 0 125 0 0 0 0 2 1 1 4 6 2 3 1 1 1 5 5 5 3 3 7 7 3 2 0 0 0 0 0 1 2 1 3 2 1 5 0 2 5 6 7 3 5 2 3 7 4 4 0 0 0
 1989 7 2 3 0 125 0 0 0 0 0 5 8 3 3 5 1 2 4 1 2 2 4 3 2 3 3 2 0 0 0 0 0 0 2 2 3 5 2 5 8 8 7 3 2 4 3 6 3 1 8 0 0 0 0 0
 1992 7 2 3 0 125 0 0 0 0 0 5 6 6 5 3 2 5 6 6 5 5 1 3 1 3 4 0 0 0 0 0 0 0 0 0 2 4 3 6 5 3 6 6 2 5 4 3 1 3 1 2 3 0 0 0
 1995 7 2 3 0 125 0 0 0 0 2 0 0 4 7 5 5 5 6 2 5 6 5 6 0 3 4 1 0 0 0 0 0 0 0 2 3 0 1 2 1 5 3 4 9 5 3 3 4 2 5 4 3 0 0 0
 1998 7 2 3 0 125 0 0 0 3 1 1 2 3 4 6 4 6 5 3 1 2 1 1 1 5 2 2 0 0 0 0 0 0 0 10 5 4 2 3 7 2 1 4 4 5 3 2 3 1 8 6 2 0 0 0
 2001 7 2 3 0 125 0 0 0 0 0 2 3 5 7 5 9 2 9 5 4 4 1 1 2 2 8 0 0 0 0 0 0 0 0 2 1 4 6 5 6 4 3 4 4 5 1 3 2 1 3 2 0 0 0 0
-9999 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
#
17 #_N_age_bins
 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 20 25
2 #_N_ageerror_definitions
 0.5 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5 20.5 21.5 22.5 23.5 24.5 25.5 26.5 27.5 28.5 29.5 30.5 31.5 32.5 33.5 34.5 35.5 36.5 37.5 38.5 39.5 40.5
 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001 0.001
 0.5 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5 20.5 21.5 22.5 23.5 24.5 25.5 26.5 27.5 28.5 29.5 30.5 31.5 32.5 33.5 34.5 35.5 36.5 37.5 38.5 39.5 40.5
 0.5 0.65 0.67 0.7 0.73 0.76 0.8 0.84 0.88 0.92 0.97 1.03 1.09 1.16 1.23 1.32 1.41 1.51 1.62 1.75 1.89 2.05 2.23 2.45 2.71 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.
#_addtocomp:  after accumulation of tails; this value added to all bins
#_males and females treated as combined gender below this bin number 
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation
#_Comp_Error:  0=multinomial, 1=dirichlet
#_Comp_Error2:  parm number  for dirichlet
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001
#_mintailcomp addtocomp combM+F CompressBins CompError ParmSelect minsamplesize
0 1e-07 1 0 0 0 1 #_fleet:1_FISHERY
0 1e-07 1 0 0 0 1 #_fleet:2_SURVEY1
1 #_Lbin_method_for_Age_Data: 1=poplenbins; 2=datalenbins; 3=lengths
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
#_yr month fleet sex part ageerr Lbin_lo Lbin_hi Nsamp datavector(female-male)
 1977 7 2 3 0 2 1 -1 75 2 1 2 1 0 4 3 3 2 1 1 0 1 1 4 7 0 0 2 2 7 1 0 1 0 1 2 4 1 2 2 7 10 0
 1980 7 2 3 0 2 1 -1 75 3 3 4 6 5 2 0 2 3 0 3 2 2 2 2 1 4 0 2 3 5 3 1 2 1 1 2 1 1 1 0 3 1 4
 1983 7 2 3 0 2 1 -1 75 3 4 3 2 3 0 0 7 0 0 3 1 1 0 5 6 0 0 2 2 4 1 2 3 4 3 2 0 1 1 2 7 1 2
 1986 7 2 3 0 2 1 -1 75 3 0 2 5 3 5 5 3 1 3 2 1 1 1 3 0 2 0 0 2 3 6 6 1 3 3 1 1 1 1 2 2 3 0
 1989 7 2 3 0 2 1 -1 75 7 3 7 3 2 1 0 3 2 1 2 1 1 5 0 0 0 0 4 8 6 1 2 3 5 1 1 2 0 4 0 0 0 0
 1992 7 2 3 0 2 1 -1 75 2 5 3 4 0 5 0 5 2 0 0 0 1 0 3 0 0 0 4 5 5 10 8 6 2 1 2 0 0 1 0 1 0 0
 1995 7 2 3 0 2 1 -1 75 0 5 2 3 2 3 5 4 2 1 1 2 0 0 3 0 0 0 2 3 5 11 2 6 5 1 2 1 2 0 0 2 0 0
 1998 7 2 3 0 2 1 -1 75 9 4 4 3 1 1 1 1 3 3 1 2 1 7 0 0 0 0 6 5 3 5 1 3 3 2 3 2 0 1 0 0 0 0
 2001 7 2 3 0 2 1 -1 75 4 0 4 11 5 3 4 2 2 0 0 0 0 0 2 0 0 0 2 4 7 11 5 2 0 2 2 2 0 0 0 1 0 0
-9999  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
1 #_Use_MeanSize-at-Age_obs (0/1)
# sex codes:  0=combined; 1=use female only; 2=use male only; 3=use both as joint sexxlength distribution
# partition codes:  (0=combined; 1=discard; 2=retained
# ageerr codes:  positive means mean length-at-age; negative means mean bodywt_at_age
#_yr month fleet sex part ageerr ignore datavector(female-male)
#                                          samplesize(female-male)
 1971 7 2 3 0 1 2 34.1574 38.8017 43.122 47.2042 49.0502 51.6446 56.3201 56.3038 60.5509 60.2537 59.8042 62.9309 66.842 67.8089 71.1612 70.7693 74.5593 35.3811 40.7375 44.5192 47.6261 52.5298 53.5552 54.9851 58.9231 58.9932 61.8625 64.0366 62.7507 63.9754 64.5102 66.9779 67.7361 69.1298 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20
 1995 7 2 3 0 1 2 34.6022 38.3176 42.9052 48.2752 50.6189 53.476 56.7806 59.4127 60.5964 60.5537 65.3608 64.7263 67.4315 67.1405 68.9908 71.9886 74.1594 35.169 40.2404 43.8878 47.3519 49.9906 52.2207 54.9035 58.6058 60.0957 62.4046 62.2298 62.1437 66.2116 65.7657 69.9544 70.6518 71.4371 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20
-9999  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
0 #_N_environ_variables
#Yr Variable Value
#
0 # N sizefreq methods to read 
#
0 # do tags (0/1)
#
0 #    morphcomp data(0/1) 
#  Nobs, Nmorphs, mincomp
#  yr, seas, type, partition, Nsamp, datavector_by_Nmorphs
#
0  #  Do dataread for selectivity priors(0/1)
# Yr, Seas, Fleet,  Age/Size,  Bin,  selex_prior,  prior_sd
# feature not yet implemented
#
999
