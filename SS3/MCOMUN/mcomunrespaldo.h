#V3.30.10																			
#C this comment will be stored because it starts with #C.  It will be written to output files																			
1992	#_styr																		
2017	#_endyr																		
1	#_nseas																		
12	#_months/season																		
1	#_N_subseasons(even number, minimum is 2)																		
1	#_spawn_seas																		
1	#_Ngenders																		
12	#_Nages:  this accumulator age should be large enough so that little growth occurs after reaching this age																		
1	#_N_areas																		
2	#_Nfleets (including surveys)																		
#_fleet_type: 1=catch fleet; 2=bycatch only fleet; 3=survey; 4=ignore 																			
#_survey_timing: -1=for use of catch-at-age to override the month value associated with a datum 																			
#_fleet_area:  area the fleet/survey operates in 																			
#_units of catch:  1=bio; 2=num (ignored for surveys; their units read later)																			
#_equ_catch_se:  standard error of log(initial equilibrium catch)																			
#_catch_se:  standard error of log(catch); can be overridden in control file with detailed F input																			
#_need_catch_mult: 0 = none, 1 = apply catch multiplier as parameter specified in the control file at the end of the growth parameters 																			
#_rows are fleets; columns are: fleet_type, timing, area, units, need_catch_mult																			
1	-1	1	1	0.1	FISHERY1	#													
3	0.5	1	1	0.2	SURVEY2	#													
#Cond - bycatch fleet																			
#a:  fleet index																			
#b:  1=include dead bycatch in total dead catch for F0.1 and MSY optimizations and forecast ABC; 2=omit from total catch for these purposes (but still include the mortality)																			
#c:  1=Fmult scales with other fleets; 2=bycatch F constant at input value; 3=bycatch F from range of years																			
#d:  F or first year of range																			
#e:  last year of range																			
#f:  not used																			
# a   b   c   d   e   f 																			
# Catches																			
#Year	#Season	#Fleet_1	#Catch	#Catch_SE															
-999	1	1	0	0.05	# -999 allows for initial equilibrium catch by fleet														
1992	1	1	75313	0.05															
1993	1	1	77114	0.05															
1994	1	1	81728	0.05															
1995	1	1	90484	0.05															
1996	1	1	101876	0.05															
1997	1	1	87620	0.05															
1998	1	1	80144	0.05															
1999	1	1	103789	0.05															
2000	1	1	110143	0.05															
2001	1	1	121200	0.05															
2002	1	1	116040	0.05															
2003	1	1	115343	0.05															
2004	1	1	73598	0.05															
2005	1	1	47166	0.05															
2006	1	1	47958	0.05															
2007	1	1	45848	0.05															
2008	1	1	47936	0.05															
2009	1	1	47144	0.05															
2010	1	1	49197	0.05															
2011	1	1	44555	0.05															
2012	1	1	39629	0.05															
2013	1	1	39629	0.05															
2014	1	1	18573	0.05															
2015	1	1	19410	0.05															
2016	1	1	20909	0.05															
2017	1	1	14336	0.05															
-9999	0	0	0	0	# -9999 indicates the end of catch records to be read														
#_Units:	0=numbers;	1=biomass;	2=F																
#_Errtype:	-1=normal;	0=lognormal;	>0=T																
1	1	0	0	#Fishery1															
2	1	0	0	#Survey2															
#_year	month	Fleet/ Survey	obs	err	# comment														
-999	0	0	0	0	        #	SURVEY1													
1993	8	2	198540	0.35	#	SURVEY1													
1995	8	2	505765	0.35	#	SURVEY1													
1997	8	2	712878	0.35	#	SURVEY1													
1999	8	2	899207	0.35	#	SURVEY1													
2000	8	2	891598	0.35	#	SURVEY1													
2001	8	2	917122	0.35	#	SURVEY1													
2004	8	2	272084	0.35	#	SURVEY1													
2005	8	2	223721	0.35	#	SURVEY1													
2006	8	2	266596	0.35	#	SURVEY1													
2007	8	2	278700	0.35	#	SURVEY1													
2008	8	2	313778	0.35	#	SURVEY1													
2009	8	2	322729	0.35	#	SURVEY1													
2010	8	2	284575	0.35	#	SURVEY1													
2011	8	2	290331	0.2	    #	SURVEY1													
2012	8	2	273954	0.2	    #	SURVEY1													
2013	8	2	224977	0.2	    #	SURVEY1													
2014	8	2	204997	0.2	    #	SURVEY1													
2015	8	2	211884	0.2	    #	SURVEY1													
2016	8	2	242920	0.2	    #	SURVEY1													
2017	8	2	301330	0.2	    #	SURVEY1													
1997	1	1	4.619	0.2	#	#Fishery1													
1998	1	1	1.37	0.2	#	#Fishery1													
1999	1	1	1.126	0.2	#	#Fishery1													
2000	1	1	1.342	0.2	#	#Fishery1													
2001	1	1	1.403	0.2	#	#Fishery1													
2002	1	1	1.58	0.2	#	#Fishery1													
2003	1	1	1.625	0.2	#	#Fishery1													
2004	1	1	1.433	0.2	#	#Fishery1													
2005	1	1	1.462	0.2	#	#Fishery1													
2006	1	1	1.379	0.2	#	#Fishery1													
2007	1	1	1.133	0.2	#	#Fishery1													
2008	1	1	1.032	0.2	#	#Fishery1													
2009	1	1	1.067	0.2	#	#Fishery1													
2010	1	1	1.223	0.2	#	#Fishery1													
2011	1	1	1.517	0.2	#	#Fishery1													
2012	1	1	1.517	0.2	#	#Fishery1													
2013	1	1	1.517	0.2	#	#Fishery1													
2014	1	1	1.517	0.2	#	#Fishery1													
2015	1	1	1.517	0.2	#	#Fishery1													
2016	1	1	1.517	0.2	#	#Fishery1													
-9999	1	0	0	0	#	#Fishery1													
0	#_N_fleets_with_discard																		
0	#_N_meanbodywt_obs																		
#Population length bins are needed even if there are no size data																			
#  These define the resolution at which the mean weight-at-length, maturity-at-length and size-selectivity are based.  Calculations use the mid-length of the population bins.																			
2	# length bin method: 1=use databins(read below); 2=generate from binwidth,min,max below; 3=read vector																		
2	# binwidth for population size comp																		
5	# minimum size in the population (lower edge of first bin and size at age 0.00)																		
50	# maximum size in the population (lower edge of last bin)																		
0	# use length composition data (0/1)																		
11	#_N_age'_bins;  these are in terms of age', not true age.  Age' is estimated age taking into account any ageing bias and imprecision																		
# following vector is the lower edge of the integer age' for each age' bin; by starting at age' = 1, any zero-year-old fish that are in the expected values will be accumulated up into the age 1 bin.																			
2	3	4	5	6	7	8	9	10	11	12									
1	#_N_ageerror_definitions;  these define how SS will convert true age into a distribution of expected ages to represent the effect of ageing bias and imprecision																		
#true_age=0	1	2	etc.,																
-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1	-1							
0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001	0.001							
#0.5	1.5	2.5	3.5	4.5	5.5	6.5	7.5	8.5	9.5	10.5	11.5	12.5							
#0.5	0.65	0.67	0.7	0.73	0.76	0.8	0.84	0.88	0.92	0.97	1.03	1.09							
#_mintailcomp: upper and lower distribution for females and males separately are accumulated until exceeding this level.																			
#_addtocomp:  after accumulation of tails; this value added to all bins																			
#_males and females treated as combined gender below this bin number 																			
#_compressbins: accumulate upper tail by this number of bins; acts simultaneous with mintailcomp; set=0 for no forced accumulation																			
#_mintailcomp_addtocomp_combM+F_CompressBins_CompError_ParmSelect																			
#_Comp_Error: 0 = multinomial, 1 = dirichlet																			
#_Comp_Error2: parameter number for the dirichlet error distribution																			
#_minsamplesize: minimum sample size; set to 1 to match 3.24, minimum value is 0.001																			
0	1.00E-07	1	0	0	0	20	#Fishery1												
0	1.00E-07	1	0	0	0	30	#Survey2												
1 #_Lbin_method_for_Age_Data: 1=poplenbins; 2=datalenbins; 3=lengths																			
#40	#_N_Agecomp_obs																		
# the age composition data vectors below are by age' bins, not by true age																			
#Yr	Seas	Flt/Svy	Gender	Part	Ageerr	Lbin_lo	Lbin_hi	Nsamp	2	3	4	5	6	7	8	9	10	11	12
1992	1	1	3	0	1	1	-1	25	1203	6480	15347	17786	17334	13909	12013	8604	4741	3502	3928
1993	1.00E+00	1	3	0	1	1	-1	25	6878	15444	17476	15746	9906	10440	10611	8285	5557	3754	3355
1994	1.00E+00	1	3	0	1	1	-1	25	4892	17255	57460	39560	10435	2562	1769	739	903	344	752
1995	1	1	3	0	1	1	-1	25	3476	16160	53816	45275	14108	5617	2267	762	443	387	691
1996	1	1	3	0	1	1	-1	25	436	6076	21830	35360	28004	17735	8040	3617	1842	1041	2144
1997	1	1	3	0	1	1	-1	25	3943	25165	27533	28917	29500	13001	2924	670	205	762	289
1998	1	1	3	0	1	1	-1	25	881	9166	30224	27994	27425	24663	7346	1435	754	0	0
1999	1	1	3	0	1	1	-1	25	45	2482	17422	32877	31152	30568	20069	7332	1819	486	199
2000	1	1	3	0	1	1	-1	25	0	11645	13870	15674	28375	37471	29385	9542	2159	649	39
2001	1	1	3	0	1	1	-1	25	1326	16275	29328	23147	20894	25480	30152	13925	3962	583	249
2002	1	1	3	0	1	1	-1	25	0	3608	15810	27071	46011	28287	24111	16986	8464	5443	1929
2003	1	1	3	0	1	1	-1	25	1841	2954	12390	17158	40609	54518	25129	19802	10730	4503	5520
2004	1	1	3	0	1	1	-1	25	29717	39776	42552	31763	16895	18984	7033	2759	5366	1656	836
2005	1	1	3	0	1	1	-1	25	8475	38892	63932	12898	12999	6418	1863	1230	527	387	391
2006	1	1	3	0	1	1	-1	25	7690	41640	68340	16656	2756	1804	814	627	543	92	62
2007	1	1	3	0	1	1	-1	25	5665	84692	43972	11005	1978	1486	332	393	43	28	55
2008	1	1	3	0	1	1	-1	25	15111	38658	55104	21367	5123	3939	2146	872	378	226	266
2009	1	1	3	0	1	1	-1	25	5076	43223	51637	29643	7901	4263	1571	647	266	120	70
2010	1	1	3	0	1	1	-1	25	3330	27226	45690	40030	17029	6889	2828	1310	958	411	340
2011	1	1	3	0	1	1	-1	25	7358	26498	40303	35113	17583	8165	3617	1955	833	480	520
2012	1	1	3	0	1	1	-1	25	26391	40675	37653	19984	3244	1132	890	901	535	349	229
2013	1	1	3	0	1	1	-1	25	11304	42607	51659	18836	5650	3460	1791	695	531	488	162
2014	1	1	3	0	1	1	-1	25	4696	16604	19306	8106	3602	1313	480	364	125	62	4
2015	1	1	3	0	1	1	-1	25	4534	14038	22157	9482	3633	1142	527	268	51	22	8
2016	1	1	3	0	1	1	-1	25	9901	17352	19789	10809	4232	1490	593	293	47	25	0
1993	8	2	3	0	1	1	-1	42	65827	35117	24140	19646	19121	21430	19169	12613	10763	9381	9381
1995	8	2	3	0	1	1	-1	42	99993	297935	183286	93610	42558	30874	15744	10331	8533	21161	21161
1997	8	2	3	0	1	1	-1	42	221467	220374	287193	221302	137818	61953	21675	22087	3503	19422	19422
1999	8	2	3	0	1	1	-1	42	86489	161643	133362	101041	122630	107882	144698	65083	52635	111183	111183
2000	8	2	3	0	1	1	-1	42	348154	181545	136337	121340	119060	101795	76051	52142	33373	54613	54613
2001	8	2	3	0	1	1	-1	42	447452	569414	258692	110394	92017	56155	46587	34468	9438	51517	51517
2004	8	2	3	0	1	1	-1	42	201739	66114	48972	18867	12356	12309	7885	3226	1211	4906	4906
2005	8	2	3	0	1	1	-1	42	450135	49872	13031	8851	6928	2855	882	1060	0	1068	1068
2006	8	2	3	0	1	1	-1	42	565341	164422	34984	9489	3833	1817	1363	390	250	1152	1152
2007	8	2	3	0	1	1	-1	42	487153	184878	16555	6664	3004	1622	1291	938	226	925	925
2008	8	2	3	0	1	1	-1	42	582363	140907	31864	8652	7789	5349	969	1874	580	2859	2859
2009	8	2	3	0	1	1	-1	42	363971	560011	215554	32689	6362	6963	2450	3260	4563	4523	2061
2010	8	2	3	0	1	1	-1	42	365071	429301	158462	36042	20194	2524	208	1070	265	665	1394
2011	8	2	3	0	1	1	-1	42	378054	310897	193880	35581	21325	9050	1917	2815	3144	2191	822
2012	8	2	3	0	1	1	-1	42	335185	289028	119549	24014	15525	7260	2801	2898	4141	2478	700
2013	8	2	3	0	1	1	-1	42	234000	223000	302000	75000	25000	11000	3000	4000	5000	1000	2000
2014	8	2	3	0	1	1	-1	42	223000	279000	272000	62000	18000	8000	1000	2000	2000	0	1000
2015	8	2	3	0	1	1	-1	42	183000	356000	147000	22000	10000	2000	2000	1000	1000	0	0
-9999	0	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	#_N_MeanSize-at-Age_obs																		
0	#_N_environ_variables																		
0	# N sizefreq methods to read																		
0	# no tag data																		
0	# no morph composition data																		
0	#  Do dataread for selectivity priors(0/1)																		
999																			
ENDDATA																			
