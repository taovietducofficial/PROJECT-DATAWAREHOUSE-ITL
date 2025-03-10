# DESIGN OF A DATA WAREHOUSE OF GRADUATION RATE OF UNIVERSITIES IN THE US
<p align="justify">
Only 70% of the complete code has been pushed due to certain ownership rights reasons from me. Please review and respect this. Thank you very much!
</p>

## Professional design

Institution Details Report: Detailed analysis of higher education institutions. The analyst wants to track metrics related to geographic location, institution type based on the Carnegie Classification system in the U.S., and student-related measurement parameters.

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/11.png" width="1000" />
</p>

## Design Dimension tables

## Dimension Tables

### DimState
| Attribute     | Description |
|--------------|-------------|
| `keyState`   | Primary key |
| `name`       | Name of the state and territory |
| `state_abbr` | Abbreviation of the state and territory |
| `state_code` | Numeric code of the state and territory |
| `state_post` | Postal code of the state and territory |

### DimCohort
| Attribute   | Description |
|------------|-------------|
| `keyCohort` | Primary key |
| `race`      | Race |
| `cohort`    | Group of students graduating in the same year or a defined group |
| `gender`    | Gender |
| `year`      | Year of statistical reporting |

### DimLocation
| Attribute   | Description |
|------------|-------------|
| `keyLocation` | Primary key |
| `keyState`    | Foreign key referencing DimState |
| `city`        | Name of the city in a state |

### DimCarnegie
| Attribute       | Description |
|----------------|-------------|
| `keyCarnegie`  | Primary key |
| `institutionType` | Institution type based on the Carnegie Classification system |
| `programSize`  | Program size of the university |

## Fact Table Design

### Fact Institution Details
| Attribute       | Description |
|----------------|-------------|
| `keyInstitution` | Primary key |
| `keyCarnegie`    | Foreign key referencing DimCarnegie |
| `keyLocation`    | Foreign key referencing DimLocation |
| `UnitID`         | University ID |
| `chronname`      | Name of the university |
| `Level`          | 4-year or 2-year institution (University or College) |
| `Control`        | Institution type (Public, Private, or Private non-profit) |
| `site`           | University website |
| `measure...`     | Various measurement values (generalized as `measure`) |

### Fact Institution Graduation
| Attribute       | Description |
|----------------|-------------|
| `keyInstitution` | Foreign key referencing Fact Institution Details |
| `keyCohort`      | Foreign key referencing DimCohort |
| `cohort_size`    | Number of students in the survey |
| `grad_100`       | Number of students graduating within 100% of the normal or expected time |
| `grad_150`       | Number of students graduating within 150% of the normal or expected time |
| `grad_100_rate`  | Graduation rate within 100% of the normal time |
| `grad_150_rate`  | Graduation rate within 150% of the normal time |

## Snowflake diagram
<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/12.png" width="1000" />
</p>

## Data Preprocessing

### Idea
To analyze specific data, such as "What is the graduation rate per state?" or "Is there a disparity among different demographic groups?", we create corresponding dimension tables. From the original `InstitutionDetails` dataset containing 62 columns, we filter necessary attributes to generate a new dataset of the same length but with relevant information.

### Data Cleaning Script
```python
import pandas as pd
import numpy as np

# Load dataset
cc_institutions_details = pd.read_csv('cc_institutions_details.csv')

# Convert categorical indicators to binary
cc_institutions_details["hbcu"] = cc_institutions_details["hbcu"].apply(lambda x: 1 if x == "X" or x == 1 else 0)
cc_institutions_details["flagship"] = cc_institutions_details["flagship"].apply(lambda x: 1 if x == "X" or x == 1 else 0)

# Drop unnecessary columns
cc_institutions_details.drop(columns=cc_institutions_details.iloc[:, 39:57].columns.tolist(), inplace=True)
columns_to_drop = ["aid_value", "aid_percentile", "med_sat_percentile", "endow_value", "endow_percentile", "nicknames", "counted_pct", "ft_fac_value", "ft_fac_percentile"]
cc_institutions_details.drop(columns=columns_to_drop, inplace=True)
cc_institutions_details.drop(columns=["state_sector_ct", "carnegie_ct"], inplace=True)

# Save cleaned dataset
cc_institutions_details.to_csv('pre_cc_institutions_details.csv', index=False)
```

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/13.png" width="1000" />
</p>

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/25.png" width="1000" />
</p>

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/26.png" width="1000" />
</p>


In the data set, we see a basic column. It is a classification by an organization "carnegie classification of institutions of higher education" that classifies universities in the US. At this point, we need a dimension to classify universities to facilitate analysis
```python
import pandas as pd

# Load dataset
file_path = "cc_institution_details.csv"
basic_set_df = pd.read_csv(file_path)

# Initialize an empty dictionary
lst1 = {}

# Iterate through the DataFrame
for index, row in basic_set_df.iterrows():
    val = row["basic"]  # Column containing Carnegie classification
    tmp = val.split("--")
    
    if tmp[0] in lst1.keys():
        if len(tmp) > 1:
            subCarnegie = "--".join(tmp[1:])
            lst1[tmp[0]].add(subCarnegie)
        else:
            lst1[tmp[0]] = set()
    else:
        if len(tmp) > 1:
            lst1[tmp[0]] = set()
            subCarnegie = "--".join(tmp[1:])
            lst1[tmp[0]].add(subCarnegie)
        else:
            lst1[tmp[0]] = set()

# Prepare data for DataFrame
carnegie_data = {"institutionType": [], "programSize": []}

for key, val in lst1.items():
    if len(val) > 0:
        for v in val:
            carnegie_data["institutionType"].append(key)
            carnegie_data["programSize"].append(v)
    else:
        carnegie_data["institutionType"].append(key)
        carnegie_data["programSize"].append(pd.NA)

# Create DataFrame
Df_DimCarnegie = pd.DataFrame(carnegie_data)

# Display sample data
print("Head of DataFrame:")
print(Df_DimCarnegie.head())
```
The original data of cc_institution_grads.csv has 1302102 lines. But most of that data is empty and equal to 0. We proceed to remove that data to save time when ETL enters the data warehouse. And the attribute columns are abbreviations and we also include specific information.

```python
import numpy as np
import pandas as pd
cc_institutions_grads = pd.read_csv('cc_institution_grads.csv')

cc_institutions_grads["grad_100_rate"] = np.round(cc_institutions_grads["grad_100"] * 100 / cc_institutions_grads["grad_cohort"], 1)
cc_institutions_grads["grad_150_rate"] = np.round(cc_institutions_grads["grad_150"] * 100 / cc_institutions_grads["grad_cohort"], 1)

clean_data = cc_institutions_grads[(~cc_institutions_grads["grad_100_rate"].isnull()) &
(~cc_institutions_grads["grad_150"].isnull())]
clean_data = clean_data[clean_data["grad_cohort"] > 0]
clean_data = clean_data.reset_index(drop=True)
gender_dic = {
    "M": "Male", 
    "F":"Female", 
    "B":"Both gender"
}

race_dic = {
    'X': "all students",
    'Ai': "American Indian",
    'A': "Asian",
    'B': "Black",
    'H': "Hispanic",
    'W': "White" 
}
cohort_dic = {
    '4y bach': "Bachelor's/equivalent-seeking cohort at 4-year institutions",
    '4y other': "Students seeking another type of degree or certificate at a 4-year institution",
    '2y all': "Degree-seeking students at 2-year institutions" 
}

clean_data["gender"] = clean_data["gender"].transform(lambda x: gender_dic[x])
clean_data["race"] = clean_data["race"].transform(lambda x: race_dic[x])
clean_data["cohort"] =clean_data["cohort"].transform(lambda x: cohort_dic[x])

clean_data.to_csv('pre_institutions_grads.csv', index=False)

```
## Create College_Staging and SSIS project
<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/Screenshot%202025-02-27%20191102.png" width="1000" />
</p>

## Create a data source and destination connection
<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/14.jpg" width="1000" />
</p>

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/15.jpg" width="1000" />
</p>


## Conduct Staging
<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/17.jpg" width="1000" />
</p>

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/18.jpg" width="1000" />
</p>

Data Flow Institution Details Staging

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/19.jpg" width="1000" />
</p>

## Proceed to Load

Create a package named College_Completioon_Loading

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/20.jpg" width="1000" />
</p>

Includes flow data and truncates

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/21.jpg" width="1000" />
</p>

Data Flow DimState

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/22.jpg" width="1000" />
</p>

## Configure Data Flow FactGraduation
<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/28.jpg" width="1000" />
</p>

## Loading results
<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/27.jpg" width="1000" />
</p>

# DATA ANALYSIS (SSAS)

### Here is the English translation of your queries:

- The proportion of full-time students by region.

- The proportion of students receiving Pell Grants in each region.

- The on-time graduation rate by study duration in each region.

- The retention rate after the first academic year in each region.

- The total number of students and the estimated cost to complete a program per student.

- The number of graduates by race and gender.

- The number of on-time graduates by region.

- The number of students graduating within 150% of the standard program duration, categorized by gender and race per year.

- The number of graduates per year, categorized by institution type and cohort.

- The number of graduates by race and gender, categorized by program size.

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/30.png" width="1000" />
</p>

# ANALYSIS USING POWER BI

## Report on the geographical location of University facilities

Detailed analysis of the geographical location of University facilities using MapChart. Indicate how many cities and how many Universities there are in that State. Show those school locations on the map

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/31.png" width="1000" />
</p>

## Report on the percentage of students studying full-time programs at the University

Detailed analysis of the proportion of students studying full-time programs. We see that on average in the US, this rate is quite high, accounting for 71.09%....

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/32.png" width="1000" />
</p>


## Report on the percentage of students receiving Pell grants at the University

Detailed analysis of the percentage of students receiving US Pell grants. We see that on average in the US, the average rate of the entire US is 47.57%.

<p align="center">
  <img src="https://github.com/taovietducofficial/PROJECT-DATAWAREHOUSE-ITL/blob/master/33.png" width="1000" />
</p>

# CONCLUDE
1. Advantages

- Having a solid understanding of fundamental concepts related to data warehouses and OLAP, as well as the essential characteristics of a data warehouse. This knowledge is applied to build a complete data warehouse for data analysis. Additionally, the team has developed a data warehouse model and gained experience with tools such as SSIS, SSAS, and Reporting.

2. Disadvantages

- Due to limited research time, the team has not explored the topic in depth or optimized data extraction. The queries are still relatively simple and lack diversity.

3. Future Development

- Building on the initial research on data warehouses, the team plans to integrate additional tools and identify more complex business requirements for further study.

# THANK YOU FOR WATCHING!
<p align="justify">
Only 70% of the complete code has been pushed due to certain ownership rights reasons from me. Please review and respect this. Thank you very much!
</p>
