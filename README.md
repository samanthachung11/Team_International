[Medical Insurance Costs]
This repository provides explanations of the data analysis process for the DataRes article "(INSERT URL)", published [INSERT DATE]. Please check out our article, which contains visualizations and insights about [INSERT TOPIC].

Contributors: Angelina Kim, Avishek Ghosh, Jun Bae, Naomi Golin, Samantha Chung

Data

The data sets we used to develop our Medium Article are:

Urban Institute Dataset: 
Carman, Joella. “Urban Institute (Github Repository).” Github,        <https://github.com/UrbanInstitute/debt-interactive-map/tree/master/data/201911-update>

Kaggle Datasets:
Choi, Miri. “Medical Cost Personal Datasets.” Kaggle, 21 Feb. 2018, www.kaggle.com/mirichoi0218/insurance. 

Ulianova, Svetlana. “Cardiovascular Disease Dataset.” Kaggle, 20 Jan. 2019, www.kaggle.com/sulianova/cardiovascular-disease-dataset. 
 
Public Health Dataset : https://healthcostinstitute.org [not acessible unless within the United States]


The dataset created by Choi, Miri is a simulated dataset of the insurance costs charged on individuals by insurance companies based on a variety of factors such as: age, region (within the United States), number of children, and BMI (otherwise known as body mass index). 


Data Processing

Because this was a collaborative project, analysis was done via both R and Python. The data was fairly tidy - for example, each variable was allocated to individual columns and each observation was given a particular row. Hence, there was not a lot of "data cleaning" needed on our behalf beyond extracting the variables that we need.


Analysis and Code

**In our analysis, we will attempt to answer the following questions:**

**Is there a difference between the amount that males and females have to pay for insurance?**

Our analysis shows that females have to pay more for insurance costs as compared to their male counterparts. 
     
**How does an individual’s BMI predict their medical cost from their insurance providers?**

We deduced that a higher BMI is generally associated with a greater medical cost. In particular, as the BMI increases, the medical costs for insurance increases as well. 

**Does the smoking status correlate to the insurance cost?**

We deduced that smoking status places individuals at risk of higher medical costs. This could be due partly to the increased blood pressure associated with smoking. 
 
**Does the ethnicity of insurance recipients influence the medical cost charged?**

We found out that non white individuals are generally charged a greater amount for medical cost as compared to individuals who are white. However, non white indiivdulas also have a lower income on average than their white counterparts.
