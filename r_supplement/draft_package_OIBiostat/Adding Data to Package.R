# install.packages("devtools")
library("devtools")
# devtools::install_github("klutometis/roxygen")
library(roxygen2)
# install.packages("plyr")
library(plyr)

## Starting with Chapter 1
## loading frog altitude data
load("/Users/morganfbreitmeyer/Dropbox/open_intro/oi_biostat/data_working_dir/data/ch1_intro_oi_biostat/frogs/frog_altitude_in_progress.Rdata")
View(frog.altitude)
keeps3 = c("altitude", "latitude", "clutch.size", "body.size", "clutch.volume", "egg.size")
frog.altitude.data = frog.altitude[keeps3]
devtools::use_data(frog.altitude.data, overwrite = TRUE)

## loading famuss data
load("/Users/morganfbreitmeyer/Dropbox/open_intro/oi_biostat/data_working_dir/data/ch1_intro_oi_biostat/famuss/famuss_09aug2015.Rdata")
devtools::use_data(famuss)

## loading life expectancy data
load("/Users/morganfbreitmeyer/Dropbox/open_intro/oi_biostat/data_working_dir/data/ch1_intro_oi_biostat/life_expectancy/life.expectancy.income.Rdata")
keeps <- c("country","income", "life.expectancy")
life.expectancy.income = life.expectancy.income[keeps]
life.expectancy.income = life.expectancy.income[-c(185),]
devtools::use_data(life.expectancy.income, overwrite = TRUE)

## loading leap data
load("/Users/morganfbreitmeyer/Dropbox/open_intro/oi_biostat/data_working_dir/data/ch1_intro_oi_biostat/leap/LEAP_7aug2015.Rdata")
LEAP$OFC.outcome.V60[is.na(LEAP$OFC.outcome.V60)] = LEAP$indeterminant.recode[is.na(LEAP$OFC.outcome.V60)]
keeps2 = c("participant.ID", "treatment.group", "age.months", "sex", "primary.ethnicity", "overall.V60.outcome")
LEAP = LEAP[keeps2]
devtools::use_data(LEAP, overwrite = TRUE)

## loading Golub Data
load("/Users/morganfbreitmeyer/Desktop/School/2016\ Spring/Statistics\ 102/psets/pset_01/datasets/golub_exprs_pheno.rdata")
devtools::use_data(golub.exprs.pheno, overwrite = TRUE) # adding full dataset to package
Golub = golub.exprs.pheno["Samples", "BM.PB", "Gender", "Source", "tissue.mf", "cancer"]
devtools::use_data(golub.exprs.pheno, overwrite = TRUE) # adding partial dataset to package


## Chapter 2
## loading birthweight, gestational age data
load("/Users/morganfbreitmeyer/Dropbox/open_intro/oi_biostat/data_working_dir/data/ch2_prob_oi_biostat/birthwt_gestage/brthwt.gestage.overall.counts.Rdata")
devtools::use_data(brthwt.gestage.overall.counts)

## loading CDC diabetes data
load("/Users/morganfbreitmeyer/Dropbox/open_intro/oi_biostat/data_working_dir/data/ch2_prob_oi_biostat/cdc_diabetes/cdc_diabetes_2012.Rdata")
diabetes.cdc.2012 = rename(diabetes.cdc.2012, c("numbe.men.inactive.leisure" = "num.men.inactive.leisure"))
devtools::use_data(diabetes.cdc.2012, overwrite = TRUE)

## Chapter 4
## loading nhanes data
load("/Users/morganfbreitmeyer/Dropbox/open_intro/oi_biostat/data_working_dir/data/ch4_foundinf_oi_biostat/nhanes/NHANES.Rdata")
devtools::use_data(NHANES)

## loading yrbss data
load("/Users/morganfbreitmeyer/Dropbox/open_intro/oi_biostat/data_working_dir/data/ch4_foundinf_oi_biostat/yrbss/yrbss.Rdata")
yrbss = rename(yrbss, c("helmet_12m" = "helmet.12m", "text_while_driving_30d" = "text.while.driving.30d", "physically_active_7d" = "physically.active.7d", "hours_tv_per_school_day" = "hours.tv.per.school.day", "strength_training_7d" = "strength.training.7d", "school_night_hours_sleep"= "school.night.hours.sleep"))
devtools::use_data(yrbss, overwrite = TRUE)

## loading Golub data
load("/Users/morganfbreitmeyer/Dropbox/open_intro/oi_biostat/data_working_dir/data/ch1_intro_oi_biostat/golub/golub_exprs_pheno.Rdata")
names = colnames(golub.exprs.pheno)
for(i in 1:length(names))
{
    names[i] = gsub("-", ".", names[i])
    names[i] = gsub("_", ".", names[i])
}
colnames(golub.exprs.pheno) = names
Golub = golub.exprs.pheno
devtools::use_data(Golub, overwrite = TRUE)

swimmer.number = 1:12
wet.suit.velocity = c(1.57, 1.47, 1.24, 1.35, 1.22, 1.75, 1.64, 1.57, 1.56, 1.53, 1.49, 1.51)
swim.suit.velocity = c(1.49, 1.37, 1.35, 1.27, 1.12, 1.64, 1.59, 1.52, 1.50, 1.45, 1.44, 1.41)
swim = data.frame(swimmer.number, wet.suit.velocity, swim.suit.velocity)
devtools::use_data(swim)

data(births)
baby.smoke = births
devtools::use_data(baby.smoke)

install.packages(OIBioStat)
attach(OIBioStat)

setwd("./OIBioStat")
setwd("~/OIBioStat")
document()
devtools::document()

devtools::check()
