#r code for ela scatter

score_ela_scatter <- ggplot(data = state_iready_data, mapping = aes(x= iready_ela_score, y= state_ela_score) )+geom_point(alpha = 0.5, color= 'lightpink2')
score_ela_scatter + geom_smooth(method="lm", formula = y~x) + 
stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State ELA Scores Vs. IReady ELA Scores")

#r code for math scatter
> score_math_scatter<- ggplot(data = state_iready_data, mapping = aes(x= iready_math_score, y= state_math_score) )+geom_point(alpha = 0.5, color = "cadetblue")
> score_math_scatter + geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) + ggtitle("State Math Scores Vs. IReady Math Scores")

 
 #pivot table
 > prof_match_pivot <- pivot_longer(prof_match, 1:4, names_to= 'match_status', values_to = 'num_students')

#bar chart
 prof_plot <-ggplot(prof_match_pivot, aes(match_status, num_students, fill = match_status))+ 
 geom_bar(stat='identity')
 +scale_fill_manual(values = c("ela_match"="lightpink2", 
 								"ela_no_match"= "lightpink2", 
 								"math_match" = "cadetblue",
 								 "math_no_match" = "cadetblue")) +
 								  ggtitle("Number of Times IReady and State Proficiency Match") + 
 								  theme(legend.position = "none")+ xlab("Match Status") + ylab("Number of Students")
prof_plot + geom_text(aes(label= num_students), vjust = -0.2)


#scatter plots for each grade

grade_3_scatter <- ggplot(data = grade_3, mapping = aes(x= iready_ela_score, y= state_ela_score) )+geom_point(alpha = 0.5, color= 'lightpink2')
grade_3_scatter+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State ELA Scores Vs. IReady ELA Scores for Grade 3")
grade_4_scatter <- ggplot(data = grade_4, mapping = aes(x= iready_ela_score, y= state_ela_score) )+geom_point(alpha = 0.5, color= 'lightpink2')
grade_4_scatter+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State ELA Scores Vs. IReady ELA Scores for Grade 4")
grade_5_scatter <- ggplot(data = grade_5, mapping = aes(x= iready_ela_score, y= state_ela_score) )+geom_point(alpha = 0.5, color= 'lightpink2')
grade_5_scatter+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State ELA Scores Vs. IReady ELA Scores for Grade 5")
grade_6_scatter <- ggplot(data = grade_6, mapping = aes(x= iready_ela_score, y= state_ela_score) )+geom_point(alpha = 0.5, color= 'lightpink2')
grade_6_scatter+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State ELA Scores Vs. IReady ELA Scores for Grade 6")
grade_7_scatter <- ggplot(data = grade_7, mapping = aes(x= iready_ela_score, y= state_ela_score) )+geom_point(alpha = 0.5, color= 'lightpink2')
grade_7_scatter+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State ELA Scores Vs. IReady ELA Scores for Grade 7")
grade_8_scatter <- ggplot(data = grade_8, mapping = aes(x= iready_ela_score, y= state_ela_score) )+geom_point(alpha = 0.5, color= 'lightpink2')
grade_8_scatter+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State ELA Scores Vs. IReady ELA Scores for Grade 8")



grade_3_scatter_m <- ggplot(data = grade_3, mapping = aes(x= iready_math_score, y= state_math_score) )+geom_point(alpha = 0.5, color= 'cadetblue')
grade_3_scatter_m+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State Math Scores Vs. IReady Math Scores for Grade 3")
grade_4_scatter_m <- ggplot(data = grade_4, mapping = aes(x= iready_math_score, y= state_math_score) )+geom_point(alpha = 0.5, color= 'cadetblue')
grade_4_scatter_m+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State Math Scores Vs. IReady Math Scores for Grade 4")
grade_5_scatter_m <- ggplot(data = grade_5, mapping = aes(x= iready_math_score, y= state_math_score) )+geom_point(alpha = 0.5, color= 'cadetblue')
grade_5_scatter_m+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State Math Scores Vs. IReady Math Scores for Grade 5")
grade_6_scatter_m <- ggplot(data = grade_6, mapping = aes(x= iready_math_score, y= state_math_score) )+geom_point(alpha = 0.5, color= 'cadetblue')
grade_6_scatter_m+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State Math Scores Vs. IReady Math Scores for Grade 6")
grade_7_scatter_m <- ggplot(data = grade_7, mapping = aes(x= iready_math_score, y= state_math_score) )+geom_point(alpha = 0.5, color= 'cadetblue')
grade_7_scatter_m+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State Math Scores Vs. IReady Math Scores for Grade 7")
grade_8_scatter_m <- ggplot(data = grade_8, mapping = aes(x= iready_math_score, y= state_math_score) )+geom_point(alpha = 0.5, color= 'cadetblue')
grade_8_scatter_m+geom_smooth(method="lm", formula = y~x) + stat_cor(method ="pearson", label.x=100, label.y=100) +ggtitle("State Math Scores Vs. IReady Math Scores for Grade 8")












