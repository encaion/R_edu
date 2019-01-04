library("caret")

lvs = c("normal", "abnormal")
truth = factor(rep(lvs, times = c(86, 258)),
                levels = rev(lvs))
pred = factor(c(rep(lvs, times = c(54, 32)),
                rep(lvs, times = c(27, 231))),
              levels = rev(lvs))
xtab = table(pred, truth)

confusionMatrix(xtab)
# Confusion Matrix and Statistics
# 
# truth
# pred       abnormal normal
# abnormal      231     32
# normal         27     54
# 
# Accuracy : 0.8285          
# 95% CI : (0.7844, 0.8668)
# No Information Rate : 0.75            
# P-Value [Acc > NIR] : 0.0003097       
# 
# Kappa : 0.5336          
# Mcnemar's Test P-Value : 0.6025370       
#                                           
#             Sensitivity : 0.8953          
#             Specificity : 0.6279          
#          Pos Pred Value : 0.8783          
#          Neg Pred Value : 0.6667          
#              Prevalence : 0.7500          
#          Detection Rate : 0.6715          
#    Detection Prevalence : 0.7645          
#       Balanced Accuracy : 0.7616          
#                                           
#        'Positive' Class : abnormal  
