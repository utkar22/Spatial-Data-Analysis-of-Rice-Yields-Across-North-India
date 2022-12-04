library(plotly)
library(gstat)
library(sp) 
library(haven)

#use Final1.dta in STATA SPACE
df <- read_dta("C:\\Users\\Utkarsh\\Documents\\homework\\SSSE\\Project\\Data\\Final2.dta")


df.sp <- df

coordinates(df.sp) <- (~longitude+latitude) operator


#Experimental Variogram:
sp.data.in <- df.sp

#experimental variogram cloud - without removing trend
#yield.vgm.cloud = variogram(lquintalperacre~1, sp.data.in, cloud=TRUE)

#Note that we are studying spatial variation in logarithm of zinc concentrations
#plot(plot(yield.vgm.cloud, identify=TRUE), sp.data.in)

#experimental variogram without removing trend
yield.vgm = variogram(lquintalperacre~1, sp.data.in)

plot(yield.vgm,
     cex=1.5, # size of marker
     pch=19, # type of marker (filled circle)
     xlab="Spatial Lag (h)",
     ylab="Gamma(h), Semivariance",
     type="b",
     main = "Variogram for non-detrended yield data (Entire Indo-Gangetic Plain)"
     )

#Remove the trend-1 (modeling trend along the x coordinates, i.e., the Longitude)

yield.vgm.detrend.x = variogram(lquintalperacre~longitude, sp.data.in)

plot(yield.vgm.detrend.x,
     cex=1.5, # siz of marker
     pch=19, # type of marker (filled circle)
     xlab="Spatial Lag (h)",
     ylab="Gamma(h), Semivariance",
     type="b",
     main = "Variogram for yield data detrended on longitude (Entire Indo-Gangetic Plain)"
     )


#Remove the trend-2 (modeling trend along the y coordinates, i.e., the Latitude)

yield.vgm.detrend.y = variogram(lquintalperacre~latitude, sp.data.in)

plot(yield.vgm.detrend.y,
     cex=1.5, # siz of marker
     pch=19, # type of marker (filled circle)
     xlab="Spatial Lag (h)",
     ylab="Gamma(h), Semivariance",
     type="b",
     main = "Variogram for yield data detrended on latitude (Entire Indo-Gangetic Plain)"
     )


#Remove the trend-3 (modeling trend along the x and y coordinates, i.e., both Latitude and Longitude)

yield.vgm.detrend.xy = variogram(lquintalperacre~longitude+latitude, sp.data.in)

plot(yield.vgm.detrend.xy,
     cex=1.5, # siz of marker
     pch=19, # type of marker (filled circle)
     xlab="Spatial Lag (h)",
     ylab="Gamma(h), Semivariance",
     type="b",
     main = "Variogram for yield data detrended on both latitude and longitude (Entire Indo-Gangetic Plain)"
     )


#Plot all variograms on a single graph

# Comparison - 1
plotly::plot_ly(type="scatter", mode="lines+markers") %>%
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
  layout(title = "Variograms for entire Indo-Gangetic Plain",
         xaxis=list(title="Spatial Lag (h)"),
         yaxis=list(title="Semivariance, gamma(h)"))
