--Drop Foreign Keys
ALTER TABLE Challengers DROP FOREIGN KEY fk_challenges_challenge_id;
ALTER TABLE Challengers DROP FOREIGN KEY fk_challenges_user_id;
ALTER TABLE Records DROP FOREIGN KEY fk_records_user_id;
ALTER TABLE Goals DROP FOREIGN KEY fk_goals_user_id;

--Drop Tables
DROP TABLE Challengers;
DROP TABLE Challenges;
DROP TABLE Records;
DROP TABLE User;
DROP TABLE Goals;

--  Create Tables
CREATE TABLE Challengers (
    user_Id int NOT NULL,
    challenge_Id int NOT NULL,
    CONSTRAINT Challengers_pk PRIMARY KEY (challenge_Id,user_Id)
);

CREATE TABLE Challenges (
    challenge_Id int NOT NULL AUTO_INCREMENT,
    challenge_name varchar(50) NOT NULL,
    description text NOT NULL,
    challenge_date date NOT NULL,
    CONSTRAINT Challenges_pk PRIMARY KEY (challenge_Id)
);

CREATE TABLE Records (
    run_Id int NOT NULL AUTO_INCREMENT,
    user_Id int NOT NULL,
    miles double NOT NULL,
    run_time double NOT NULL,
    pace double NOT NULL,
    calories_burned double NOT NULL,
    record_date date NOT NULL,
    CONSTRAINT Records_pk PRIMARY KEY (run_Id)
);

CREATE TABLE User (
    user_Id int NOT NULL AUTO_INCREMENT,
    user_fname varchar(50) NOT NULL,
    user_lname varchar(50) NOT NULL,
    DOB date NOT NULL,
    user_weight double NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (user_Id)
);

CREATE TABLE Goals (
    goal_Id int NOT NULL AUTO_INCREMENT,
    user_Id int NOT NULL,
    goal_name varchar(50) NOT NULL,
    description text NOT NULL,
    CONSTRAINT goals_pk PRIMARY KEY (goal_Id)
);


ALTER TABLE Challengers ADD CONSTRAINT fk_challenges_challenge_id FOREIGN KEY Challenges_Challengers (challenge_Id)
    REFERENCES Challenges (challenge_Id);


ALTER TABLE Challengers ADD CONSTRAINT fk_challenges_user_id FOREIGN KEY User_Challengers (user_Id)
    REFERENCES User(user_Id);


ALTER TABLE Records ADD CONSTRAINT fk_records_user_id FOREIGN KEY User_Records (user_Id)
    REFERENCES User (user_Id);


ALTER TABLE Goals ADD CONSTRAINT fk_goals_user_id FOREIGN KEY goals_User (user_Id)
    REFERENCES User (user_Id);

--Populate User
Insert into User(user_fname, user_lname, DOB, user_weight) values ('Aayush', 'Dhakal', '1999-06-26', 157);
Insert into User(user_fname, user_lname, DOB, user_weight) values ('John', 'Wick', '1978-03-22', 170);
Insert into User(user_fname, user_lname, DOB, user_weight) values ('Bruce', 'Wayne', '1968-01-01', 195);
Insert into User(user_fname, user_lname, DOB, user_weight) values ('Steven', 'Strange', '1970-07-09', 160);
INSERT INTO User(user_fname, user_lname, DOB, user_weight) VALUES("Samrajya", "Thapa", "1998-05-11", 169);
INSERT INTO User(user_fname, user_lname, DOB, user_weight) VALUES("Leo", "Dicap", "1958-02-13", 172);
INSERT INTO User(user_fname, user_lname, DOB, user_weight) VALUES("Spider", "Man", "1998-05-11", 202);
INSERT INTO User(user_fname, user_lname, DOB, user_weight) VALUES("Iron", "Man", "1889-05-11", 185);

--Populate Challenges
Insert into Challenges(challenge_name, description, challenge_date) values('Weekend Run', 'Run 5 miles in the weekend', '2021-04-03');
Insert into Challenges(challenge_name, description, challenge_date) values('April Runner', 'Run 25 miles in the month of April', '2021-04-30');
Insert into Challenges(challenge_name, description, challenge_date) values('The Flash', 'Run a mile in less than 8 minutes', '2021-04-16');
Insert into Challenges(challenge_name, description, challenge_date) values('The Inspiration Point', 'Loose 5 pounds by the end of May', '2021-05-31');
Insert into Challenges(challenge_name, description, challenge_date) values('Leg Day Everyday', 'Hit leg day atleast twice every week in May', '2021-05-31');


--Populate Goals
Insert into Goals(user_Id, goal_name, description) values((Select user_Id from User where user_fname = 'Aayush' and user_lname = 'Dhakal'), 'Weight Loss', 'Loose 5 pounds before graduation');
Insert into Goals(user_Id, goal_name, description) values((Select user_Id from User where user_fname = 'Aayush' and user_lname = 'Dhakal'), 'Stamina Training', 'Be able to run 4 miles before end of June');
Insert into Goals(user_Id, goal_name, description) values((Select user_Id from User where user_fname = 'John' and user_lname = 'Wick'), 'Weight Loss', 'Loose 10 pounds before 2022');
Insert into Goals(user_Id, goal_name, description) values((Select user_Id from User where user_fname = 'Bruce' and user_lname = 'Wayne'), 'Muscle Gain', 'Gain 5 pounds muscle by April 2022');
Insert into Goals(user_Id, goal_name, description) values((Select user_Id from User where user_fname = 'Bruce' and user_lname = 'Wayne'), 'Strength Gain', 'Deadlift 450 by October 2021');
Insert into Goals(user_Id, goal_name, description) values((Select user_Id from User where user_fname = 'Bruce' and user_lname = 'Wayne'), 'Hiker Training', 'Hike atleast once every two weeks');


--Populate Challengers
Insert into Challengers values((Select user_Id from User where user_fname = 'Aayush' and user_lname = 'Dhakal'), (Select challenge_id from Challenges where challenge_name = 'The Flash'));
Insert into Challengers values((Select user_Id from User where user_fname = 'Aayush' and user_lname = 'Dhakal'), (Select challenge_id from Challenges where challenge_name = 'The Inspiration Point'));
Insert into Challengers values((Select user_Id from User where user_fname = 'Steven' and user_lname = 'Strange'), (Select challenge_id from Challenges where challenge_name = 'The Flash'));
Insert into Challengers values((Select user_Id from User where user_fname = 'Steven' and user_lname = 'Strange'), (Select challenge_id from Challenges where challenge_name = 'April Runner'));
Insert into Challengers values((Select user_Id from User where user_fname = 'Steven' and user_lname = 'Strange'), (Select challenge_id from Challenges where challenge_name = 'Weekend Run'));
Insert into Challengers values((Select user_Id from User where user_fname = 'John' and user_lname = 'Wick'), (Select challenge_id from Challenges where challenge_name = 'April Runner'));
Insert into Challengers values((Select user_Id from User where user_fname = 'Samrajya' and user_lname = 'Thapa'), (Select challenge_id from Challenges where challenge_name = 'Leg Day Everyday'));
Insert into Challengers values((Select user_Id from User where user_fname = 'Samrajya' and user_lname = 'Thapa'), (Select challenge_id from Challenges where challenge_name = 'The Flash'));
Insert into Challengers values((Select user_Id from User where user_fname = 'Aayush' and user_lname = 'Dhakal'), (Select challenge_id from Challenges where challenge_name = 'April Runner'));
Insert into Challengers values((Select user_Id from User where user_fname = 'Iron' and user_lname = 'Man'), (Select challenge_id from Challenges where challenge_name = 'Weekend Run'));


--Populate Records
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "Samrajya" AND user_lname = "Thapa"), 2, 14, run_time/miles, 200, "2021-03-30");
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "Samrajya" AND user_lname = "Thapa"), 3, 24, run_time/miles, 300, "2021-04-01");
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "Samrajya" AND user_lname = "Thapa"), 1, 6.35, run_time/miles, 120, "2021-04-09");
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "Samrajya" AND user_lname = "Thapa"), 2, 13.6, run_time/miles , 230, "2021-04-15");
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "Aayush" AND user_lname = "Dhakal"), 1, 7, run_time/miles , 100, "2021-04-15");
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "Aayush" AND user_lname = "Dhakal"), 2, 15, run_time/miles , 230, "2021-04-18");
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "Aayush" AND user_lname = "Dhakal"), 1, 8, run_time/miles , 90, "2021-04-20");
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "Aayush" AND user_lname = "Dhakal"), 2, 14.5, run_time/miles , 250, "2021-04-25");
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "John" AND user_lname = "Wick"), 1, 6, run_time/miles , 120, "2021-04-25");
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "John" AND user_lname = "Wick"), 1, 5.4, run_time/miles , 120, "2021-04-29");
INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "John" AND user_lname = "Wick"), 2, 13, run_time/miles , 240, "2021-04-30");


--Query 1 (Sam):
SELECT user_Id, user_fname, user_lname, (SELECT ROUND(AVG(pace), 2)) AS avg_pace
  FROM User NATURAL JOIN Records
  GROUP BY user_Id
  ORDER BY user_Id;

--Query 2 (Aayush)
Select challenge_Id, challenge_name, description from Challenges natural join Challengers where Challengers.user_Id = (SELECT user_id from User where user_fname='Aayush' and user_lname='Dhakal');

--Query 3 (Sam):
SELECT challenge_Id, challenge_name, COUNT(user_Id) AS count_users, (SELECT ROUND(AVG(user_weight), 2)) as avg_weight, MAX(user_weight) AS max_weight, MIN(user_weight) AS min_weight
  FROM Challengers NATURAL JOIN User natural join Challenges
  GROUP BY challenge_Id, challenge_name
  ORDER BY challenge_Id;

--Query 3 (Aayush)
Select concat(user_fname, " ", user_lname) as `User Name`, GROUP_CONCAT(goal_name) as Goals from User natural join Goals group by user_fname, user_lname;
