SQL> -- ===========================
SQL> -- 1?? CATEGORY TABLE
SQL> -- ===========================
SQL> CREATE TABLE Category (
  2      category_id     NUMBER PRIMARY KEY,
  3      category_name   VARCHAR2(50) NOT NULL,
  4      category_desc   VARCHAR2(200)
  5  );

Table created.

SQL> 
SQL> -- ===========================
SQL> -- 2?? USERS TABLE
SQL> -- ===========================
SQL> CREATE TABLE Users (
  2      user_id           NUMBER PRIMARY KEY,
  3      user_name         VARCHAR2(50) NOT NULL,
  4      password          VARCHAR2(100) NOT NULL,
  5      user_phoneNum     VARCHAR2(20),
  6      user_role         VARCHAR2(30),
  7      user_email        VARCHAR2(100),
  8      user_department   VARCHAR2(50)
  9  );

Table created.

SQL> 
SQL> -- ===========================
SQL> -- 3?? SPACE_POLICY TABLE
SQL> -- ===========================
SQL> CREATE TABLE SpacePolicy (
  2      space_policy_id   NUMBER PRIMARY KEY,
  3      usage_period      VARCHAR2(50),
  4      space_booking     VARCHAR2(50),
  5      shared_space      VARCHAR2(50),
  6      suitability_space VARCHAR2(50),
  7      available_space   VARCHAR2(50)
  8  );

Table created.

SQL> 
SQL> -- ===========================
SQL> -- 4?? SPACE TABLE
SQL> -- ===========================
SQL> CREATE TABLE Space (
  2      space_id        NUMBER PRIMARY KEY,
  3      category_id     NUMBER NOT NULL,
  4      space_policy_id NUMBER,
  5      space_name      VARCHAR2(50),
  6      space_code      VARCHAR2(20),
  7      space_capacity  NUMBER,
  8      space_price     NUMBER(8,2),
  9      space_image     VARCHAR2(255),
 10      CONSTRAINT fk_space_category
 11          FOREIGN KEY (category_id)
 12          REFERENCES Category(category_id),
 13      CONSTRAINT fk_space_policy
 14          FOREIGN KEY (space_policy_id)
 15          REFERENCES SpacePolicy(space_policy_id)
 16  );

Table created.

SQL> 
SQL> -- ===========================
SQL> -- 5?? TECHNICIAN TABLE
SQL> -- ===========================
SQL> CREATE TABLE Technician (
  2      technician_id   NUMBER PRIMARY KEY,
  3      user_id         NUMBER,
  4      reservation_id  NUMBER,
  5      assigned_date   DATE,
  6      active_status   VARCHAR2(30),
  7      CONSTRAINT fk_tech_user
  8          FOREIGN KEY (user_id)
  9          REFERENCES Users(user_id)
 10  );

Table created.

SQL> 
SQL> -- ===========================
SQL> -- 6?? SCHEDULE TABLE
SQL> -- ===========================
SQL> CREATE TABLE Schedule (
  2      schedule_id     NUMBER PRIMARY KEY,
  3      space_id        NUMBER,
  4      day_ofWeek      VARCHAR2(20),
  5      space_openTime  DATE,
  6      space_closeTime DATE,
  7      space_duration  NUMBER,
  8      CONSTRAINT fk_schedule_space
  9          FOREIGN KEY (space_id)
 10          REFERENCES Space(space_id)
 11  );

Table created.

SQL> 
SQL> -- ===========================
SQL> -- 7?? RESERVATION TABLE
SQL> -- ===========================
SQL> CREATE TABLE Reservation (
  2      reservation_id       NUMBER PRIMARY KEY,
  3      space_id             NUMBER,
  4      user_id              NUMBER,
  5      reservation_date     DATE,
  6      reservation_startTime DATE,
  7      reservation_endTime   DATE,
  8      reservation_status   VARCHAR2(30),
  9      CONSTRAINT fk_res_space
 10          FOREIGN KEY (space_id)
 11          REFERENCES Space(space_id),
 12      CONSTRAINT fk_res_user
 13          FOREIGN KEY (user_id)
 14          REFERENCES Users(user_id)
 15  );

Table created.

SQL> 
SQL> -- ===========================
SQL> -- 8?? INVOICE TABLE
SQL> -- ===========================
SQL> CREATE TABLE Invoice (
  2      invoice_id      NUMBER PRIMARY KEY,
  3      reservation_id  NUMBER,
  4      user_id         NUMBER,
  5      amount_due      NUMBER(8,2),
  6      discount_applied NUMBER(8,2),
  7      final_amount    NUMBER(8,2),
  8      invoice_date    DATE,
  9      CONSTRAINT fk_invoice_res
 10          FOREIGN KEY (reservation_id)
 11          REFERENCES Reservation(reservation_id),
 12      CONSTRAINT fk_invoice_user
 13          FOREIGN KEY (user_id)
 14          REFERENCES Users(user_id)
 15  );

Table created.

SQL> 
SQL> -- ===========================
SQL> -- 9?? PAYMENT TABLE
SQL> -- ===========================
SQL> CREATE TABLE Payment (
  2      payment_id     NUMBER PRIMARY KEY,
  3      invoice_id     NUMBER,
  4      payment_method VARCHAR2(30),
  5      payment_status VARCHAR2(30),
  6      payment_date   DATE,
  7      CONSTRAINT fk_payment_invoice
  8          FOREIGN KEY (invoice_id)
  9          REFERENCES Invoice(invoice_id)
 10  );

Table created.

SQL> 
SQL> -- ===========================
SQL> -- ?? REPORT TABLE
SQL> -- ===========================
SQL> CREATE TABLE Report (
  2      report_id      NUMBER PRIMARY KEY,
  3      user_id        NUMBER,
  4      report_start   DATE,
  5      report_end     DATE,
  6      department     VARCHAR2(50),
  7      date_created   DATE,
  8      CONSTRAINT fk_report_user
  9          FOREIGN KEY (user_id)
 10          REFERENCES Users(user_id)
 11  );

Table created.

SQL> 
SQL> -- ===========================
SQL> -- ? ALL TABLES CREATED
SQL> -- ===========================
SQL> 
SQL> 
SQL> 
SQL> 
SQL> SEELCT table_name FROM user_tables
SP2-0734: unknown command beginning "SEELCT tab..." - rest of line ignored.
SQL> SELECT *
  2  
SQL> SELECT *;
SELECT *
       *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT TABLE_NAME FROM USER_TABLES;

TABLE_NAME                                                                      
------------------------------                                                  
DEPT                                                                            
EMP                                                                             
DEMO_USERS                                                                      
DEMO_CUSTOMERS                                                                  
DEMO_ORDERS                                                                     
DEMO_PRODUCT_INFO                                                               
DEMO_ORDER_ITEMS                                                                
DEMO_STATES                                                                     
APEX$_ACL                                                                       
APEX$_WS_WEBPG_SECTIONS                                                         
APEX$_WS_ROWS                                                                   

TABLE_NAME                                                                      
------------------------------                                                  
APEX$_WS_HISTORY                                                                
APEX$_WS_NOTES                                                                  
APEX$_WS_LINKS                                                                  
APEX$_WS_TAGS                                                                   
APEX$_WS_FILES                                                                  
APEX$_WS_WEBPG_SECTION_HISTORY                                                  
CATEGORY                                                                        
USERS                                                                           
SPACEPOLICY                                                                     
SPACE                                                                           
TECHNICIAN                                                                      

TABLE_NAME                                                                      
------------------------------                                                  
SCHEDULE                                                                        
RESERVATION                                                                     
INVOICE                                                                         
PAYMENT                                                                         
REPORT                                                                          

27 rows selected.

SQL> spool off
