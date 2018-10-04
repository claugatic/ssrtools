The simple_disc example introduces several new features.

In the data file
1.  adds discard data for 2 years
2.  adds meanbodyweight data for retained catch (partition=2) and discarded catch (partition=1) in 1995
3.  adds body length composition, age composition, and mean size-at-age data are now included for retained and discarded fish in 1995.
4.  add a 4th fleet called the depletion fleet and set its type to 34
5.  add a survey observation for the 4th fleet.  This observation is the expert judgement for the spawning stock size in 2000 relative to the virgin spawning stock size.
6.  add an observation for the fishery F in year 2000.  So observation type = 2.  This also is expert judgement and is given a large se.

In the control file
1.  in the size-selectivity section, add that fleet 1 needs a retention function and a discard mortality function
2.  add the necessary four retention parameters and four discard mortality parameters
3.  in the adjustments to the lambdas, instruct SS to reduce fleet #4's survey lambda to 0.0001 beginning in phase 3.
4.  set the ln(Q) for the depletion fleet to be 0.0 and do not estimate it
5.  the column "link_info" for the depletion fleet provides additional controls (see below).  
6.  set the ln(Q) for the fishery F observation to be 0.0 and do not estimate it

Note on the depletion fleet:  This option gives SS a capability similar to DB-SRA.  
With a value of 0 for the link_info, SS will:
(a) add 1 to phases of all parms except ln(R0);
(b) only estimate ln(R0) in phase 1;
(c)  in phase 1 set lambda=0.0 for all data except the depletion fleet "survey"
So, SS starts by adjusting ln(R0) to match the expert judgement on stock depletion,
then it proceeds to turn on other lambdas and parameters in subsequent phases.
In this case, the setup reduces the depletion fleet lambda to 0.0001 in phase 3, but that is not mandatory.
