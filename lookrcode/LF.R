library(tidyverse)
library(ggridges)



lf.df <- data.frame(read.csv("LF Mensual Sardina.csv"))
Summarise_lfs(lf.df)

lfa.df <- data.frame(read.csv("LF Mensual Anchovy.csv"))
Summarise_lfs(lfa.df,Title="Anchovy")

# Function below
Summarise_lfs <- function(lf.df=lf.df,Title="Sardine"){
	pdf(paste0(Title,".pdf"))
names(lf.df) <- c("Yr","cm", 1:12,99)
names(lf.df)
str(lf.df)
lf.g  <- gather(lf.df,month,val,-Yr,-cm) %>% mutate(month=as.numeric(month)) %>% filter(!is.na(val), month<13) #%>% group_by(month,cm) %>% summarise(lf=sum(val))
str(lf.g)

lf.g.mo <- gather(lf.df,month,val,-Yr,-cm) %>%  
						mutate(month=as.numeric(month)) %>% 
						filter(!is.na(val), month<13) %>% 
						group_by(month) %>% 
						mutate(sum=sum(val)) %>% 
						ungroup() %>% 
						group_by(month,cm) %>% summarise(lf=sum(val/sum))

p <- ggplot(lf.g.mo,aes(x=cm,y=as.factor(month),height = lf)) + ggtitle(Title) + geom_density_ridges(stat = "identity",scale = 1.8, alpha = .3,color="blue",fill="yellow",size=.5)+ xlim(c(4,18))+ ylab("Month") + xlab("Length (cm)") #+ scale_y_discrete(limits=rev(levels(as.factor(sdf$yr))))
	print(p)

#Calendar year....
lf.g.yr <- gather(lf.df,month,val,-Yr,-cm) %>%  mutate(month=as.numeric(month)) %>% filter(!is.na(val), month<13) %>% group_by(Yr) %>% mutate(sum=sum(val)) %>% ungroup() %>% group_by(Yr,cm) %>% summarise(lf=sum(val/sum))
p <- ggplot(lf.g.yr,aes(x=cm,y=as.factor(Yr),height = lf)) + ggtitle(Title) + xlim(c(3,18)) + geom_density_ridges(stat = "identity",scale = 3., alpha = .3,color="blue",fill="yellow",size=.5)+ ylab("Year") + xlab("Length (cm)") #+ scale_y_discrete(limits=rev(levels(as.factor(lf.g.yr$Yr))))
	print(p)

#Biological year....
lf.g.byr <- gather(lf.df,month,val,-Yr,-cm) %>%  mutate(month=as.numeric(month),B_Yr=ifelse(month<7,Yr,Yr+1)) %>% filter(!is.na(val), month<13) %>% group_by(B_Yr) %>% mutate(sum=sum(val)) %>% ungroup() %>% group_by(B_Yr,cm) %>% summarise(lf=sum(val/sum))
p <- ggplot(lf.g.byr,aes(x=cm,y=as.factor(B_Yr),height = lf)) + xlim(c(3,18)) + ggtitle(Title) + geom_density_ridges(stat = "identity",scale = 3., alpha = .3,color="blue",fill="yellow",size=.5)+ ylab("Biological Year") + xlab("Length (cm)") #+ scale_y_discrete(limits=rev(levels(as.factor(lf.g.yr$Yr))))
	print(p)

lf.g <- gather(lf.df,month,val,-Yr,-cm) %>% mutate(month=as.numeric(month)) %>% filter(Yr>2003,as.numeric(month)<13,!is.na(val)) %>%mutate(month=month,sem=ifelse(month<7,Yr+0.1,Yr+0.2) ) %>% group_by(sem) %>% transmute(cm=cm,val=val,sum=sum(val))  %>% ungroup() %>%group_by(sem,cm)%>%summarise(p=sum(val/sum))
p <- ggplot(lf.g,aes(x=cm,y=as.factor(sem),height = p)) + ggtitle(Title) + geom_density_ridges(stat = "identity",scale = 2., alpha = .3,color="blue",fill="yellow",size=.5)+ ylab("Semester") + xlab("Length (cm)") + xlim(c(3,18))#+ scale_y_discrete(limits=rev(levels(as.factor(lf.g.yr$Yr))))
	print(p)
lf.g <- gather(lf.df,month,val,-Yr,-cm) %>% mutate(month=as.numeric(month)) %>% filter(Yr<2004,as.numeric(month)<13,!is.na(val)) %>%mutate(month=month,sem=ifelse(month<7,Yr+0.1,Yr+0.2) ) %>% group_by(sem) %>% transmute(cm=cm,val=val,sum=sum(val))  %>% ungroup() %>%group_by(sem,cm)%>%summarise(p=sum(val/sum))
p <- ggplot(lf.g,aes(x=cm,y=as.factor(sem),height = p)) + ggtitle(Title) + geom_density_ridges(stat = "identity",scale = 2., alpha = .3,color="blue",fill="yellow",size=.5)+ ylab("Semester") + xlab("Length (cm)") + xlim(c(3,18))#+ scale_y_discrete(limits=rev(levels(as.factor(lf.g.yr$Yr))))
	print(p)
dev.off()
}
