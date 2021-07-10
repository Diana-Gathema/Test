# Read the medicare payments dataset
names<-c("DRG","ProviderID","Name","Address","City","State","ZIP","Region","Discharges","AverageCharges",
        "AverageTotalPayments" ,"AverageMedicarePayments")
types='ccccccccinnn'
inpatient<-read_tsv('http://594442.youcanlearnit.net/inpatient.tsv',col_names = names,skip=1,col_types=types)

glimpse(inpatient)

ggplot(data=inpatient)+
  geom_histogram(mapping=aes(x=AverageCharges))

ggplot(data=inpatient)+
  geom_histogram(mapping=aes(x=AverageCharges))+
  coord_cartesian(ylim=c(0,25))
  
ggplot(data=inpatient)+
  geom_boxplot(mapping=aes("charges",AverageCharges))

HighCharges<-filter(inpatient,AverageCharges>500000)
unique(HighCharges$DRG)

ggplot(data=HighCharges)+
  geom_point(mapping=aes(DRG,AverageCharges))+
  theme(axis.text.x=element_text(angle=90,vjust=1,hjust=1))


# Missing and Special Values in R

names<-c("ID","DBAName","AKAName","License","FacilityType","Risk","Address",
         "City","State","ZIP","InspectionDate","InspectionType","Results","Violations",
         "Latitude","Longitude","Location")

inspections<-read_csv("http://594442.youcanlearnit.net/inspections.csv",col_names=names,skip=1)

summary(inspections)

nolicense<-which(is.na(inspections$License))

inspections[nolicense,]

licensed<-inspections[-nolicense,]
unlicensed<-inspections[nolicense,]

badmath<-c(1,2,3,4/0,0/0,NA)
badmath

# Nan-Not a number
is.na(badmath)
is.nan(badmath)
is.infinite(badmath)
is.finite(badmath)

# Breaking columns
# use separate()
# separate(data=tibble,column you want to break,into=names of col you want to save the separated data,
# sep=how you want the data to be separated)

inpatient
unique(inpatient$DRG)
inpatient_separate<-separate(inpatient,DRG,c("DRGcode","DRGdescription"),4)
inpatient$DRG[45895]
glimpse(inpatient_separate)
