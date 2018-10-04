# SS INPUT FILES FOR MODEL ALT
# STARTER.SS
# Pacific sardine stock assessment (2017-18)
# P.R. Crone, K.T. Hill, J.P. Zwolinski (Nov 2016)
# Model ALT: number of fisheries = 3 / surveys = 1 / time-step = semester / biological distributions = age / selectivity = age-based / growth = emp. WAA
# SS model (ver. 3.24s)
# Starter file
#
ALT.dat
ALT.ctl
0 # 0=use init values in control file; 1=use ss3.par
1 # Run display detail (0,1,2)
2 # Detailed age-structured reports in REPORT.SSO: (0,1,2)
1 # Write detailed checkup.sso file (0,1)
3 # Write parm values to ParmTrace.sso (0=no,1=good,active; 2=good,all; 3=every_iter,all_parms; 4=every,active)
2 # Write to cumreport.sso (0=no, 1=like&timeseries, 2=add survey fits)
0 # Include prior_like for non-estimated parameters (0,1)
1 # Use soft boundaries to aid convergence: (0,1)
1 # Number of datafiles to produce: 1st is input, 2nd is estimates, 3rd and higher are bootstrap
10 # Turn off estimation for parameters entering after this phase
10 # MCeval burn interval
2 # MCeval thin interval
0.05 # Jitter initial parm value by this fraction
-1 # Min yr for sdreport outputs (-1 for styr)
-2 # Max yr for sdreport outputs (-1 for endyr; -2 for endyr+Nforecastyrs
0 # N individual STD years
# Vector of year values
0.00001 # Final convergence criteria (e.g., 1.0e-05)
0 # Retrospective year relative to end year (e.g. -4)
1 # Min age for calc of summary biomass
1 # Depletion basis: denom is: 0=skip; 1=rel X*B0; 2=rel X*Bmsy; 3=rel X*B_styr
1 # Fraction (X) for depletion denominator (e.g. 0.4)
4 # SPR_report_basis: 0=skip; 1=(1-SPR)/(1-SPR_tgt); 2=(1-SPR)/(1-SPR_MSY); 3=(1-SPR)/(1-SPR_Btarget); 4=rawSPR
4 # F_report_units: 0=skip; 1=exploitation(Bio); 2=exploitation(Num); 3=sum(Frates); 4=true F for range of ages
0 8 # Min and max age over which average F will be calculated with F_reporting=4
2 # F_report_basis: 0=raw; 1=F/Fspr; 2=F/Fmsy ; 3=F/Fbtgt
999 # End of file