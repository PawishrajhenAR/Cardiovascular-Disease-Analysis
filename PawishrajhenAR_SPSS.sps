* SPSS Syntax for Cardiovascular Disease Analysis
* File: YourName_SPSS.sps
* Description: Hypothesis testing analysis for cardiovascular dataset

* Load the dataset
GET DATA
  /TYPE=TXT
  /FILE='cardio_train.csv'
  /DELCASE=LINE
  /DELIMITERS=";"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
    id F8.0
    age F8.0
    gender F1.0
    height F3.0
    weight F5.2
    ap_hi F3.0
    ap_lo F3.0
    cholesterol F1.0
    gluc F1.0
    smoke F1.0
    alco F1.0
    active F1.0
    cardio F1.0.

* Data preprocessing
COMPUTE age_years = age / 365.25.
COMPUTE bmi = weight / ((height / 100) ** 2).

* Create value labels
VALUE LABELS
  gender 1 'Female' 2 'Male'
  cholesterol 1 'Normal' 2 'Above Normal' 3 'Well Above Normal'
  gluc 1 'Normal' 2 'Above Normal' 3 'Well Above Normal'
  smoke 0 'Non-smoker' 1 'Smoker'
  alco 0 'Non-drinker' 1 'Drinker'
  active 0 'Inactive' 1 'Active'
  cardio 0 'No CVD' 1 'CVD'.

* Variable labels
VARIABLE LABELS
  id 'Patient ID'
  age 'Age in days'
  age_years 'Age in years'
  gender 'Gender'
  height 'Height in cm'
  weight 'Weight in kg'
  bmi 'Body Mass Index'
  ap_hi 'Systolic Blood Pressure (mmHg)'
  ap_lo 'Diastolic Blood Pressure (mmHg)'
  cholesterol 'Cholesterol Level'
  gluc 'Glucose Level'
  smoke 'Smoking Status'
  alco 'Alcohol Consumption'
  active 'Physical Activity'
  cardio 'Cardiovascular Disease'.

* ===========================================
* 1. ONE-SAMPLE T-TEST
* ===========================================
* Research Question: Does mean systolic BP differ from 120 mmHg?

* Select cases with realistic BP values
USE ALL.
COMPUTE filter_$ = (ap_hi >= 80 AND ap_hi <= 250).
VARIABLE LABELS filter_$ 'ap_hi >= 80 AND ap_hi <= 250 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.

* One-sample t-test
T-TEST
  /TESTVAL=120
  /MISSING=ANALYSIS
  /VARIABLES=ap_hi
  /CRITERIA=CI(.95).

* ===========================================
* 2. TWO-SAMPLE T-TEST
* ===========================================
* Research Question: Does mean BMI differ between males and females?

* Select cases with realistic BMI values
USE ALL.
COMPUTE filter_$ = (bmi >= 15 AND bmi <= 60).
VARIABLE LABELS filter_$ 'bmi >= 15 AND bmi <= 60 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.

* Two-sample t-test (Independent samples)
T-TEST GROUPS=gender(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=bmi
  /CRITERIA=CI(.95).

* ===========================================
* 3. ONE-WAY ANOVA
* ===========================================
* Research Question: Does mean diastolic BP differ across cholesterol levels?

* Select cases with realistic diastolic BP values
USE ALL.
COMPUTE filter_$ = (ap_lo >= 50 AND ap_lo <= 150).
VARIABLE LABELS filter_$ 'ap_lo >= 50 AND ap_lo <= 150 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.

* One-way ANOVA
ONEWAY ap_lo BY cholesterol
  /STATISTICS DESCRIPTIVES HOMOGENEITY
  /MISSING ANALYSIS
  /POSTHOC=TUKEY ALPHA(0.05).

* ===========================================
* DESCRIPTIVE STATISTICS
* ===========================================
* Generate comprehensive descriptive statistics
DESCRIPTIVES VARIABLES=age_years height weight bmi ap_hi ap_lo
  /STATISTICS=MEAN STDDEV MIN MAX.

* Cross-tabulation for categorical variables
CROSSTABS
  /TABLES=gender BY cardio
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ
  /CELLS=COUNT ROW COLUMN TOTAL.

* ===========================================
* END OF ANALYSIS
* ===========================================
