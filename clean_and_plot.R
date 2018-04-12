expected_time = read.csv("expected_time.csv")
expected_time = expected_time[,2:ncol(expected_time)]
names(expected_time) = seq(1,40)

state = 1
plot_time_vert(expected_time,state)
plot_time_horz(expected_time,state)

for(i in 1:40)
{
  setEPS()
  title_str = paste("plots/horz_",i,".eps",sep="")
  postscript(title_str)
  plot_time_horz(expected_time,i) 
  dev.off()
}

# probably could do both graphing in one for loop, but I'll use two to isolate any potential errors
for(i in 1:40)
{
  setEPS()
  title_str = paste("plots/vert_",i,".eps",sep="")
  postscript(title_str)
  plot_time_vert(expected_time,i) 
  dev.off()
}