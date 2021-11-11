
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

  --Created table for Candidate Education Detailed Check
 CREATE TABLE candidates_education_det_check (
  id int NOT NULL,
  candidate_id  int NOT NULL,
  field_name int NOT NULL,
  is_verified int DEFAULT NULL,
  lastupd_stamp datetime DEFAULT NULL,
  lastupd_user int DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL
);

--Created table for Candidate Documents with candidate id as foreign key 
CREATE TABLE candidate_docs(
  id int NOT NULL,
  PRIMARY KEY (id),
  candidate_id int NOT NULL,
  doc_type nvarchar(20) DEFAULT NULL,
  doc_path nvarchar(500) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  CONSTRAINT FK_candidate_docs_candidate_id FOREIGN KEY (candidate_id) REFERENCES fellowship_candidates (id),
); 

--Created table for User Roles
CREATE TABLE user_roles (
  user_id int NOT NULL ,
  role_name varchar(100)
);

--Created table for Company Table with id as primary key
CREATE TABLE company(
  id int NOT NULL,
  name int NOT NULL,
  address nvarchar(150) DEFAULT NULL,
  location nvarchar(50) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
);

--Created table for Techstack Table with id as primary key
CREATE TABLE tech_stack (
  id int NOT NULL,
  tech_name varchar(50) NOT NULL,
  image_path nvarchar(500) DEFAULT NULL,
  framework text DEFAULT NULL,
  cur_status char(1) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
);

--Created table for Tech Type with id as primary key
CREATE TABLE tech_type (
  id int NOT NULL,
  type_name varchar(50) NOT NULL,
  cur_status char(1) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
);

--Created table for Make Program with tech_stack_id & tech_type_id as foreign key
CREATE TABLE maker_program(
  id int NOT NULL,
  program_name int NOT NULL,
  program_type varchar(10) DEFAULT NULL,
  program_link text DEFAULT NULL,
  tech_stack_id int DEFAULT NULL,
  tech_type_id int NOT NULL,
  is_program_approved int,
  description nvarchar(500) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  CONSTRAINT FK_maker_program_tech_stack_id FOREIGN KEY (tech_stack_id) REFERENCES tech_stack (id),
  CONSTRAINT FK_maker_program_tech_type_id FOREIGN KEY (tech_type_id) REFERENCES tech_type (id),
  PRIMARY KEY (id)
);

--Created table for Lab Table
CREATE TABLE lab(
  id int NOT NULL,
  name varchar(50) DEFAULT NULL,
  location nvarchar(50) DEFAULT NULL,
  address  nvarchar(255) DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id)
);

--Created table for Mentor with lab_id as foreign key
CREATE TABLE mentor(
  id int NOT NULL,
  name varchar(50) DEFAULT NULL,
  mentor_type varchar(20) DEFAULT NULL,
  lab_id int NOT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  CONSTRAINT FK_mentor_lab_id FOREIGN KEY (lab_id) REFERENCES mentor (id),
  PRIMARY KEY (id)
);

--Created table for Mentor Ideation Ideation Map with mentor_id as foreign key
CREATE TABLE mentor_ideation_map(
  id int NOT NULL,
  mentor_id int NOT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  CONSTRAINT FK_mentor_ideation_map_mentor_id FOREIGN KEY (mentor_id) REFERENCES mentor (id),
  PRIMARY KEY (id)
);

--Created Mentor Tech Stack Table with mentor_id & tech_stack_id as foreign key
CREATE TABLE mentor_techstack(
  id int NOT NULL,
  mentor_id int NOT NULL,
  tech_stack_id int NOT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_mentor_mentor_id FOREIGN KEY (mentor_id) REFERENCES mentor (id),
  CONSTRAINT FK_mentor_tech_stack_id FOREIGN KEY (tech_stack_id) REFERENCES tech_stack (id)
);

--Created Company Requirement Table with candidate_id as foreign key and id as primary key
CREATE TABLE company_requirement(
id int NOT NULL,
company_id int NOT NULL,
candidate_id int NOT NULL,
requested_month varchar(20) NOT NULL,
city varchar(20) DEFAULT NULL,
is_doc_verification int DEFAULT 1,
requirement_doc_path varchar(500) DEFAULT NULL,
no_of_engg int NOT NULL,
tech_stack_id int NOT NULL,
tech_type_id int NOT NULL,
maker_programs_id int NOT NULL,
lead_id int NOT NULL,
ideateion_engg_id int DEFAULT NULL,
buddy_engg_id int  DEFAULT NULL,
special_remark text DEFAULT NULL,
status int DEFAULT 1,
creator_stamp datetime DEFAULT NULL,
creator_user int DEFAULT NULL,
CONSTRAINT FK_candidate_candidate_id FOREIGN KEY (candidate_id) REFERENCES fellowship_candidates (id),
PRIMARY KEY(id)
);

--Created Candidate Tech Stack Assignment Table with requirement_id & candidate_id as foreign key
CREATE TABLE candidate_techstack_assignment(
  id int NOT NULL,
  requirement_id int NOT NULL,
  candidate_id int NOT NULL,
  assign_date datetime DEFAULT NULL,
  status varchar(20) DEFAULT NULL,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  CONSTRAINT FK_candidate_techstack_assignment_requirement_id 
  FOREIGN KEY (requirement_id) REFERENCES company_requirement (id),
  CONSTRAINT FK_candidates_candidate_id FOREIGN KEY (candidate_id)
   REFERENCES fellowship_candidates (id),
  PRIMARY KEY (id)
);

--Create Lab Threshold Table with lab_id as foreign key
CREATE TABLE lab_threshold(
  id int NOT NULL,
  lab_id int NOT NULL,
  lab_capacity nvarchar(50) DEFAULT NULL,
  lead_threshold int DEFAULT NULL,
  ideation_engg_threshold int DEFAULT NULL,
  buddy_engg_threshold int DEFAULT NULL,
  status int DEFAULT 1,
  creator_stamp datetime DEFAULT NULL,
  creator_user int DEFAULT NULL,
  PRIMARY KEY (id),
  --CONSTRAINT FK_lab_lab_id FOREIGN KEY (lab_id) REFERENCES candidate_lead (id)
 );

 --Create User Details Table with email as UNIQUE Key & id as primary key
CREATE TABLE user_details (
  id int NOT NULL,
  email nvarchar(50) NOT NULL,
  UNIQUE(email),
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  password nvarchar(15) NOT NULL,
  contact_number bigint NOT NULL,
  verified bit DEFAULT NULL,
  PRIMARY KEY (id),
  --UNIQUE KEY UK_4d9rdl7d52k8x3etihxlaujvh (email)
);