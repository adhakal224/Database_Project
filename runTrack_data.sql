
INSERT INTO User(user_fname, user_lname, DOB, user_weight) VALUES("Samrajya", "Thapa", "1998-05-11", 169);
INSERT INTO User(user_fname, user_lname, DOB, user_weight) VALUES("Leo", "Dicap", "1958-02-13", 172);
INSERT INTO User(user_fname, user_lname, DOB, user_weight) VALUES("Spider", "Man", "1998-05-11", 202);
INSERT INTO User(user_fname, user_lname, DOB, user_weight) VALUES("Iron", "Man", "1889-05-11", 185);


INSERT INTO Records(user_Id, miles, run_time, pace, calories_burned, record_date)
  VALUES((SELECT user_Id FROM User WHERE user_fname = "Samrajya" AND user_lname = "Thapa"), 2, 14, run_time / miles, 200, "2021-03-30");
