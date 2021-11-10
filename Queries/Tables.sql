
-- Creating table for hiring candidate with id as primary key
CREATE TABLE hired_candidates (
  id int NOT NULL,
  first_name varchar(100) NOT NULL,
  middle_name nvarchar(100) DEFAULT NULL,
  last_name varchar(100) NOT NULL,
  email varchar(50) NOT NULL,
  mobile_num bigint NOT NULL,
  hired_city varchar(50) NOT NULL,
  hired_date datetime NOT NULL,
  degree varchar(100) NOT NULL,
  aggr_per float DEFAULT NULL,
  current_pincode int DEFAULT NULL,
  permanent_pincode int DEFAULT NULL,
  hired_lab nvarchar(20) DEFAULT NULL,
  attitude_remark nvarchar(15) DEFAULT NULL,
  communication_remark  nvarchar(15) DEFAULT NULL,
  knowledge_remark nvarchar(15) DEFAULT NULL,
  status nvarchar(20) NOT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
) 


--Creatin table for fellowship candidate with id as primary key
CREATE TABLE fellowship_candidates (
  id int NOT NULL,
  first_name varchar(100) NOT NULL,
  middle_name varchar(100) DEFAULT NULL,
  last_name varchar(100) NOT NULL,
  email varchar(50) NOT NULL,
  mobile_num bigint NOT NULL,
  hired_city varchar(50) NOT NULL,
  hired_date datetime NOT NULL,
  degree varchar(50) NOT NULL,
  aggr_per float DEFAULT NULL,
  current_pincode int DEFAULT NULL,
  permanent_pincode int DEFAULT NULL,
  hired_lab nvarchar(20) DEFAULT NULL,
  attitude_remark nvarchar(15) DEFAULT NULL,
  communication_remark nvarchar(15) DEFAULT NULL,
  knowledge_remark nvarchar(15) DEFAULT NULL,
  birth_date date NOT NULL,
  is_birth_date_verified int DEFAULT 0,
  parent_name varchar(50) DEFAULT NULL,
  parent_occupation varchar(100) NOT NULL,
  parent_mobile_num bigint NOT NULL,
  parent_annual_sal float DEFAULT NULL,
  local_addr nvarchar(255) NOT NULL,
  permanent_addr nvarchar(150) DEFAULT NULL,
  photo_path nvarchar(500) DEFAULT NULL,
  joining_date date DEFAULT NULL,
  candidate_status varchar(20) NOT NULL,
  personal_info_filled int  DEFAULT 0,
  bank_info_filled int DEFAULT 0,
  educational_info_filled int DEFAULT 0,
  doc_status nvarchar(20) DEFAULT NULL,
  remark nvarchar(150) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
);

--Created table for Candidates Personal Details Check
CREATE TABLE candidates_personal_det_check (
  id int NOT NULL,
  candidate_id  int NOT NULL,
  field_name int NOT NULL,
  is_verified int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
);

--Created table for Candidate Bank Details Table with candidate id as foreign key and id as primary key
CREATE TABLE candidate_bank_det(
  id int NOT NULL,
  PRIMARY KEY (id),
  candidate_id int NOT NULL,
  name varchar(100) NOT NULL,
  account_num int NOT NULL,
  is_account_num_verified int  DEFAULT 0,
  ifsc_code nvarchar(20) NOT NULL,
  is_ifsc_code_verified int  DEFAULT 0,
  pan_number  nvarchar(10) DEFAULT NULL,
  is_pan_number_verified int DEFAULT 0,
  addhaar_num int NOT NULL,
  is_addhaar_num_verified int DEFAULT 0,
  CONSTRAINT FK_candidate_bank_det_candidate_id FOREIGN KEY (candidate_id)  
  REFERENCES fellowship_candidates (id),
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,  
);

--Created table for Candidate Qualification Table with candidate id as foreign key and id as primary key
CREATE TABLE candidate_qualification(
  id int NOT NULL,
  PRIMARY KEY (id),
  candidate_id int NOT NULL,
  diploma int  DEFAULT 0,
  degree_name varchar NOT NULL,
  is_degree_name_verified int  DEFAULT 0,
  employee_decipline varchar(100) NOT NULL,
  is_employee_decipline_verified int DEFAULT 0,
  passing_year int NOT NULL,
  is_passing_year_verified int DEFAULT 0,
  aggr_per float DEFAULT NULL,
  final_year_per float DEFAULT NULL,
  is_final_year_per_verified int DEFAULT 0,
  training_institute varchar(20) NOT NULL,
  is_training_institute_verified int DEFAULT 0,
  training_duration_month int DEFAULT NULL,
  is_training_duration_month_verified int DEFAULT 0,
  other_training nvarchar(255) DEFAULT NULL,
  is_other_training_verified int DEFAULT 0,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  CONSTRAINT FK_candidate_qual_candidate_id FOREIGN KEY (candidate_id) REFERENCES fellowship_candidates (id),
 );
