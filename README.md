Red Wine Quality Analysis
This repository contains R code for analyzing the quality of red wine based on various attributes. The code performs data preprocessing, exploratory data analysis, and builds predictive models using Logistic Regression and Random Forest.
Getting Started
 		Clone this repository to your local machine.
 		Ensure you have R and required libraries installed (ggcorrplot, InformationValue, ROSE, randomForest, caret).
 		Download the dataset "winequality-red.csv" and place it in the appropriate directory.
Code Overview
• Libraries: The required libraries for this analysis are loaded.
• Data Loading: The dataset winequality-red.csv is loaded using the read.csv function.
• Data Preprocessing: The quality column is transformed to a binary target variable. The data is formatted for analysis.
• Data Exploration: Exploratory data analysis is performed, including frequency plots, box plots, histograms, and correlation matrices.
• Outlier Detection and Handling: Outliers in the data are detected and treated using the Interquartile Range (IQR) method.
• Model Building:
• Logistic Regression: A logistic regression model is built to predict wine quality. The model's performance is evaluated using accuracy and a Receiver Operating Characteristic (ROC) curve.
• Random Forest: A Random Forest classifier is trained and evaluated for wine quality prediction. The accuracy of the model is computed, and an ROC curve is plotted.
• Variable Importance: For the Logistic Regression model, the importance of variables is analyzed using the varImp function.
Usage
 		Ensure you have R and the required libraries installed.
 		Download the dataset "winequality-red.csv" and place it in the repository directory.
 		Run the R script using an R interpreter (e.g., RStudio or R command line).
Results
The code provides insights into the red wine dataset's quality and builds predictive models to classify wine quality based on its attributes.
Notes
• This code assumes that you have a basic understanding of R programming and data analysis concepts.
• The dataset should be in the CSV format and named "winequality-red.csv".
