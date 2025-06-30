# OXCEP Summer Course in Precision Medicine and Precision Dental Medicine

![Logo](logo/logo.png)
  
Welcome to the practical coding course for the OXCEP Summer School in Precision Dental Medicine and Precision Medicine. This repository contains the course materials.
  
If you have any issues with these course materials, please email Griffin Farrow at `Griffin.Farrow@nds.ox.ac.uk`.  
  
## Installation Instructions
  
There is an installation guide, explaining how to download the Anaconda distribution that we will be using in this course. This is found [here](Installation_Instructions.pdf).  
  
We are using the Anaconda distribution, but if you'd rather just follow the course with your own Python version, there is a `requirements.txt` and `environment.yml` file in `installation/`. We use `python 3.9`.  

You can check whether all modules are installed using `installation/verify_installation.py`

## Installation Checklist

If you can do the following, then you are prepared for the course:

* open a Jupyter notebook
* navigate to the `course_content` directory and open the `installation_tester.ipynb` file
* run all cells
* if the notebook runs without errors, then your installation is ready for the course!

## Course Content

The course content is provided in the `course_content/` directory. We briefly summarise the course syllabus and the activities you will be asked to do below. Please note that the exact content may differ slightly from the sessions, depending on time and resources.

### <u> Precision Dental Medicine (3 practical coding sessions) </u>

<u> Session 1: Introduction </u>

* Introduction to machine learning and data science for healthcare
* What is a decision tree, random forest and machine learning model?
* Python and `pandas` basics
* Training a machine learning model from scratch

<b> Homework</b>: You will be asked to train a random forest machine learning model to predict HPV status from mRNA data of head and neck squamous cell carcinoma, including loading and preprocessing the data using the `pandas` library

<u> Session 2: Evaluating Machine Learning Models </u>

* You will be shown how to evaluate machine learning models in terms of accuracy, specificity/sensistivity and the receiver operating characteristic curve
* You will be shown how to use SHAP values to perform biomarker discovery
* You will use this to build a biomarker panel to identify HPV status from mRNA data

<b> Homework</b>: You will be asked to build a random forest model to predict subtypes of prostate adenocarcinoma, using mRNA data from TCGA. You will then evaluate these models and build a biomarker panel to better test for these subtypes.

<u> Session 3: Survival Analysis </u>  

* You will be shown how to use the `lifelines` library to do survival analysis
* You will plot Kaplan-Meier curves to compare the survival outcomes of the subtypes you found in the previous homework
* We will discuss the ethical and broader implications of using AI and machine learning in personalised Medicine

### <u> Precision Medicine (5 practical coding sessions) </u>

<u> Session 1: Introduction </u>

* Introduction and welcome to the practical coding course
* What is machine learning and data science? And why might it be useful in healthcare?
* How do I build a decision tree and random forest from scratch?
* Demonstration of how to use Python and `pandas` for data science

<u> Session 2: Data Science Best Practices </u>

* What are best practices in data science?
* Why is transparency and reproducibility in data science important? 
* Test-train splitting, cross-validation, hyperparameter tuning

<b> Homework</b>: You will be asked to train a random forest machine learning model to predict HPV status from mRNA data of head and neck squamous cell carcinoma, including loading and preprocessing the data using the `pandas` library

<u> Session 3: Model Evaluation with Python </u>

* We will explain how to evaluate a machine learning model
* Time for 1:1 feedback with instructors to talk through your understanding so far
* Evaluation of the model you produced in the previous session 
* The trade-off between different model performance measures 

<u> Session 4: Identifying the most important inputs </u> 

* Why is feature selection so important in healthcare data science? 
* What are SHAP scores and how can we use them? 
* We will show you how to use SHAP to build a prospective list of the "most important" features, to aid in biomarker discovery 

<b> Homework</b>: You will be asked to build a random forest model to predict subtypes of prostate adenocarcinoma, using mRNA data from TCGA. You will then evaluate these models and build a biomarker panel to better test for these subtypes.

<u> Session 5: Survival Analysis </u>
* You will be shown how to use the `lifelines` library to do survival analysis
* You will plot Kaplan-Meier curves to compare the survival outcomes of the subtypes you found in the previous homework
* We will discuss the ethical and broader implications of using AI and machine learning in personalised Medicine


## Datasets
  
The complete datasets are found in `datasets/`, along with a description of the algorithm used to produce them in `datasets/Data_Generation_Algorithm.md`. These files are only provided for interest. 
  
The data that you will actually use is provided in the course content when you need it. 