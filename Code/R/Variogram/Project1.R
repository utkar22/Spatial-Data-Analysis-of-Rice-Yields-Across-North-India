library(plotly)
library(gstat) # loads package gstat
library(sp) # loads package sp

#use Final1.dta in STATA SPACE
library(haven)
Final1 <- read_dta("C:/Users/sumedhas/Desktop/STATA SPACE/Final1.dta")
View(Final1)
#Rename Data:
df <- Final1
class(df)
df.sp <- df # Note: <- operator is an 'equals' operator
colnames(df)
coordinates(df.sp) <- (~longitude+latitude) # objects that start with a '~' operator in R is called a 'formula'. i.e., ~ is R formula operator
class(df.sp)
colnames(df.sp@data)
dim(df.sp) # Note: same result for dim(meuse.sp@data)

bubble(df.sp, "lquintalperacre", 
       col = c("#00ff0070","#00ff0099"),
       main = "Yields")

?bubble

#Experimental Variogram:
sp.data.in <- df.sp
?variogram

#experimental variogram cloud - without removing trend
yield.vgm.cloud = variogram(lquintalperacre~1, sp.data.in, cloud=TRUE) 
#Note that we are studying spatial variation in logarithm of zinc concentrations
plot(plot(yield.vgm.cloud, identify=TRUE), sp.data.in)

#experimental variogram without removing trend
yield.vgm = variogram(lquintalperacre~1, sp.data.in)

plot(yield.vgm,
     cex=1.5, # size of marker
     pch=19, # type of marker (filled circle)
     xlab="Spatial Lag (h)",
     ylab="Gamma(h), Semivariance")

#Remove the trend-1 (modeling trend along the x coordinates, i.e., the Longitude)

yield.vgm.detrend.x = variogram(lquintalperacre~longitude, sp.data.in)

plot(yield.vgm.detrend.x,
     cex=1.5, # siz of marker
     pch=19, # type of marker (filled circle)
     xlab="Spatial Lag (h)",
     ylab="Gamma(h), Semivariance")


#Remove the trend-2 (modeling trend along the y coordinates, i.e., the Latitude)

yield.vgm.detrend.y = variogram(lquintalperacre~latitude, sp.data.in)

plot(yield.vgm.detrend.y,
     cex=1.5, # siz of marker
     pch=19, # type of marker (filled circle)
     xlab="Spatial Lag (h)",
     ylab="Gamma(h), Semivariance")


#Remove the trend-3 (modeling trend along the x and y coordinates, i.e., both Latitude and Longitude)

yield.vgm.detrend.xy = variogram(lquintalperacre~longitude+latitude, sp.data.in)

plot(yield.vgm.detrend.xy,
     cex=1.5, # siz of marker
     pch=19, # type of marker (filled circle)
     xlab="Spatial Lag (h)",
     ylab="Gamma(h), Semivariance")

#Remove the trend-4 (modeling trend along the x and y coordinates, i.e., both Latitude and Longitude)

yield.vgm.detrend.xy = variogram(lquintalperacre~longitude+latitude+, sp.data.in)

plot(yield.vgm.detrend.xy,
     cex=1.5, # siz of marker
     pch=19, # type of marker (filled circle)
     xlab="Spatial Lag (h)",
     ylab="Gamma(h), Semivariance")

#Plot all variograms on a single graph

library(plotly)

# Comparison - 1
plotly::plot_ly(,type="scatter", mode="markers") %>%
  add_trace(data=yield.vgm,
            x=~dist,
            y=~gamma,
            name="variogram") %>%
  add_trace(data=yield.vgm.detrend.xy,
            x=~dist,
            y=~gamma,
            name="variogram_detrended_xy") %>%
  add_trace(data=yield.vgm.detrend.x,
            x=~dist,
            y=~gamma,
            name="variogram_detrended_x") %>%
  add_trace(data=yield.vgm.detrend.y,
            x=~dist,
            y=~gamma,
            name="variogram_detrended_y") %>%
  layout(xaxis=list(title="Spatial Lag (h)"),
         yaxis=list(title="Semivariance, gamma(h)"))





