The simple_disc example introduces several new features.

In the data file
1.  adds discard data for 2 years
2.  adds meanbodyweight data for retained catch (partition=2) and discarded catch (partition=1) in 1995
3.  adds body length composition, age composiiton, and mean size-at-age data are now included for retained and discarded fish in 1995.
4.  add a 4th fleet called the depletion fleet
5.  add a survey observation for the 4th fleet.  This observation is the expert judgement that the stock is depleted to 40% of its unfished level in 2001.

In the control file
1.  in the size-selectivity section, add that fleet 1 needs a retention function and a discard mortality function
2.  in the size-selectivity section, for the depletion fleet#4, enter its selectivity type as the special type 34.
(note that in SS3.30, this special designation will occur in the data file, not in the selectivity section.)
3.  add the necessary four retention parameters and four discard mortality parameters
4.  in the adjustments to the lambdas, instruct SS to reduce fleet #4's survey lambda to 0.0001 beginning in phase 3.

Note on the depletion fleet:  This option gives SS a capability similar to DB-SRA.  
When this type of "fleet" is created then SS creates a special initial phase in which the only active parameter is ln(R0).
Also in this special initial phase, all data have 0.0 lambda except for the depletion fleet.
So, SS starts by adjusting ln(R0) to match the expert judgement on stock depletion,
then it proceeds to turn on other lambdas and parameters.
In this case, the setup reduces the depletion fleet lambda to 0.0001 in phase 3, but that is not mandatory.

When converted to SS3.30 format, the logL and the begin and end spawnbiomass are identical to the values calculated with SS3.24
