import pandas as pd
import numpy as np
from sklearn.naive_bayes import GaussianNB
from sklearn.model_selection import train_test_split
from sklearn.metrics import recall_score,f1_score,precision_score,accuracy_score,precision_recall_fscore_support

# load the Iris dataset
data = pd.read_csv('D:\PROJECTS//MP//MP3//ultron//smrr//iot//dataset.csv')

# split the data into features (X) and target (y)
X = data.drop('state', axis=1)

y = data['state']


# split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# create a Gaussian Naive Bayes classifier
gnb = GaussianNB()

# train the classifier on the training data
gnb.fit(X_train, y_train)

# make predictions on the testing data
y_pred = gnb.predict(X_test)

# calculate the accuracy of the model
accuracy = accuracy_score(y_test, y_pred)

# print the accuracy
# calculate precision, recall, and F1 score
precision, recall, f1_score, _ = precision_recall_fscore_support(y_test, y_pred, average='weighted')
print("\n\n\n*******************************************")

print("Accuracy        :", accuracy)
print("Precision       :", precision)
print("Recall          :", recall)
print("F1 Score        :", f1_score)

print("*******************************************\n\n\n\n\n")


new_data = np.array([[5.8, 2.7, 5.1, 1.9]])
prediction = gnb.predict(new_data)
print("Prediction:", prediction)
