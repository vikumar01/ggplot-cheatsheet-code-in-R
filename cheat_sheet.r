library(ggplot2)
data()

#1.
sunspotyear <- data.frame(
Year = as.numeric(time(sunspot.year)),
Sunspots = as.numeric(sunspot.year)
)
ggplot(sunspotyear, aes(x=Year, y=Sunspots)) + geom_area()


#2
ggplot(Orange, aes(x=age)) + geom_density()
#OR
ggplot(Orange, aes(x=age)) +
geom_density(fill="blue", colour=NA, alpha=.2) +
geom_line(stat="density")

#3
ggplot(Orange,aes(x=age))+ geom_dotplot()

#4
ggplot(faithful, aes(x=waiting)) + geom_freqpoly()
#5
ggplot(mtcars, aes(x=mpg)) + geom_histogram(bandwidth=15)
#OR
ggplot(faithful, aes(x=waiting)) + geom_histogram(binwidth=5)

#6
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity", color="Red")


#TWO varialble

#1
ggplot(mpg, aes(x=displ, y=hwy)) + geom_blank()

#2
ggplot(ChickWeight, aes(x=Time, y=weight))+ geom_jitter()

#3
ggplot(ChickWeight, aes(x=Time, y=weight))+ geom_point()

#4
a <- USArrests %>% ggplot() 
a + geom_quantile(aes(Assault,Murder), alpha=1, linetype="solid", col="sky blue", size = 2, quantiles =0.5) +
  geom_point(aes(Assault,Murder)) +
  ggtitle("Quantile")  

#5
ggplot(faithful, aes(x=eruptions, y=waiting)) + geom_point() + geom_rug(position="jitter", size=.2)

#6
ggplot(faithful, aes(x=eruptions, y=waiting)) + geom_point()+geom_smooth()

#7
a + geom_quantile(aes(Assault,Murder), alpha=1, linetype="solid", col="sky blue", size = 2, quantiles =0.5) +
  geom_point(aes(Assault,Murder)) +
  ggtitle("Quantile") 
#8
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity", color="Red")

#9
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()

library(gcookbook)

#11
View(countries)
countries2009 <- subset(countries, Year==2009 & healthexp>2000)
View(countries2009)
ggplot(countries2009, aes(x=infmortality))+ geom_dotplot()

#12
ggplot(heightweight, aes(x=sex, y=heightIn))+ geom_violin()

#13
a + geom_text(aes(Assault, Rape, label=rownames(USArrests)),check_overlap = TRUE,family="TT Times New Roman",lineheight=1,angle=45,alpha=1,col="blue",size=3,hjust=0,nudge_x=0.5) +
  scale_x_log10() +
  scale_y_log10() +
  ggtitle("Text")  

#14
a + geom_bar(aes(Murder),fill= "sky blue",col="sky blue",alpha=1, linetype="solid",size = 2,position = "identity") +
  scale_x_continuous()+
  scale_y_continuous()+
  ggtitle("Bar Plot")

#15
c <- USArrests %>% ggplot(aes(Rape,UrbanPop))
c + geom_boxplot(aes(group=cut_width(Rape,0.25)),varwidth = TRUE,outlier.shape=NA,outlier.color = "red",position = "identity",alpha=0.1,col="sky blue", size = 5,linetype = "dotted") +
  geom_jitter(width = 0.2) +
  ggtitle("Box Plot")

#16
a + geom_dotplot(aes(Assault, col=factor(skew)),fill="pink",col="blue",alpha=1,binwidth=10,stackdir = "center") +
  ggtitle("Dot Plot")


#17
ggplot(sunspotyear, aes(x=Year, y=Sunspots)) + geom_area()

#18
ggplot(subset(climate, Source=="Berkeley"), aes(x=Year, y=Anomaly10y)) +
  +     geom_line()

#19
ggplot(subset(climate, Source=="Berkeley"), aes(x=Year, y=Anomaly10y)) +
  +     geom_step()

#20
d <- ggplot(economics, aes(date,unemploy))
d + geom_path(lineend = "butt", linejoin = "round", linemitre = 1, alpha=1, col = "green", linetype="solid") +
  ggtitle("Path")

#21
d + geom_ribbon(aes(ymin=unemploy-900,ymax=unemploy+900), alpha=0.54,fill="red", col="blue", linetype="dashed") +
  ggtitle("Ribbon")


#22
e <- ggplot(seals, aes(x = long, y = lat))
e + geom_segment(aes( xend = long + delta_long,  yend = lat + delta_lat),col="dark green") +
  ggtitle("Segment")

#23
e + geom_rect(aes(xmin = long, ymin = lat, xmax= long + delta_long, ymax = lat + delta_lat), col="black") +
  ggtitle("Rect")


#three variables

#1
m + geom_contour(aes(z = seals$z), col = "green", alpha=0.6, size=2, linetype = "dashed")

#2
m + geom_raster(aes(fill = seals$z), hjust=0.5, alpha=0.8,vjust=0.5, interpolate=TRUE)

#3
m + geom_tile(aes(fill = lat), height = 0.8, size=1.5,linetype= "dotted",color="grey",width=0.8)


#/////////////////////////////////////////////sheet2//////////////////////
  
#Color and fill scales

#1.
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity", fill="Red")

#2

t + coord_cartesian(xlim = c(0, 100), ylim = c(10, 20))
+ xlim(0, 100) + ylim(10, 20)
t + scale_x_continuous(limits = c(0, 100)) +
scale_y_continuous(limits = c(0, 100))

#3
t <- ggplot(mpg, aes(cty, hwy)) + geom_point()
t + facet_grid(. ~ fl)
t + facet_grid(year ~ .)
t + facet_wrap(~ fl)
t + facet_grid(year ~ ., scales = "free")

#4  
t + theme(legend.position = "left")
t + guides(color = "colorbar")
t + scale_fill_discrete(name = "Title", labels = c("A", "B", "C"))

#coordinate system
b <- ggplot(mpg, aes(fl))
r <- b + geom_bar(col = "red", fill="sky blue")
r + coord_cartesian(ylim = c(0,75))
r + coord_fixed(ratio = 1/8) + coord_flip()
r + coord_polar(theta = "x", direction=1 )
r + coord_trans(y = "sqrt")

  
#Shape scales

#1
ggplot(faithful, aes(x=eruptions, y=waiting)) + geom_point(aes(size=waiting), shape=21, colour="black")

#2
ggplot(faithful, aes(x=eruptions, y=waiting)) + geom_point(aes(size=waiting), shape=11, colour="black")

#3
ggplot(heightweight, aes(x=ageYear, y=heightIn, shape=sex, colour=sex)) + geom_point()

#4
ggplot(heightweight, aes(x=ageYear, y=heightIn, shape=sex, colour=sex)) +
+     geom_point()+scale_shape_manual(values=c(5, 4))

#Size scales

#1
ggplot(heightweight, aes(x=ageYear, y=heightIn)) +
  +     geom_point(aes(size = ageYear))

#2
ggplot(heightweight, aes(x=ageYear, y=heightIn)) +
  +     geom_point(aes(size = ageYear))+scale_size_area(max_size=5)


#Labels

#1
ggplot(heightweight, aes(x=ageYear, y=heightIn)) +
  +     geom_point(aes(size = ageYear))+scale_size_area(max_size=5)+ggtitle("New Plot Title ")

#2
ggplot(ChickWeight, aes(x=Time, y=weight))+ geom_jitter()+xlab("New X label")

#3
ggplot(ChickWeight, aes(x=Time, y=weight))+ geom_jitter()+ylab("New y label")

#4
ggplot(ChickWeight, aes(x=Time, y=weight))+ geom_jitter() + labs(title =" New title", x = "New x", y = "New y")

#Legends

#1
ggplot(heightweight, aes(x=ageYear, y=heightIn, shape=sex, colour=sex)) +geom_point()+ theme(legend.position = "top")

#2
ggplot(heightweight, aes(x=ageYear, y=heightIn, shape=sex, colour=sex)) +geom_point()+ guides(color = "none")

#3
t + theme(legend.position = "left")
t + guides(color = "colorbar")
t + scale_fill_discrete(name = "Title", labels = c("A", "B", "C"))

#THEME

#1
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")+theme_bw()

#2
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")+theme_grey()

#3
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")+theme_classic()

#4
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity")+theme_minimal()



