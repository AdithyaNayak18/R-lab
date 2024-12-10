library(dplyr)

# Empty data frame
student_data <- data.frame(
  Name = character(0), 
  Math_Score = numeric(0), 
  Science_Score = numeric(0), 
  History_Score = numeric(0), 
  Attendance = numeric(0)
)

# Add student, calculate average, identify low attendance, generate report
while (TRUE) {
  cat("\n1. Add Student\n2. Generate Report\n3. Exit\n")
  choice <- as.integer(readline("Enter your choice: "))
  
  if (choice == 1) {
    student_data <<- bind_rows(student_data, data.frame(Name = readline("Enter student name: "), 
                                                        Math_Score = as.numeric(readline("Enter math score: ")), 
                                                        Science_Score = as.numeric(readline("Enter science score: ")), 
                                                        History_Score = as.numeric(readline("Enter history score: ")), 
                                                        Attendance = as.numeric(readline("Enter attendance percentage: "))))
    cat("Student information added.\n")
  } else if (choice == 2) {
    report <- merge(
      student_data %>% mutate(Average_Score = (Math_Score + Science_Score + History_Score) / 3) %>% select(Name, Average_Score),
      student_data %>% filter(Attendance < 70) %>% select(Name, Attendance), 
      by = "Name", all = TRUE
    )
    report$Attendance[is.na(report$Attendance)] <- 100
    cat("Performance Report:\n")
    print(report)
  } else if (choice == 3) {
    cat("Exiting the program. Goodbye!\n")
    break
  } else cat("Invalid choice. Please try again.\n")
}
