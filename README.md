# Sagemaker and Athena for predicting taxi fares in NYC

The goal of this repository is tow showcase the use of AWS Sagemaker and AWS Athena in creating a model for predicting taxi fares.
The NYC taxi dataset is used as starting point. The dataset is large so it requires either a very large machine on distributed
execution of queries. 

After uploading the files of the repository to Sagemaker notebook, you can run the run_athena_query.ipynb to download the dataset.
After this set is complete, you can split the files and move for Sagemaker disk to S3. 

Finally you can execute the script taxi_fare_prediction.ipynb to train and deploy the model. 

![relative path 1](/feature_exploration.jpeg?raw=true "feature_exploration.jpeg")
![relative path 2](/residuals.jpeg?raw=true "residuals.jpeg")



