expected_time = read.csv("expected_time.csv")
expected_time = expected_time[,2:ncol(expected_time)]
names(expected_time) = seq(1,40)

state = 30
plot_time_vert(expected_time,state)
plot_time_horz(expected_time,state)