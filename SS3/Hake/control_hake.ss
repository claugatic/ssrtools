#V3.30.10																	
#C this is an example control file setup																	
#_data_and_control_files: data.dat, control.ctl																	
#V3.30.10.00-safe;_2017_12_08;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_11.6																	
0	# 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters																
1	#_N_Growth_Patterns																
1	#_N_Morphs_Within_GrowthPattern																
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)																	
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)																	
2	# recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity																
1	# not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area																
1	#  number of recruitment settlement assignments 																
0	# year_x_area_x_settlement_event interaction requested (only for recr_dist_method=1)																
#GPat month  area age (for each settlement assignment)																	
 1 1 1 0																	
#_Cond 0 # N_movement_definitions goes here if Nareas > 1	# N_movement_definitions goes here if N_areas > 1																
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0	# first age that moves (real age at begin of season, not integer) also cond on do_migration>0																
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10		# example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10															
#																	
0	#_Nblock_Patterns																
#_Cond 0 #_blocks_per_pattern																	
#Begin and End Years of Blocks																	
#																	
1	#_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)																
# autogenerate starting time-varying parameter values																	
1 1 1 1 1	# autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex																
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345																	
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 																	
0	#_natM_type:_0=1Parm; 1=N_breakpoints; 2=Lorenzen; 3=Age Specific; 4=Age Specific with Season Interpolation																
#No Additional input for selected M option; read 1P per morph																	
1	# GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_speciific_K; 4=not implemented																
2	#_Age(post-settlement)_for_L1;linear growth below this																
999	#_Growth Age for L2 (enter 999 to use parameter as Linf)																
0.055	#_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)																
0	#_placeholder for future growth feature																
0	#_SD add to LAA (set to 0.1 for SS2 v1.x compatibility)																
0	#_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)															
#_placeholder for empirical age-maturity by growth pattern																	
1	#_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity																
2.5	#_First_Mature_Age																
2	#_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W																
0	#_hermaphroditism option; 0=none; 1=age-specific fxn																
1	#_parameter_offset_approach (1=none, 2=M,G,CV_G as offset from female GP1, 2=like SS2 v1.x)																
#_Growth_Parms																	
#_LO	HI	INIT	PRIOR	SD	PR_type	PHASE	env-var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn	Label			
0.1	0.25	0.2	0.2	0.4	3	2	0	0	0	0	0	0	0	#_NatM_p_1_Fem_GP_1			
40	50	44	44	10	0	-2	0	0	0	0	0	0	0	#_L_at_Amin_Fem_GP_1			
50	60	58	58	10	0	-4	0	0	0	0	0	0	0	#_L_at_Amax_Fem_GP_1			
0.1	0.2	0.17	0.17	0.8	0	-4	0	0	0	0	0	0	0	#_VonBert_K_Fem_GP_1			
0.05	0.2	0.063	0.1	0.8	0	-3	0	0	0	0	0	0	0	#_CV_young_Fem_GP_1			
0.05	0.2	0.085	0.1	0.8	0	-3	0	0	0	0	0	0	0	#_CV_old_Fem_GP_1			
0.3	0.6	5.00E-01	5.00E-01	0.8	0	-3	0	0	0	0	0	0	0	#_Wtlen_1_Fem			
1	1.2	1.1	1.1	0.8	0	-3	0	0	0	0	0	0	0	#_Wtlen_2_Fem			
30	40	35	35	0.8	0	-3	0	0	0	0	0	0	0	#_Mat50%_Fem			
-47	-45	-46.9	-46.9	0.8	0	-3	0	0	0	0	0	0	0	#_Mat_slope_Fem			
-3	3	1	1	0.8	0	-3	0	0	0	0	0	0	0	#_Eggs/kg_inter_Fem			
-3	3	0	0	0.8	0	-3	0	0	0	0	0	0	0	#_Eggs/kg_slope_wt_Fem			
0	0	0	0	0	0	-4	0	0	0	0	0	0	0	#-RecrDist_GP_1			
0	0	0	0	0	0	-4	0	0	0	0	0	0	0	#_RecrDist_Area_1			
0	0	0	0	0	0	-4	0	0	0	0	0	0	0	#_RecrDist_Seas_1			
0	0	0	0	0	0	-4	0	0	0	0	0	0	0	#_CohortGrowDev			
0.01	0.99	0.5	0.5	0	0	-4	0	0	0	0	0	0	0	# FracFemale_GP_1			
#																	
#_Condition 0 #custom MG env-setup (0/1)																	
#_Cond	-2	2	0	1	99	0	-2	#_Placeholder when no MG environmental parameters									
#																	
#_Cond 0 #_Custom MG block setup (0/1)																	
#_Cond	-2	2	0	0	99	0	-2	#_Placeholder when no MG block parameters									
#_Cond No MG Parm Trends																	
#																	
#_seasonal_effects_on_biology_parms																	
0	0	0	0	0	0	0	0	0	0	#_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K							
#_Cond	-2	2	0	0	99	0	-2	#_Placeholder when no seasonal MG  parameters									
#																	
#_Cond	-4	#_MGparm_Dev_Phase															
#																	
#_Spawner-Recruitment																	
4 #_Spawner-Recruitment; Options: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm																	
0  # 0/1 to use steepness in initial equ recruitment calculation																	
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature																	
#LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn	#	parm_name		
8	12	10.5	10.5	10	0	1	0	0	0	0	0	0	0	#	SR_LN(R0)		
0	0	0	0	0.05	0	-4	0	0	0	0	0	0	0	#	SR_SCAA_null		
0	2	0.3	0.3	0.8	0	-4	0	0	0	0	0	0	0	#	SR_sigmaR		
-5	5	0	0	1	0	-4	0	0	0	0	0	0	0	#	SR_regime		
0	0	0	0	0	0	-99	0	0	0	0	0	0	0	#	SR_autocorr		
2	#do_recdev: 0 =none; 1= dev vector; 2=simple deviations																
1958	#_first year of the main recr_devs; early devs can preceed this era																
2016	#_last year of the main recr_devs; forecast devs start in following year																
2	#_recdev phase																
0	#_(0/1) to read 13 advanced options																
#0	#_recdev_early_start (0=none; negative value makes relative to the recdev_start)																
#-4	#_recdev_early_phase																
#0	#_forecast_recruitment phase (include late recruitment) (0 value rests to maxphase +1)																
#1	#_lambda for Fcast_recr_like occuring before endyr +1																
#1954	#_last_early_yr_nobias_adj_in_MPD																
#1978	#_first_yr_fullbias_adj_in_MPD																
#2014	#_last_yr_fullbias_adj_in_MPD																
#2016	#_first_recent_yr_nobias_adj_in_MPD																
#0.9337	#_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)																
#0	#_period of cycles in recruitment (N parms read below)																
#-5	#min rec_dev																
#5	#max rec_dev																
#0	#_read_recdevs																
#_end of advanced SR options																	
#																	
#_placeholder for full parameter lines for recuitment cycles																	
#_N lines go here if read_recdevs>0																	
#_Yr	Input_value_for_recruitment deviation																
#																	
#Fishing Mortality Information																	
0.3	#_F ballpark for tuning early phases																
2012	#_F ballpark year (negative value to disable)																
#																	
3	#_F method: 1= Pope; 2= Instantanous F; 3= Hybrid Method (Hybrid method is recommended)																
4	#_max F or harvest rate depending on the F method																
#_No addition F input need for Fmethod = 1																	
#_if F method =2 read overal start F value; overall phase; N detailed inputs to read																	
3 # N iteration for tuning for F method																	
#_COND Fmethod=3 0.1	#_starting value for each F																
#_COND Fmethod=3 1	#_phase for F estimation																
#_COND Fmethod=3 0	#_N detailed F inputs																
#_initial_F_parms																	
#_LO	HI	INIT	PRIOR	SD	PR_TYPE	PHASE											
#0	1	0.02	0.01	99	0	-1	#InitF_Fishery1					
#
#_Q_setup																	
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)																	
#_2:  extra input for link, i.e. mirror fleet																	
#_3:  0/1 to select extra sd parameter																	
#_4:  0/1 for biasadj or not																	
#_5:  0/1 to float																	
#Fleet	link	link info	extra se	bias adj	float						
1	1	0	0	0	0	#FLOTA											
2	1	0	0	0	0	#SURVEY											
-9999	1	1	1	1	1												
#
#_Cond	0	#_If q has random component then 0=read one parm for each fleet with random q; 1=read a parm for each year of index															
#_Q_parms(if_any)																	
#_LO	HI	INIT	PRIOR	PR_SD	PR_TYPED	PHASE	env-var	use_dev	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn				
-15	15	-1.203972804	0	1	0	3	0	0	0	0	0	0	0	#LnQ_base_FLOTA			
-15	15	-0.356674944	0	1	0	3	0	0	0	0	0	0	0	#LnQ_base_SURVEY			
#	
#_size_selex_types																	
#_Pattern	Discard	Male	Special														
0	0	0	0	#FLOTA													
0	0	0	0	#SURVEY													
#																	
#_age_selex_types																	
#_Pattern	N/A	Male	Special														
12	0	0	0	#FLOTA													
12	0	0	0	#SURVEY													
#_LO	HI	INIT	PRIOR	SD	PR_TYPE	PHASE	env-var	use_dev	dev_minyr	dev_maxyr	dev_stddev	Block	Block_Fxn				
# FISHERY_age_selectivity_Pattern #12 - simple logistic																	
0.01	5	0.2	0.2	99	0	2	0	0	0	0	0.5	0	0	#infl_for_logistic	yr		
0.01	5	1.8	1.8	99	0	2	0	0	0	0	0.5	0	0	#95%width_for_logistic	yr		
# SURVEY_age_selectivity_Pattern #12 - simple logistic																	
0.01	5	0.2	0.2	99	0	2	0	0	0	0	0.5	0	0	#infl_for_logistic	yr		
0.01	5	1.5	1.5	99	0	2	0	0	0	0	0.5	0	0	#95%width_for_logistic	yr		
#_Cond	0	#_custom_sel-env_setup (0/1)															
#_Cond	-2	2	0	0	-1	99	-2	#_placeholder when no enviro fxns									
#_Cond	0	#_custom_sel-blk_setup	(0/1)														
#_Cond	-2	2	0	0	-1	99	-2	#_placeholder when no block usage									
#_Cond	No selex parm trens																
#_Cond	-4	#_Placeholder for selparm_Dev_Phase															
#_Cond	0	#_env/block/dev_adjust_method (1=standard, 2=logistic trans to keep in base parm bounds, 3=standard with no bound check)															
#																	
0	#  use 2D_AR1 selectivity(0/1):  experimental feature																
#_Tag loss and Tag reporting parameters go next																	
0	#_TG_custom; 0=no read, 1=read if tags exist																
#_Cond	-6	6	1	1	2	0.01	-4	0	0	0	0	0	0	0	#_placeholder if no parameters		
#																	
# Input variance adjustments factors: 																	
 #_1=add_to_survey_CV																	
 #_2=add_to_discard_stddev																	
 #_3=add_to_bodywt_CV																	
 #_4=mult_by_lencomp_N																	
 #_5=mult_by_agecomp_N																	
 #_6=mult_by_size-at-age_N																	
 #_7=mult_by_generalized_sizecomp																	
#	Factor	fleet/survey	Value														
#_Cond	0	0	0														
#_Cond	0	0	0														
#_Cond	0	0	0														
#_Cond	1	1	1														
#_Cond	1	1	1														
#_Cond	1	1	1														
# Cond	-9999	1	1														
-9999	1	1															
1	#_maxlambdaphase																
0	#_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter																
#																	
#_Like_comp codes: 1=survey, 2=discard, 3=mnwt, 4=length, 5=age, 6=Size Frequency, 7= Size-at-Age, 8=Catch,																	
# 9=init equilibrium catch, 10=recruitment devs, 11=parm priors, 12=parm devs, 13=Crash Penelty, 14= Morphcomp, 15=Tag Comp, 16=Tag NegBin																	
#	Like_Comp	fleet/survey	phase	value	sizefreq_method												
#	1	1	1	1	1												
#	1	2	1	1	1												
#	1	3	1	1	1												
#	1	4	1	1	1												
	-9999	1	1	1	1												
0	# (0/1) read specs for more stddev reporting																
#_Placeholder for vector of selex bins to be reported																	
#_Placeholder vector of growth ages to be reported																	
#_Placeholder for vecto of NatAges ages to be reported																	
999																	
