calculate_fine<-function(days_overdue){
    if(days_overdue<=7) return (0)
    if(days_overdue<=30) return ((days_overdue-7)*2)
    return(50)
}
days_overdue=as.integer(readline("Enter the number of days overdue: "))
fine_amount=calculate_fine(days_overdue)
cat("Fine amount:",fine_amount,"\n")
if(fine_amount==0){
    cat("No fine. Thank you for returning the book on time!\n")
}else if (days_overdue>30) {
    cat("Fine exceeds the maximum cap. Please contact the library.\n")
}else{
    cat("Please pay the fine within the specified period.\n")
}
