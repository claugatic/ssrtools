#-----------------------------
# Para mas informacion de r4ss
# https://github.com/r4ss/r4ss
# ?r4ss
#-----------------------------

library(r4ss)
rm(list=ls()) 
WD<- getwd() 
setwd(WD)     

#pwd <- "C:/Dropbox/sardina_ss/Sardina"
#pwd= "c:/CEGM/ACTIVIDADES 2018/MSE/SS3/Sardina"

repfile <- SS_output(dir=WD)
SS_plots(repfile)

#--------------
# Para comparar
#--------------

otracarpeta <- file.path(pwd,"Selectivity17")
dirvec <- c(pwd, otracarpeta)

# Para leer mas que un archivo de Report
repfiles <- SSgetoutput(dirvec=dirvec)

# Summarise para comparar
repsummary <- SSsummarize(repfiles)

# Hacer figuras de comparaciones
SSplotComparisons(repsummary)

# Tablas de likelihood
SStableComparisons(repsummary)

#-----------
# Para ajustar la rampla de bias en deviaciones de reclutamiento
# Resultan valores para poner en el archivo de control
# Seccion de "Spawner-Recruit"
#-----------

SS_fitbiasramp(repfile)


