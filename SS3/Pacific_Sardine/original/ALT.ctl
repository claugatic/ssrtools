# ALT.CTL
# Pacific sardine stock assessment (2017-18)
# P.R. Crone, K.T. Hill, J.P. Zwolinski (Nov 2016)
# Model ALT: number of fisheries = 3 / surveys = 1 / time-step = semester / biological distributions = age /selectivity = age-based / growth = emp. WAA
# SS model (ver. 3.24s)
# Control file
#
1 #_N_growth patterns
1 # N_Morphs within growth pattern
# Cond 1 # Morph between/within SD ratio (no read if N_morphs=1)
# Cond 1 # Vector morphdist (-1 for first value gives normal approximation)
1 # N_recruitment assignments (overrides GP*area*season parameter values)
0 # Recruitment interaction requested
# GP season area for each recruitment assignment
1 1 1
# Cond 0 # N_movement_definitions goes here if N_areas >1
# Cond 1 # First age that moves (real age at begin of season, not integer) also conditioned on Do_migration >0
# Cond 1 1 1 2 4 10 # Example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
3 # N_block patterns
3 7 5 # N_blocks per pattern
# Begin and end years of blocks (pattern 1)
2005 2005 2006 2011 2010 2014 # MEXCAL_S1
# Begin and end years of blocks (pattern 2)
2005 2005 2006 2009 2010 2010 2011 2011 2012 2012 2013 2013 2014 2017 # ATM
# Begin and end years of blocks (pattern 3)
2005 2012 2013 2013 2014 2014 2015 2015 2016 2017 # ATM
0.5 # Fraction female
0 # Natural mortality type: 0=1 Parm, 1=N_breakpoints, 2=Lorenzen, 3=agespecific, 4=age-specific with season interpolation
# No additional input for M_type=0 (read 1 parametr per morph)
1 # Growth model: 1=vonBert with L1&L2, 2=Richards with L1&L2, 3=age_speciific_K, 4=not implemented
0.5 # Growth_age for_L1
999 #_Growth_age for_L2 (999=use Linf)
0 # SD add to LAA (set to 0.1 for SS2 V1.x compatibility)
0 # CV_growth pattern: (0) CV=f(LAA), (1) CV=F(A), (2) SD=F(LAA), (3) SD=F(A), (4) log(SD)=F(A)
5 # Maturity_option: 1=length logistic, 2=age logistic, 3=read age-maturity matrix by growth pattern, 4=read  age-fecundity, 5=read fecundity/wt from wtatage.ss
# Placeholder for empirical age-maturity by growth pattern
0 # First mature age
1 # Fecundity option:(1) eggs=Wt*(a+b*Wt),(2) eggs=a*L^b,(3) eggs=a*Wt^b, (4) eggs=a+b*L, (5)eggs=a+b*W
0 # Hermaphroditism option: 0=none, 1=age-specific
1 # Parameter offset approach: 1=none, 2=Mortality, growth, CV_growth as offset from female-GP1, 3=like SS2 V1.x
1 # Env/block/dev adjust method: 1=standard, 2=logistic transform keeps in base parm bounds, 3=standard w/ no bound check
# Growth parameters
# LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev block block_Fxn
0.3 0.8 0.6 0 -1 99 -3 0 0 0 0 0 0 0 # NatM_p_1_Fem_GP_1
3 15 10 0 -1 99 -3 0 0 0 0 0 0 0 # LAA_min_Fem_GP_1
20 30 25 0 -1 99 -3 0 0 0 0 0 0 0 # LAA_max_Fem_GP_1
0.05 0.99 0.4 0 -1 99 -3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
0.05 0.5 0.14 0 -1 99 -3 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
0.01 0.1 0.05 0 -1 99 -3 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
-3 3 7.5242e-006 0 -1 99 -3 0 0 0 0 0 0 0 # WtLt_1_Fem
-3 5 3.233205 0 -1 99 -3 0 0 0 0 0 0 0 # WtLt_2_Fem
9 19 15.44 0 -1 99 -3 0 0 0 0 0 0 0 # Mat50%_Fem
-20 3 -0.89252 0 -1 99 -3 0 0 0 0 0 0 0 # Mat_slope_Fem
0 10 1 0 -1 99 -3 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem
-1 5 0 0 -1 99 -3 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem
-4 4 0 0 -1 99 -3 0 0 0 0 0 0 0 # RecrDist_GP_1
-4 4 1 0 -1 99 -3 0 0 0 0 0 0 0 # RecrDist_Area_1
-4 4 1 0 -1 99 -3 0 0 0 0 0 0 0 # RecrDist_Seas_1
-4 4 0 0 -1 99 -3 0 0 0 0 0 0 0 # RecrDist_Seas_2
1 1 1 0 -1 99 -3 0 0 0 0 0 0 0 # Cohort Growth_Dev
#
# Cond 0 # Custom MG-env_setup (0/1)
# Cond -2 2 0 0 -1 99 -2 # Placeholder when no MG-env parameters
# Custom MG-block_setup (0/1)
# Cond No MG parm trends
# Seasonal effects on biology parameter
0 0 0 0 0 0 0 0 0 0 # femwtlt1, femwtlt2, mat1, mat2, fec1, fec2, malewtlt1, malewtlt2, L1, K
# Cond -2 2 0 0 -1 99 -2 # Placeholder when no seasonal MG parameters
# Cond -4 # MGparm_dev Phase
#
# Spawner-recruit (SR) parameters
3 # SR function: 1=Null, 2=Ricker (2 parm), 3=std_B-H (2 parm), 4=S-CAA, 5=Hockey stick, 6=flat-top_B-H, 7=Survival_3Parm
# LO HI INIT PRIOR PR_type SD PHASE
3 25 15 0 -1 99 1 # SR_R0
0.2 1 0.5 0 -1 99 5 # SR_steepness
0 2 0.75 0 -1 99 -3 # SR_sigmaR
-5 5 0 0 -1 99 -3 # SR_env link
-15 15 0 0 -1 99 2 # SR_R1_offset
0 0 0 0 -1 99 -3 # SR_autocorr
0 # SR_env link
0 # SR_env target: 0=none, 1=devs, 2=R0, 3=steepness
1 # Do recdev: 0=none, 1=devvector, 2=simple deviations
2005 # First year of main rec_devs (early devs can preceed this era) (was 1993 in 2016 assessment)
2015 # Last year of main rec_devs (forecast devs start in following year) (was 2014 in 2016 assessment)
1 # Rec_dev phase
#
1 # Read 13 advanced options (0/1)
-6 # Rec_dev early start: 0=none (neg value makes relative to rec_dev)
2 # Rec_dev early phase
0 # Forecast rec phase (includes late rec): 0 value sets to maxphase+1
1 # Lambda for Forecast rec likelihood occurring before endyr+1
#
1994.7 # Last early_yr nobias adjustment in MPD (was 1984 in 2016 assessment)
2005.2 # First yr fullbias adjustment in_MPD (was 1993 in 2016 assessment)
2012.8 # Last yr fullbias adjustment in MPD (was 2011 in 2016 assessment)
2015.2 # First recent_yr nobias adjustment in MPD (was 2015 in 2016 assessment)
0.8956 # Max bias adjustment in_MPD (-1 to override ramp and set bias adjustment=1.0 for all estimated rec_devs)
0 # Period of cycles in recruitment (N_parms read below)
-5 # Min rec_dev
5 # Max rec_dev
0 # Read rec_devs
# End of advanced SR options
#
# Placeholder for full parameter lines for recruitment cycles
# Read specified rec_devs
# Yr Input_value
#
# Fishing mortality (F) parameters 
0.1 # F ballpark for tuning early phases
-2006 # F ballpark year (neg value to disable)
3 # F method: 1=Pope, 2=instant F, 3=hybrid
4 # Max F or harvest rate (depends on F method)
# No additional F input needed for F method 1
# If F method=2 then read overall start F value, overall phase, N_detailed inputs to read
# If F method=3 then read N_iterations for tuning for F method=3
10 # N_iterations for tuning F (F method=3 only, e.g., 3-7)
#
# Initial F parameters
# LO HI INIT PRIOR PR_type SD PHASE
0 3 1 0 -1 99 1 # Init F_MEXCAL_S1
0 3 0 0 -1 99 -1 # Init F_MEXCAL_S2
0 3 0 0 -1 99 -1 # Init F_PNW
#
# Catchability (Q) parameters
# Den_dep: 0=off and survey is proportional to abundance, 1=add parameter for non-linearity
# Env_var: 0=off, 1 = add parameter for env effect on Q
# Extra_SE: 0=off, 1 = add parameter for additive constant to input SE in ln space
# Q_type: <0=mirror, 0=median_float, 1=mean_float, 2=estimate parameter for ln(Q), 3=parameter with random_dev, 4=parameter with random walk, 5=mean unbiased float assigned to parameter
# <0=mirror
# 0=Q floats as a scaling factor (no variance bias adjustment is taken into account)
# 1=Q floats as scaling factor (variance bias adjustment is used) ** recommended option **
# 2=Q is a parameter (variance bias adjustment is NOT used, so produces same result as option=0)
# 3=parameter with random_dev
# 4=parameter with random walk
# 5=mean unbiased float assigned to parameter
# Note: a new option will be created to include bias adjustment in the parameter approach
# Den-dep Env-var Extra_SE Q_type
0 0 0 0 # MEXCAL_S1
0 0 0 0 # MEXCAL_S2
0 0 0 0 # PNW
0 0 0 2 # DEPM
0 0 0 2 # AT
#
# Cond # If Q has random component then 0=read one parameter for each fleet with random Q, 1=read a parameter for each year of index
# Q parameters (if any)
# LO HI INIT PRIOR PR_type SD PHASE
-3 3 1 0 -1 99 4 # Q_DEPM
-3 3 1 0 -1 99 4 # Q_AT
#
# Size selectivity types
# Pattern Discard Male Special
0 0 0 0 # MEXCAL_S1
0 0 0 0 # MEXCAL_S2
0 0 0 0 # PNW
30 0 0 0 # DEPM
0 0 0 0 # ATM
#
# Age selectivity types
# Pattern Discard Male Special
17 0 0 10 # MEXCAL_S1
17 0 0 10 # MEXCAL_S2
12 0 0 0 # PNW
0 0 0 0 # DEPM
10 0 0 0 # AT
#
# Age selectivity
# LO HI INIT PRIOR PR_type SD PHASE env-var use_dev dev_minyr dev_maxyr dev_stddev Block Block_Fxn
# MEXCAL_S1 (age-specific, random walk)
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-0
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-1
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-2
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-3
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-4
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-5
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-6
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-7
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-8
-1000 9 -1000 -1 -1 99 -3 0 0 0 0 0 0 0 # Age-9
-1000 9 -1000 -1 -1 99 -3 0 0 0 0 0 0 0 # Age-10
#
# MEXCAL_S2 (age-specific, random walk)
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-0 
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-1
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-2
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-3
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-4
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-5
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-6
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-7
-5 9 0.1 -1 -1 99 3 0 0 0 0 0 0 0 # Age-8
-1000 9 -1000 -1 -1 99 -3 0 0 0 0 0 0 0 # Age-9
-1000 9 -1000 -1 -1 99 -3 0 0 0 0 0 0 0 # Age-10
#
# PacNW (asymptotic)
0 10 5 0 -1 99 4 0 0 0 0 0 0 0 # AgeSel_P1_PacNW
-5 15 1 0 -1 99 4 0 0 0 0 0 0 0 # AgeSel_P2_PacNW
#
# DEPM (SSB) - No parameter lines
#
# ATM (Asymptotic option 10, no parameter lines)
#
# Cond: Custom sel-env setup (0/1)
# Cond: Env_fxns setup
# 1 # Cond: Custom sel-blk setup (0/1)
#
# 1 # Cond: Selectivity parameter trends
# 4 # Cond: Selectivity parm_dev phase
# 2 # Cond: Env/Block/Dev_adjustment method: 1=standard, 2=logistic trans to keep in base parameter bounds, 3=standard with no bound check
#
# Tag loss and Tag reporting parameters
0 # Tag custom: 0=no read, 1=read if tags exist
# Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0 # Placeholder if no parameters
#
1 # Variance adjustments
# Fleet/Survey: 1 2 3 4 5
0.000000 0.000000 0.000000 0.000000 0.000000 # add_to_survey_CV
0.000000 0.000000 0.000000 0.000000 0.000000 # add_to_discard_stddev
0.000000 0.000000 0.000000 0.000000 0.000000 # add_to_bodywt_CV
1.000000 1.000000 1.000000 1.000000 1.000000 # mult_by_lencomp_N
1.000000 1.000000 1.000000 1.000000 1.000000 # mult_by_agecomp_N
1.000000 1.000000 1.000000 1.000000 1.000000 # mult_by_size-at-age_N
#
1 # Max lambda phase
1 # SD_offset
#
17 # Number of changes to make to default Lambdas (default value=1)
# Like_comp codes: 1=survey, 2=discard, 3=mean_wt, 4=length, 5=age, 6=size-freq, 7=size_age, 8=catch,
# 9=initial equilibrium catch, 10=rec_dev, 11=parameter_prior, 12=parameter_dev,
# 13=crash penalty, 14=morph composition; 15=tag composition, 16=tag neg_bin
# Like_comp fleet/survey phase value size-freq_method
1 4 1 0 1 # DEPM
1 5 1 1 1 # ATM
4 1 1 0 1 # MEXCAL_S1 (length)
4 2 1 0 1 # MEXCAL_S2 (length)
4 3 1 0 1 # PNW (length)
4 5 1 0 1 # ATM (length)
5 1 1 1 1 # MEXCAL_S1 (age)
5 2 1 1 1 # MEXCAL_S2 (age)
5 3 1 1 1 # PNW (age)
5 5 1 1 1 # ATM (age)
7 1 1 0 1 # MEXCAL_S1 (Mean LAA)
7 2 1 0 1 # MEXCAL_S2 (Mean LAA)
7 3 1 0 1 # PNW (Mean LAA)
7 5 1 0 1 # ATM (Mean LAA)
9 1 1 0 1 # Initial equilibrium catch (MEXCAL_S1)
9 2 1 0 1 # Initial equilibrium catch (MEXCAL_S2)
9 3 1 0 1 # Initial equilibrium catch (PNW)
#
0 # Read specs for more SD reporting (0/1)
# 0 1 -1 5 1 5 1 -1 5 # Placeholder for selectivity type, lt/age, year, N_selectivity bins, growth pattern, N_growth ages, natage_area (-1 for all), natage_yr, N_natages
# Placeholder for vector of selectivity bins to be reported
# Placeholder for vector of growth ages to be reported
# Placeholder for vector of natage ages to be reported
999 # End of file 
