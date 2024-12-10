# Number of students and courses 
num_students <- 10 
num_courses <- 5 
# Predefined student names 
student_names <- c("John", "Anna", "Tim", "Harry", "Pal", "Jim", "Peter", "Bob", "Cook", "James")
# Predefined course marks for each student 
course_marks <- matrix(c( 
85, 92, 78, 88, 95, 
88, 89, 78, 77, 81, 
75, 80, 85, 70, 60, 
90, 67, 70, 89, 87, 
100, 78, 56, 34, 56,
45, 78, 97, 66, 89,
78, 45, 67, 89, 90, 
56, 89, 67, 99, 98, 
89, 80, 67, 78, 90, 
67, 78, 90, 78, 78), nrow = num_students, byrow = TRUE) 
# Initialize a list to store student information 
srs <- list() 
# Loop for each student 
for (i in 1:num_students) 
{ 
    student_name <- student_names[i] 
    marks <- course_marks[i] 
    total_marks <- sum(marks) 
    average_marks <- total_marks / num_courses 
    grade <- ifelse(average_marks >= 90, "A", ifelse(average_marks >= 80,"B", 
    ifelse(average_marks >= 70, "C", 
    ifelse(average_marks >= 60, "D", "F"))))
    
    # Store student information in a record 
    sr <- list( 
    name = student_name, 
    marks = marks, 
    total = total_marks, 
    average = average_marks, 
    grade = grade 
    ) 
    srs <- c(srs, list(sr)) 
    
} 
cat("\nStudent Grade Report:\n") 
for (sr in srs) { 
    cat("\nName:", sr$name, "\n") 
    cat("Marks:", sr$marks, "\n") 
    cat("Total Marks:", sr$total, "\n")
    cat("Average Marks:", sr$average, "\n") 
    cat("Grade:", sr$grade, "\n") 
    
} 
