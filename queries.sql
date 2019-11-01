-- Create tables for raw data to be loaded into

CREATE TABLE student_loan_debit (
county varchar(255) NOT NULL,
state varchar(255) NOT NULL,
median_loan_white DECIMAL,
median_loan_nonwhite DECIMAL, 
in_collection_loan_white DECIMAL,
in_collection_loan_nonwhite DECIMAL,
median_monthly_payment_white DECIMAL,
median_monthly_payment_nonwhite DECIMAL,
avg_household_income_white DECIMAL, 
avg_household_income_nonwhite DECIMAL,
CONSTRAINT county_state_id PRIMARY KEY (county,state)
);

CREATE TABLE acs_education (
county varchar(255) NOT NULL,
state varchar(255) NOT NULL,
pop1824 INT, 
pop1824_some_college INT,
pop1824_assoc_degree INT,
pop1824_bachelor INT, 
pop1824_grad_degree INT,
pop25 INT,
pop25_some_college INT, 
pop25_assoc_degree INT,
pop25_bachelor INT, 
pop25_grad_degree INT,
pct_pop1824 INT, 
pct_pop1824_some_college INT,
pct_pop1824_assoc_degree INT,
pct_pop1824_bachelor INT,
pct_pop1824_grad_degree INT,
pct_pop25 INT,
pct_pop25_some_college INT, 
pct_pop25_assoc_degree INT,
pct_pop25_bachelor INT, 
pct_pop25_grad_degree INT,
CONSTRAINT county_state_id PRIMARY KEY (county,state)     
);


-- Joins tables
SELECT student_loan_debit.county, 
student_loan_debit.state, 
student_loan_debit.median_loan_white, 
student_loan_debit.median_loan_nonwhite, 
student_loan_debit.in_collection_loan_white, 
student_loan_debit.in_collection_nonwhite, 
student_loan_debit.median_monthly_payment_white, 
student_loan_debit.median_monthly_payment_nonwhite, 
student_loan_debit.avg_household_income_white, 
student_loan_debit.avg_household_income_nonwhite, 
acs_education.county, 
acs_education.state,
acs_education.pop1824, 
acs_education.pop1824_some_college,
asc_education.pop1824_assoc_degree,
acs_education.pop1824_bachelor,
acs_education.pop1824_grad_degree,
acs_education.pop25,
acs_education.pop25_some_colllege,
acs_education.pop25_assoc_degree,
acs_education.pop25_bachelor,
acs_education.pop25_grad_degree,
acs_education.perc_pop1824, 
acs_education.perc_pop1824_some_college,
asc_education.perc_pop1824_assoc_degree,
acs_education.perc_pop1824_bachelor,
acs_education.perc_pop1824_grad_degree,
acs_education.perc_pop25,
acs_education.perc_pop25_some_colllege,
acs_education.perc_pop25_assoc_degree,
acs_education.perc_pop25_bachelor,
acs_education.perc_pop25_grad_degree,

FROM student_loan_debit
JOIN acs_education
ON student_loan.county_state_id = acs_education.county_state_id;

