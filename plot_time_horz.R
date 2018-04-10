plot_time_horz = function(exp_time_df = NULL,begin)
{
  if(typeof(exp_time_df) == "list")
  {
    exp_time_arr = unlist(exp_time_df[begin,],use.names = FALSE)
    states = as.integer(colnames(exp_time_df))
  }
  else if(typeof(exp_time_df) == "double")
  {
    exp_time_arr = exp_time_df
    states = seq(1,length(exp_time_arr))
  }
  else
  {
    print("Expected time is NULL or a not a double or list")
    return(NULL)
  }
  
  title_str = paste("Expected Time to be Absorbed Starting at State",toString(begin))
  plot(states,exp_time_arr,ylab = "Expected Time Until Absorption(in days)",xlab ="Greatest Absorbing State",main = title_str)
  
  
}