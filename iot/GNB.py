import pandas as pd
import numpy as np
from sklearn.naive_bayes import GaussianNB
from sklearn.model_selection import train_test_split
from sklearn.metrics import recall_score,f1_score,precision_score,accuracy_score,precision_recall_fscore_support
import warnings
class Model():
    def RoomState(lst):
            # load the Iris dataset
            data = pd.read_csv('D:\PROJECTS//MP//MP3//ultron//smrr//iot//dataset.csv')

            # split the data into features (X) and target (y)
            X = data.drop('state', axis=1)

            y = data['state']
            
            # Get the feature names
            feature_names = X.columns.tolist()
            

            # split the data into training and testing sets
            X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

            # create a Gaussian Naive Bayes classifier
            gnb = GaussianNB()

            # train the classifier on the training data
            gnb.fit(X_train, y_train)

            # make predictions on the testing data
            y_pred = gnb.predict(X_test)

            new_data = pd.DataFrame(lst)
            # Ignore the warning related to feature names
            warnings.filterwarnings('ignore', category=UserWarning, message="X does not have valid feature names")

            prediction = gnb.predict(new_data)

            return prediction[0]

 


lst =  [[5.8, 2.7, 5.1, 1.9]]
res = Model.RoomState(lst)
print(res)