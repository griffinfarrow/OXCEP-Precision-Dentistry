# How was data generated for this course? 
  
## Datasets used in this course
During this course, 2 different datasets are used  
  
<u> 1) Head/Neck Squamous Cell Carcinoma (TCGA Pan Cancer Atlas 2018)</u>  
  
Dataset available at: https://www.cbioportal.org/study/clinicalData?id=hnsc_tcga_pan_can_atlas_2018  
  
<u> 2) Prostate Adenocarcinoma (TCGA Pan Cancer Atlas 2018) </u>  
  
Dataset available at: https://www.cbioportal.org/study/summary?id=prad_tcga_pan_can_atlas_2018

## Data Processing Steps 

### HNSC 
* Data downloaded from cBioPortal 
* Used the RNA-seq data contained within `data_mrna_seq_v2_rsem.txt` and the clinical data from `data_clinical_patient.txt`
* For the RNA data, the following steps were applied: 
    * Apply a log2 transformation to the data i.e. new_data = log2(old_data + 1)
    * Remove any duplicated genes; replace the duplicated columns with the median aggregated value (so if there were 3 columns with the same name, take as the feature value for each sample the median value over those 3 columns)
    * Calculate the median absolute deviation of each gene across samples 
    * Take the top 1000 high median absolute deviation genes 
* The final dataframe has 1000 columns (1 for each of 1000 gene) and ~500 rows (number of patients)
* Then apply z-score normalisation to get all RNA-expression values between -1 and 1
* The HPV-status of each patient was taken from the clinical data and merged with the processed RNA-seq data
* The final dataset has 1000 columns for genes and then a last column with HPV-status 

### PCa
* Data downloaded from cBioPortal 
* Used the RNA-seq data contained within `data_mrna_seq_v2_rsem.txt` and the clinical data from `data_clinical_patient.txt`
* A classifier was built using PPCG RNA data to classify a sample into DESNT-positive (high risk, DESNT LPs 3 or 7) vs DESNT-negative (low risk, all other DESNT LPs)
    * Only features that appear in both PPCG data and TCGA data were used 
* The TCGA data was processed as follows: 
    * Apply a log2 transformation 
    * Use min-max scaling to get all values between 0 and 1 to be consistent with PPCG 
    * Use the PPCG classifier to assign a DESNT-status to each row in the TCGA data 
    * Duplicated columns were removed using the same median aggregation method as HNSC 

* Survival outcome data was taken from the clinical file. We used "Disease-Free Status" (`DFS_STATUS`) as most patients do not have data for the other clinical outcomes

* To produce enough data to make classification "easier", for teaching purposes, it was necessary to resample the prostate cancer RNA data to produce more samples of the high-risk DESNT subtype. This was done using `imblearn.SMOTE`
* This synthetic data does not have survival outcome information. To get this, we use the following algorithm 
    1) We have two datasets `df_real` and `df_synthetic`, which is made up of both data from `df_real` and synthetically generated data (mostly of the high-risk DESNT-subtype)
    2) We match all of the patients in `df_synthetic` with those who are real using a left outer join
    3) Synthetic patients in `df_synthetic` are labelled `"SYNTHETIC"` in the `SAMPLE_ID` column
    4) For each synthetic patient: 
        * randomly pick (with replacement) a patient from the real data with the same "DESNT" group
        * the "DFS_STATUS" variable for the synthetic patient should be set to the same value as the real patient (0 or 1 depending on censoring)
        * the "DFS_MONTHS" variable for the synthetic patient should be set to a value drawn from a Gaussian with mean = the variable of the real patient and standard deviation = sqrt(the variable of the real patient) 
* This data is then saved

## Disclaimer about PCa data
The data used for the PCa task is a combination of *real* data from TCGA/cBioPortal, and synthetic data that was generated using `imblearn.SMOTE` to produce a larger dataset that is more amenable for teaching. It is NOT all real PCa data, so please be wary of drawing any biological conclusions from it too strongly. All the synthetic data is marked "SYNTHETIC" in the `SAMPLE_ID` column. 

## Data Security
* All data that is used during this course is publically available at `cBioPortal` or packaged within `lifelines` or `scikit-learn`.  
* `cBioPortal` removes all identifiable information from the data.  
* There are no data safety/security concerns.