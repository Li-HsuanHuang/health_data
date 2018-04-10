plot_time_vert = function(exp_time_df = NULL,absorb)
{
  if(typeof(exp_time_df) == "list")
  {
    exp_time_arr = exp_time_df[[absorb]]
    states = as.integer(rownames(exp_time_df))
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
  
  title_str = paste("Expected Time to be Absorbed at state",toString(absorb),"or Prior")
  plot(states,exp_time_arr,ylab = "Expected Time Until Absorption(in days)",xlab ="Starting State",main = title_str)
  
  
}