# Cardiovascular Disease Analysis - README

## Project Completion Status: ✅ COMPLETED

### Files Created:

1. **PawishrajheAR_analysis.ipynb** - Jupyter notebook with comprehensive hypothesis testing analysis
2. **Pawishrajhen_CaseStudy.xlsx** - Excel file with cleaned data and README sheet
3. **PawishrajhenAR_SPSS.sps** - SPSS syntax file for statistical analysis
4. **requirements.txt** - Python dependencies

### Analysis Completed:

#### 1. One-Sample Hypothesis Test ✅
- **Research Question**: Does the mean systolic blood pressure differ significantly from 120 mmHg?
- **Statistical Test**: One-sample t-test
- **Variables**: ap_hi (systolic BP) vs 120 mmHg reference value
- **Medical Reference**: Normal systolic BP = 120 mmHg

#### 2. Two-Sample Hypothesis Test ✅
- **Research Question**: Does the mean BMI differ significantly between males and females?
- **Statistical Test**: Welch's t-test (independent samples)
- **Variables**: BMI comparison between gender groups
- **Effect Size**: Cohen's d calculated

#### 3. One-Way ANOVA ✅
- **Research Question**: Do the means of diastolic blood pressure differ significantly across cholesterol levels?
- **Statistical Test**: One-way ANOVA with Tukey HSD post-hoc tests
- **Groups**: Normal vs Above Normal vs Well Above Normal cholesterol
- **Assumptions**: Normality and homogeneity of variance checked

### Dataset Information:
- **Source**: cardio_train.csv (70,000 records, 13 variables)
- **Variables**: id, age, gender, height, weight, ap_hi, ap_lo, cholesterol, gluc, smoke, alco, active, cardio
- **Preprocessing**: Age converted to years, BMI calculated, categorical variables labeled

### Deliverables Ready for Submission:
1. ✅ Excel file (Pawishrajhen_CaseStudy.xlsx) with README sheet
2. ✅ SPSS syntax/output (PawishrajhenAR_SPSS.sps)
3. ✅ Python notebook/script (PawishrajheAR_analysis.ipynb)

