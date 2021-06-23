from sklearn import datasets
from sklearn.metrics import confusion_matrix
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC

from joblib import dump, load

from src.featureextract import *

data_set = None
X = y = None


# dividing X, y into train and test data
def svmtrain(X, y):
    X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=0)
    svm_model_linear = SVC(kernel='linear', C=1).fit(X, y)
    dump(svm_model_linear, 'filename.joblib')
    svm_predictions = svm_model_linear.predict(X_test)
    print(len(X_test), X_test)
    print(svm_predictions)
    # model accuracy for X_test
    accuracy = svm_model_linear.score(X_test, y_test)
    print("accuracy" + str(accuracy))
# creating a confusion matrix
    cm = confusion_matrix(y_test, svm_predictions)
    print(cm)
X = []
y = []
def traing():
    import os
    my_list = os.listdir(r'static\dataset')
    print(my_list)
    i = 0
    for pa in my_list:

        print(pa, i, "==================")

        for root, dirs, files in os.walk(r'static\dataset\\' + pa):

            for f in files:
                try:

                    fname = r'static\dataset\\' + pa + '\\' + f
                    X.append(glcm_feat(fname))
                    y.append(i)
                except Exception as ex:
                    pass
        i = i + 1

    print(y)
    print(X)

    svmtrain(X, y)


def predict(fn):
    glt = glcm_feat(fn)

    svc = load('filename.joblib')
    p = svc.predict([glt])
    print(p[0])
    return p[0]

#predict(r"C:\new project\public complaint\src\static\dataset\w\water3.jpg")
# traing()
