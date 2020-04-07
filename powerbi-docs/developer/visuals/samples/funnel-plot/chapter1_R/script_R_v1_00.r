# Copyright (c) Microsoft Corporation.  All rights reserved.

# Third Party Programs. This software enables you to obtain software applications from other sources. 
# Those applications are offered and distributed by third parties under their own license terms.
# Microsoft is not developing, distributing or licensing those applications to you, but instead, 
# as a convenience, enables you to use this software to obtain those applications directly from 
# the application providers.
# By using the software, you acknowledge and agree that you are obtaining the applications directly
# from the third party providers and under separate license terms, and that it is your responsibility to locate, 
# understand and comply with those license terms.
# Microsoft grants you no license rights for third-party software or applications that is obtained using this software.

# See also:
# http://stats.stackexchange.com/questions/5195/how-to-draw-funnel-plot-using-ggplot2-in-r/5210#5210


dataset = read.csv(file = "dataset.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)


###############Library Declarations###############

library("ggplot2")
library("scales")


###############Internal parameters definitions#################

##PBI_PARAM Color of scatterplot points
pointsCol = "orange"

#PBI_PARAM Transparency of scatterplot points
transparency = 0.4

##PBI_PARAM Color of baseline
lineColor = "blue"

#PBI_PARAM Size of points on the plot
pointCex = 1

#PBI_PARAM Confidence level line
conf1 = 0.95

#PBI_PARAM Confidence level line #2
conf2 = 0.99


############# Main code #####################

countValue = dataset[,1]
p = dataset[,2]/dataset[,1]
p.se <- sqrt((p*(1-p)) / (countValue))
df <- data.frame(p, countValue, p.se)

## common effect (fixed effect model)
p.fem <- weighted.mean(p[p.se>0], 1/p.se[p.se>0]^2)

## lower and upper limits, based on FEM estimator
zLow = qnorm(conf1)
zUp = qnorm(conf2)


number.seq <- seq(min(countValue), max(countValue), 1000)
number.llconf1 <- (p.fem - zLow * sqrt((p.fem*(1-p.fem)) / (number.seq)))
number.ulconf1 <- (p.fem + zLow * sqrt((p.fem*(1-p.fem)) / (number.seq)))
number.llconf2 <- (p.fem - zUp * sqrt((p.fem*(1-p.fem)) / (number.seq)))
number.ulconf2 <- (p.fem + zUp * sqrt((p.fem*(1-p.fem)) / (number.seq)))

dfCI <- data.frame(number.llconf1, number.ulconf1, number.llconf2, number.ulconf2, number.seq, p.fem)

# Visualization only 
fp <- ggplot(aes(x = countValue, y = p), data = df) 
fp <- fp + geom_point(shape = 19, colour = alpha(pointsCol,transparency), size = pointCex*2 ) 
fp <- fp + geom_line(aes(x = number.seq, y = number.llconf1),linetype = 1, colour = "green",data = dfCI) 
fp <- fp + geom_line(aes(x = number.seq, y = number.ulconf1),linetype = 1, colour = "green", data = dfCI) 
fp <- fp + geom_line(aes(x = number.seq, y = number.llconf2),linetype = 2, colour = "red",data = dfCI) 
fp <- fp + geom_line(aes(x = number.seq, y = number.ulconf2), linetype = 2, colour = "red",data = dfCI) 
fp <- fp + geom_hline(aes(yintercept = p.fem), data = dfCI, colour = lineColor, linetype = 4)
print(fp)