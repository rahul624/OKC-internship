# reading the dataset
shots <- read_csv("shots_data.csv")

#created an empty variable called zone to classify the zones where the shots were taken
zone=numeric()
i=1

#using while loop to go through each shot and classify them into the given bins
while(i<=length(shots$team))
{
  dist=sqrt(shots$x[i]**2+shots$y[i]**2)  #dist is the distance from hoop to shot 
  
  if(abs(shots$x[i])>=22 & shots$y[i]<=7.8)  #criteria for corner three
  {
    zone[i]="c3"
  }
  else if(dist>=23.75 & shots$y[i] > 7.8) #criteria for non corner three
  {
    zone[i]="nc3"
  }
  else if(dist<23.75 & shots$y[i]>7.8)  #criteria for non corner 2
  {
    zone[i]="2pt"
  }
  else if(shots$y[i]<=7.8 & abs(shots$x[i])<22) #criteria for corner 2
  {
    zone[i]="2pt"
  }
  else  
  {
    zone[i]="error"  #if none of the previous then error
  }
  i=i+1
}
shots$zone=zone

teamA=filter(shots,team=="Team A") 
teamB=filter(shots,team=="Team B")

#For Team A, what percentage of their shots were attempted in the 2pt zone
sum(teamA$zone=="2pt")/length(teamA$zone)

#For Team A, what percentage of their shots were attempted in the nC3 zone?
sum(teamA$zone=="nc3")/length(teamA$zone)

#For Team A, what percentage of their shots were attempted in the C3 zone?
sum(teamA$zone=="c3")/length(teamA$zone)

#For Team A, what was the eFG in the 2PT zone? Rounded to 3 decimal places?
sum(teamA$zone=="2pt" & teamA$fgmade==1)/sum(teamA$zone=="2pt")

#For Team A, what was the eFG in the NC3 zone? Rounded to 3 decimal places?
(1.5*sum(teamA$zone=="nc3" & teamA$fgmade==1))/sum(teamA$zone=="nc3")

#For Team A, what was the eFG in the C3 zone? Rounded to 3 decimal places?
(1.5*sum(teamA$zone=="c3" & teamA$fgmade==1))/sum(teamA$zone=="c3")



#For Team B, what percentage of their shots were attempted in the 2PT zone? 
sum(teamB$zone=="2pt")/length(teamB$zone)

#For Team B, what percentage of their shots were attempted in the NC3 zone?
sum(teamB$zone=="nc3")/length(teamB$zone)

#For Team B, what percentage of their shots were attempted in the C3 zone?
sum(teamB$zone=="c3")/length(teamB$zone)


#For Team B, what was the eFG in the 2PT zone? Rounded to 3 decimal places?
sum(teamB$zone=="2pt" & teamB$fgmade==1)/sum(teamB$zone=="2pt")


#For Team B, what was the eFG in the NC3 zone? Rounded to 3 decimal places?
(1.5*sum(teamB$zone=="nc3" & teamB$fgmade==1))/sum(teamB$zone=="nc3")


#For Team B, what was the eFG in the C3 zone? Rounded to 3 decimal places?
(1.5*sum(teamB$zone=="c3" & teamB$fgmade==1))/sum(teamB$zone=="c3")
