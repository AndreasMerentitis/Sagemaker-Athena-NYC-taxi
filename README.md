# Sagemaker and Athena for predicting taxi fares in NYC

The goal of this repository is to showcase the use of AWS Sagemaker and AWS Athena in creating a model for predicting taxi fares.
The NYC taxi dataset is used as starting point. The dataset is large so it requires either a very large machine on distributed
execution of queries. 

The following file are to train and deploy models:
* taxi_fare_prediction_original.ipynb which is the original one from the first reference 
* taxi_fare_prediction_dataframe.ipynb which is training the model from a single csv using less data (as baseline for comparissons) 
* taxi_fare_prediction.ipynb which is doing distributed training of the model and explanation using Kernel Shap on a small sample
* taxi_fare_prediction_debug.ipynb which is doing distributed training of the model, Sagemaker debug trials, and explanation using Kernel Shap on a small sample

After uploading the files of the repository to a Sagemaker notebook intance, you can run the run_athena_query.ipynb to download the dataset.
After this set is complete, you can split the files and move from Sagemaker disk to S3. 
Finally you can execute the script taxi_fare_prediction.ipynb to train and deploy the model. 


```bash
# Alternatively you can run with the git option using the awscli interface: 
$ aws sagemaker create-notebook-instance \
                    --notebook-instance-name "MyNotebookInstance" \
                    --instance-type "ml.t2.medium" \
                    --role-arn "arn:aws:iam::012345678901:role/service-role/AmazonSageMaker-ExecutionRole-20181129T121390" \
                    --default-code-repository "MyGitRepo" \
                    --additional-code-repositories "https://github.com/AndreasMerentitis/Sagemaker-Athena-NYC-taxi"
```

Where you need to replace the specific values with our own (repository, ec2 configuration, role, etc).

![relative path 1](/feature_exploration.jpeg?raw=true "feature_exploration.jpeg")
![relative path 2](/residuals.jpeg?raw=true "residuals.jpeg")
![relative path 3](/validation_error.png?raw=true "validation_error.png")
![relative path 4](/features_shap.png?raw=true "features_shap.png")
![relative path 5](/shap_feature_importance.png?raw=true "shap_feature_importance.png")


