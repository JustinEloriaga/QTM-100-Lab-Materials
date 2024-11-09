######################################################################
# LAB 10 
#####################################################################

hist(mariokart$total_pr)
boxplot(mariokart$total_pr)

mariokart[mariokart$total_pr>100,]

# Create the subset 

mkClean <- subset(mariokart, mariokart$total_pr<100)
hist(mkClean$total_pr) # MUCH BETTER! 

# Look at the average cost for each shipping speed
tapply(mkClean$total_pr, mkClean$ship_sp, mean)

# Look at the number of observations for each shipping speed
table(mkClean$ship_sp)

# Create a new variable with less shipping categories 
mkClean$newship <- factor(NA, levels = c("FirstClass/Priority", "UPS", "Standard","other"))

# Assign each sale to its new category 
mkClean$newship[mkClean$ship_sp == "firstClass" | 
                  mkClean$ship_sp == "priority"] <- "FirstClass/Priority"


mkClean$newship[mkClean$ship_sp == "ups3Day" |
                  mkClean$ship_sp == "upsGround"] <- "UPS"


mkClean$newship[mkClean$ship_sp == "media" | 
                  mkClean$ship_sp == "parcel" |
                  mkClean$ship_sp == "other"] <- "other"


mkClean$newship[mkClean$ship_sp == "standard"] <- "Standard"

# Verify recording
table(mkClean$newship, mkClean$ship_sp)

# Start by visualizing the relationship
boxplot(mkClean$total_pr ~ mkClean$newship,
        main = 'Total Price by Shipping Carrier',
        xlab = 'Shipping Carrier',
        ylab = 'Total Price ($)')

# Inspect the average total price for each new shipping group
tapply(mkClean$total_pr, mkClean$newship, mean)

# Histogram for first class and priority 
par(mfrow = c(2,2))
hist(mkClean$total_pr[mkClean$newship == "FirstClass/Priority"]) #Lowest Price: 43.27

hist(mkClean$total_pr[mkClean$newship == "UPS"]) #Highest price: 52.62

hist(mkClean$total_pr[mkClean$newship == "Standard"])

hist(mkClean$total_pr[mkClean$newship == "other"])

# Not perfectly normally for all groups but the distribution is acceptable overall. 

# Is there an difference between total_pr by the cat grouping newship

anova.ship <- aov(mkClean$total_pr ~ mkClean$newship)
summary(anova.ship)

# Reject H_0 => At least one mean differs from the others. It indicates that shipping type is associated with price. 

# Better Question: Which shipping type differs?? 

# PAIRWISE COMPARISONS: Tukey Test: need to see the overall Type I error rate

TukeyHSD(anova.ship)
plot(TukeyHSD(anova.ship))

# Obtain total prices for UPS shipping
UPS <- mkClean$total_pr[mkClean$newship == 'UPS']

# Obtain total prices for standard shipping
Standard <- mkClean$total_pr[mkClean$newship == 'Standard']

# Perform two sample t-test with equal variances
t.test(UPS, Standard, var.equal=TRUE)
## Note to set unequal variances, we would set var.equal to FALSE