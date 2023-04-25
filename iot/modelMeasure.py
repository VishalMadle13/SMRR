    
import numpy as np 
import pandas as pd 	
import math
from sklearn.model_selection import train_test_split
from sklearn.metrics import recall_score,f1_score,precision_score,accuracy_score



class Model():
  def RoomState(lst):
              df = pd.read_csv('D:\PROJECTS\MP3\SMART_REST_ROOM (3)\SMART_REST_ROOM\MP1\SMART_REST_ROOM\CORE\smrr_core\iot\dataset.csv')
              X = df.drop([df.columns[-1]], axis = 1)
              # print(X)
              y = df[df.columns[-1]]
              # print(y)
              features = list(X.columns)
              # print(features)

              X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2 ,random_state=False)

              train_size = X_train.shape[0]
              test_size = X_test.shape[0]
              print("Total training rows : ",train_size)
              print("Total test rows     : ",test_size)
              num_feats = X_train.shape[1]

              # print(train_size, num_feats)
              # print(X_test.shape[0])
              # print(X_test)        # test dataset 
              # print(y_test)        # desired output of test dataset  or y_true 
              # print(type(X_test))

              likelihoods  = {}
              class_priors = {} 

              for feature in features:
                  likelihoods[feature] = {}
                  for outcome in np.unique(y_train):
                      likelihoods[feature].update({outcome:{}})
                      class_priors.update({outcome: 0})

              # print("likelihoods  : " ,likelihoods)
              # print("class_priors : " ,class_priors)
                # likelihoods  :  {'gas01': {1: {}, 2: {}, 3: {}}, 'gas02': {1: {}, 2: {}, 3: {}}, 'gas03': {1: {}, 2: {}, 3: {}}, 'gas04': {1: {}, 2: {}, 3: {}}}
                # class_priors :  {1: 0, 2: 0, 3: 0}


              """ P(c) - Prior Class Probability """ 
              for outcome in np.unique(y_train):
                  outcome_count = sum(y_train == outcome)
                  # print("count : ",outcome_count,"\n")
                  class_priors[outcome] = outcome_count / train_size

              # print("class_priors : " ,class_priors)
              # class_priors :  {1: 0.33427083333333335, 2: 0.33125, 3: 0.33447916666666666}


              """ P(x|c) - Likelihoods """
              for feature in features:
                for outcome in np.unique(y_train):
                  likelihoods[feature][outcome]['mean'] = X_train[feature][y_train[y_train == outcome].index.values.tolist()].mean()
                  likelihoods[feature][outcome]['variance'] = X_train[feature][y_train[y_train == outcome].index.values.tolist()].var()
                # print(likelihoods)
              # print(likelihoods) 

              y_train[y_train == outcome].index.values.tolist()[:10]
              


              """ Calculates Posterior probability P(c|x) """
              y_pred = []
              test = np.array(X_test)
              # print(type(test))
              # print(test) 

              # converting list to array 
              arr = np.array(test)       # pass the test data
              # print(type(arr))
              # print(arr)

              test = arr 
              # print(test)
              for query in test:
                probs_outcome = {}

                """

                  Note: No Need to calculate evidence i.e P(x) since it is constant fot the given sample.
                          Therfore, it does not affect classification and can be ignored

                """
                for outcome in np.unique(y_train):
                  prior = class_priors[outcome]
                  likelihood = 1
                  evidence_temp = 1

                  for feat, feat_val in zip(features, query):
                    mean = likelihoods[feat][outcome]['mean']
                    var = likelihoods[feat][outcome]['variance']
                    likelihood *= (1/math.sqrt(2*math.pi*var)) * np.exp(-(feat_val - mean)**2 / (2*var))

                  posterior_numerator = (likelihood * prior)
                  probs_outcome[outcome] = posterior_numerator
                  

                pred = max(probs_outcome, key = lambda x: probs_outcome[x])
                y_pred.append(pred)
              # print("y_pred :",y_pred)

              # print(probs_outcome)

              # sumA = probs_outcome[1] + probs_outcome[2] + probs_outcome[3]
              # print(sumA)
              # print("prob of level-1",probs_outcome[1]/sumA)
              # print("prob of level-2",probs_outcome[2]/sumA)
              # print("prob of level-3",probs_outcome[3]/sumA)

              # f1 = probs_outcome[1]/sumA
              # f2 = probs_outcome[2]/sumA
              # f3 = probs_outcome[3]/sumA
              # mx = max(f1,f2,f3)
              # res = 0
              # if mx == f1 :
              #   # print("room state is level 1")
              #   res = 1
              # if mx == f2 :
              #   res = 2
              #   # print("room state is level 2")
              # if mx == f3 :
              #   res = 3
              #   # print("room state is level 3")
        
              
              # print(y_pred)
              # y_pred = [0, 1, 1, 3]
              # y_true = [0, 1, 2, 3]
              y_true = y_test


              accuracy = accuracy_score(y_true, y_pred)
              recall = recall_score(y_true,y_pred,average='weighted')
              precision = precision_score(y_true,y_pred,average='weighted')
              f1 = 2*(precision*recall)/(precision+recall)
              
              print("Accuracy  : ",accuracy) 
              print("Precision : ",precision)
              print("Recall    : ",recall)
              print("F1 score  : ",f1)


            
              return 
  
  lst = [[5.8,2.7,5.1,1.9]]
  st = RoomState(lst)

  








  # TP = FP = TN = FN =  0
              # for i in range(len(y_actual)): 
              #   print(i)
              #     if y_actual[i]==y_predicted[i]:
              #       TP += 1
              #     elif y_actual[i]==y_predicted[i]:
              #       TN += 1
              #     elif y_predicted[i]==1 and y_actual[i]!=y_predicted[i]:
              #       FP += 1
              #     elif y_predicted[i]==0 and y_actual[i]!=y_predicted[i]:
              #       FN += 1
              # T_N=TP + FP + TN + FN
              # print("Accuracy =", (((TP+TN)/T_N)*100),"%")
              # print("Sensitivity =", ((TP)/(TP + FN)))
              # print("Specificity =", ((TN)/(TN + FP)))
 