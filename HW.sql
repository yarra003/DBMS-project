 Yara Al Khatib
-- each table and all the insert commands can be collapsed and hidden 
-- if the code is run all at once it create, alter, insert, update, delete, select, and lastly drops the table
-- and will result in 3 errors which are from droping a table then trying to drop it once again 

-- user table ✔✔
    create table YT_user(
        user_id int primary key,
        user_name varchar(100) not null,
        user_password varchar(20) not null,
        --email varChar(100) ,
        picture varchar(255)
        );
        -- alter code  ✔✔
            Alter Table YT_user Add email varChar(100);
            alter table yt_user modify user_password varchar(50);
            alter table yt_user add age int;
            alter table yt_user modify age not null; 
            desc YT_user;
            alter table yt_user drop (age); 
            desc YT_user;

    -- drop table YT_user;
    --insert code  ✔✔
        INSERT INTO YT_user (user_id, user_name, user_password, email, picture) VALUES
            (1, 'Jane Doe', 'p@ssw0rd', 'jane.doe@gmail.com', 'https://example.com/jane-doe.jpg');
        INSERT INTO YT_user (user_id, user_name, user_password, email, picture) VALUES
            (2, 'John Doe', 's3cr3t', 'john.doe@gmail.com', 'https://example.com/john-doe.jpg');
        INSERT INTO YT_user (user_id, user_name, user_password, email, picture) VALUES
            (3, 'Jane Smith', 'j@n3_smith', 'jane.smith@gmail.com', 'https://example.com/jane-smith.jpg');
        INSERT INTO YT_user (user_id, user_name, user_password, email, picture) VALUES
            (4, 'Bob Johnson', 'b0b_j0hn$0n', 'bob.johnson@gmail.com', 'https://example.com/bob-johnson.jpg');
        INSERT INTO YT_user (user_id, user_name, user_password, email, picture) VALUES
            (5, 'Alice Smith', 'a1ic3_Sm!th', 'alice.smith@gmail.com', 'https://example.com/alice-smith.jpg');
        INSERT INTO YT_user (user_id, user_name, user_password, email, picture) VALUES
            (6, 'John Smith', 'j0hn_$m!th', 'john.smith@gmail.com', 'https://example.com/john-smith.jpg');
        INSERT INTO YT_user (user_id, user_name, user_password, email, picture) VALUES
            (7, 'Samantha Williams', '$@m@nth@_w!11!@m$', 'samantha.williams@gmail.com', 'https://example.com/samantha-williams.jpg');
        INSERT INTO YT_user (user_id, user_name, user_password, email, picture) VALUES
            (8, 'Chris Brown', 'chr!$_br0wn', 'chris.brown@gmail.com', 'https://example.com/chris-brown.jpg');

    ------------------------------------------------------------------


-- user-phonenumber table ✔✔
    create table user_phone(
        user_id int,
        phone_num varCHar(14),
        foreign key (user_id) references YT_user(user_id),
        primary key (user_id,phone_num)
        );
    -- drop table user_phone;
    -- alter code  ✔✔
        alter table user_phone add channel_name varchar(100);
        alter table user_phone modify phone_num varchar(20);
        alter table user_phone drop (channel_name);
        desc user_phone;
    --insert code ✔✔
        INSERT INTO user_phone (user_id, phone_num) VALUES
          (1, '555-555-5555');
        INSERT INTO user_phone (user_id, phone_num) VALUES
          (2, '222-222-2222');
        INSERT INTO user_phone (user_id, phone_num) VALUES
          (3, '333-333-3333');
        INSERT INTO user_phone (user_id, phone_num) VALUES
          (4, '444-444-4444');
        INSERT INTO user_phone (user_id, phone_num) VALUES
          (5, '555-555-5555');
        INSERT INTO user_phone (user_id, phone_num) VALUES
          (6, '666-666-6666');
        INSERT INTO user_phone (user_id, phone_num) VALUES
          (7, '777-777-7777');
        INSERT INTO user_phone (user_id, phone_num) VALUES
          (8, '888-888-8888');
        
    ------------------------------------------------------------------

-- login-history table 
    create table login_history(
        login_id int primary key,
        time_of_login varchar(100),
        device_ip varchar(60),
        --browser varchar(55),
        user_login_id int,
        foreign key (user_login_id) references YT_user(user_id)
        );
        -- alter code  ✔✔
            alter table login_history add browser_used varchar(55);
            ALTER TABLE login_history RENAME COLUMN browser_used TO browser;
            desc login_history;
    -- drop table login_history;
    -- insert code 
        INSERT INTO login_history (login_id, time_of_login, device_ip, browser, user_login_id) VALUES
          (1, '2022-12-14 12:00:00', '192.168.1.1', 'Chrome', 1);
        INSERT INTO login_history (login_id, time_of_login, device_ip, browser, user_login_id) VALUES
          (2, '2022-12-14 12:15:00', '192.168.1.2', 'Firefox', 2);
        INSERT INTO login_history (login_id, time_of_login, device_ip, browser, user_login_id) VALUES
          (3, '2022-12-14 12:30:00', '192.168.1.3', 'Safari', 3);
        INSERT INTO login_history (login_id, time_of_login, device_ip, browser, user_login_id) VALUES
          (4, '2022-12-14 12:45:00', '192.168.1.4', 'Chrome', 4);
        INSERT INTO login_history (login_id, time_of_login, device_ip, browser, user_login_id) VALUES
          (5, '2022-12-14 13:00:00', '192.168.1.5', 'Firefox', 5);
        INSERT INTO login_history (login_id, time_of_login, device_ip, browser, user_login_id) VALUES
          (6, '2022-12-14 13:15:00', '192.168.1.6', 'Safari', 6);
        INSERT INTO login_history (login_id, time_of_login, device_ip, browser, user_login_id) VALUES
          (7, '2022-12-14 13:30:00', '192.168.1.7', 'Chrome', 7);
        INSERT INTO login_history (login_id, time_of_login, device_ip, browser, user_login_id)
        SELECT 8, TO_CHAR(SYSDATE, 'DD/MM/YY HH24:MI'), '192.168.1.8', 'Firefox', 8
        FROM dual;

    ------------------------------------------------------------------
    ------------------------------------------------------------------
    
-- channel table
    create table channel (
        channel_id int primary key,
        channel_name varchar(100),
        picture varchar(255),
        num_subs int,
        --num_vidoes int,
        user_id int,
        foreign key (user_id) references YT_user(user_id)
        );
    --alter table
        alter table channel add num_vidoes int;
        desc channel;
    -- drop table channel;
    -- insert code 
        INSERT INTO channel (channel_id, channel_name, picture, num_subs, num_vidoes, user_id) VALUES
          (1, 'Jane Doe Channel', 'https://example.com/jane-doe-channel.jpg', 100, 20, 1);
        INSERT INTO channel (channel_id, channel_name, picture, num_subs, num_vidoes, user_id) VALUES
          (2, 'John Doe Channel', 'https://example.com/john-doe-channel.jpg', 200, 30, 2);
        INSERT INTO channel (channel_id, channel_name, picture, num_subs, num_vidoes, user_id) VALUES
          (3, 'Jane Smith Channel', 'https://example.com/jane-smith-channel.jpg', 300, 40, 3);
        INSERT INTO channel (channel_id, channel_name, picture, num_subs, num_vidoes, user_id) VALUES
          (4, 'Bob Johnson Channel', 'https://example.com/bob-johnson-channel.jpg', 400, 50, 4);
        INSERT INTO channel (channel_id, channel_name, picture, num_subs, num_vidoes, user_id) VALUES
          (5, 'Alice Smith Channel', 'https://example.com/alice-smith-channel.jpg', 500, 60, 5);
        INSERT INTO channel (channel_id, channel_name, picture, num_subs, num_vidoes, user_id) VALUES
          (6, 'John Smith Channel', 'https://example.com/john-smith-channel.jpg', 600, 70, 6);
        INSERT INTO channel (channel_id, channel_name, picture, num_subs, num_vidoes, user_id) VALUES
          (7, 'Samantha Williams Channel', 'https://example.com/samantha-williams-channel.jpg', 700, 80, 7);
        INSERT INTO channel (channel_id, channel_name, picture, num_subs, num_vidoes, user_id) VALUES
          (8, 'Chris Brown Channel', 'https://example.com/chris-brown-channel.jpg', 800, 90, 8);

    ------------------------------------------------------------------
    ------------------------------------------------------------------
    
-- channel-subscribe table 
    create table channel_subscribe(
        channel_id int,
        channel_subscribed int,
        primary key(channel_id , channel_subscribed),
        foreign key (channel_subscribed) references channel(channel_id),
        foreign key (channel_id) references channel(channel_id)
        );
    -- drop table channel_subscribe;
    --insert code 
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (1, 2);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (2, 3);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (3, 1);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (2, 1);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (4, 5);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (5, 6);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (6, 4);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (5, 4);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (7, 8);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (8, 4);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (4, 7);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (8, 7);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (6, 8);
        INSERT INTO channel_subscribe (channel_id, channel_subscribed) VALUES
          (8, 6);


    ------------------------------------------------------------------
    ------------------------------------------------------------------

-- video table
    create table video(
        video_id int primary key,
        title varchar(255),
        V_duration int,
        content varchar(255),
        date_of_release varChar(255),
        channel_id int,
        foreign key (channel_id) references channel(channel_id)
        );
    -- drop table video;
    --insert code 
        INSERT INTO video (video_id, title, V_duration, content, date_of_release, channel_id) VALUES
          (1, 'My First Video', 120, 'https://example.com/my-first-video.mp4', '2022-12-14', 1);
        INSERT INTO video (video_id, title, V_duration, content, date_of_release, channel_id) VALUES
          (2, 'My Second Video', 180, 'https://example.com/my-second-video.mp4', '2022-12-14', 2);
        INSERT INTO video (video_id, title, V_duration, content, date_of_release, channel_id) VALUES
          (3, 'My Third Video', 240, 'https://example.com/my-third-video.mp4', '2022-12-14', 3);
        INSERT INTO video (video_id, title, V_duration, content, date_of_release, channel_id) VALUES
          (4, 'My Fourth Video', 300, 'https://example.com/my-fourth-video.mp4', '2022-12-14', 4);
        INSERT INTO video (video_id, title, V_duration, content, date_of_release, channel_id) VALUES
          (5, 'My Fifth Video', 360, 'https://example.com/my-fifth-video.mp4', '2022-12-14', 5);
        INSERT INTO video (video_id, title, V_duration, content, date_of_release, channel_id) VALUES
          (6, 'My Sixth Video', 420, 'https://example.com/my-sixth-video.mp4', '2022-12-14', 6);
        INSERT INTO video (video_id, title, V_duration, content, date_of_release, channel_id) VALUES
          (7, 'My Seventh Video', 480, 'https://example.com/my-seventh-video.mp4', '2022-12-14', 7);
        INSERT INTO video (video_id, title, V_duration, content, date_of_release, channel_id) VALUES
          (8, 'My Eighth Video', 540, 'https://example.com/my-eighth-video.mp4', '2022-12-14', 8);
    ------------------------------------------------------------------
    ------------------------------------------------------------------

-- video-view table
    create table video_watched_by(
        video_id int,
        user_id int ,
        time_of_watching varchar(255),
        foreign key (user_id) references YT_user(user_id),
        foreign key (video_id) references video(video_id),
        primary key (video_id , user_id,time_of_watching)
        );
    -- drop table video_watched_by;
    --insert code
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (1, 1, '2022-12-14 12:00:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (1, 2, '2022-12-14 12:00:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (1, 3, '2022-12-14 12:00:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (1, 1, '2022-12-14 13:00:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (2, 2, '2022-12-14 12:15:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (3, 3, '2022-12-14 12:30:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (4, 1, '2022-12-14 12:00:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (5, 2, '2022-12-14 13:00:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (6, 3, '2022-12-14 12:15:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (7, 4, '2022-12-14 12:30:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (8, 5, '2022-12-14 12:00:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (4, 6, '2022-12-14 13:00:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (5, 7, '2022-12-14 12:15:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (6, 8, '2022-12-14 12:30:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (7, 1, '2022-12-14 12:00:00');
        INSERT INTO video_watched_by (video_id, user_id, time_of_watching) VALUES
          (8, 2, '2022-12-14 13:00:00');


    ------------------------------------------------------------------
    ------------------------------------------------------------------

-- video-like table
    create table video_likes(
        video_id int ,
        channel_id int ,
        foreign key (video_id) references video(video_id),
        foreign key (channel_id) references channel(channel_id),
        primary key (video_id ,channel_id)
        );
    -- drop table video_likes;
    --insert code 
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (1, 1);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (2, 2);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (3, 3);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (4, 4);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (5, 5);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (6, 6);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (7, 7);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (8, 8);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (1, 2);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (2, 3);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (3, 4);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (4, 5);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (5, 6);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (6, 7);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (7, 8);
        INSERT INTO video_likes (video_id, channel_id) VALUES
          (8, 1);
    ------------------------------------------------------------------
    ------------------------------------------------------------------

-- comment table
    create table ccomment(
        comment_id int primary key,
        channel_id int,
        foreign key (channel_id) references channel(channel_id),
        content varchar(1000)
        );
    -- drop table ccomment;
    --insert code 
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (1, 1,'Great video!');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (2, 2, 'I love this channel!');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (3, 1, 'Interesting content, thanks for sharing!');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (4, 3, 'I just subscribed, keep up the good work!');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (5, 2, 'I learned so much from this video!');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (6, 1, 'Fantastic video, I really enjoyed it!');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (7, 3, 'I have a question about the topic you covered.');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (8, 2, 'Can you please make more videos like this?');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (9, 1, 'I love the way you explain things!');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (10, 3, 'Your videos always make me think.');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (11, 2, 'Keep up the great work, I really appreciate it!');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (12, 1, 'I have been following your channel for a while now, and I always look forward to your new videos.');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (13, 3, 'Thank you for sharing your knowledge and expertise!');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (14, 2, 'I have learned so much from your videos, thank you for sharing!');
        INSERT INTO ccomment (comment_id,channel_id, content) VALUES
          (15, 1, 'I just wanted to say that your videos are always well-researched and well-presented. Keep up the great work!');
        --------------------------------------------------------------------------------------------------------------------------------------

--coment-video table
    create table comment_video (
        video_id int , 
        comment_id int ,
        primary key (video_id, comment_id),
        foreign key (comment_id) references ccomment(comment_id),
        foreign key (video_id) references video(video_id)
    );
    -- drop table comment_video;
    -- insert code
        insert into comment_video (video_id, comment_id) values (1,1);
        INSERT INTO comment_video (video_id, comment_id) VALUES (2, 2);
        INSERT INTO comment_video (video_id, comment_id) VALUES (3, 3);
        INSERT INTO comment_video (video_id, comment_id) VALUES (4, 4);
        INSERT INTO comment_video (video_id, comment_id) VALUES (5, 5);
        INSERT INTO comment_video (video_id, comment_id) VALUES (6, 6);
        INSERT INTO comment_video (video_id, comment_id) VALUES (7, 7);
        INSERT INTO comment_video (video_id, comment_id) VALUES (8, 8);
        INSERT INTO comment_video (video_id, comment_id) VALUES (1, 9);
        INSERT INTO comment_video (video_id, comment_id) VALUES (2, 10);
        INSERT INTO comment_video (video_id, comment_id) VALUES (3, 11);
        INSERT INTO comment_video (video_id, comment_id) VALUES (4, 12);
        INSERT INTO comment_video (video_id, comment_id) VALUES (5, 13);
        INSERT INTO comment_video (video_id, comment_id) VALUES (6, 14);
        INSERT INTO comment_video (video_id, comment_id) VALUES (7, 15);
    ----------------------------------------------------------------------
    ----------------------------------------------------------------------
 
-- select and update statements 
    -- for the first taable 
        select user_id ID,user_name Name from yt_user;
        select user_name from yt_user where user_id in (select user_id from channel where num_subs > 200 );
        select yt_user.user_id ID, channel.channel_name channel , channel.num_subs Number_of_subscribe from yt_user inner join channel on yt_user.user_id=channel.user_id; 
        select * from Yt_user;
        update yt_user set user_name = 'Mike kineth' where user_id = (select user_id from user_phone where phone_num like '22%');
        update yt_user set email = 'userousb@hotmail.org' where user_id in (Select user_id from channel where num_subs >= 750);
        update yt_user set user_password = 'new_password' where user_id = 1;
        update yt_user set email = 'johnsmith@gmail.com' where user_id = (select user_id from user_phone where phone_num like '222%');
        update yt_user set email = 'samantha.williams@outlook.com' where user_id in (Select user_id from channel where num_subs >= 800);

    -- for the second table
        select user_phone.user_id ID from user_phone;
        select all user_id, phone_num as ID from user_phone where user_id in(select user_id from channel where num_vidoes >= 3);
        select * from user_phone;
        update user_phone set phone_num = '555-555-1234' where user_id = 2;
        update user_phone set phone_num = '444-444-4444' where user_id in (Select user_id from yt_user where email like '%gmail.com');
        update user_phone set phone_num = '222-222-2222' where user_id = (select user_id from yt_user where user_name = 'Jane Smith');
        update user_phone set phone_num = '333-333-3333' where user_id = 4;
        update user_phone set phone_num = '111-111-1111' where user_id = (select user_id from yt_user where user_name = 'Samantha Williams');

    -- for the third table 
        select * from login_history;
        update login_history set browser = 'Chrome' where login_id  = 2;
        update login_history set TIME_OF_LOGIN = '2012-11-14 1:35:60' where login_id <= 3;
        update login_history set DEVICE_IP = 'fe80::a00:20ff:feb9:4c54/10' where login_id in (select max(login_id) from login_history ) ;

    -- for the forth table
        select * from channel;
        update channel set NUM_subs = (select dbms_random.value(1 , 1000000) from dual) where CHANNEL_ID in (3,2,1);
        update channel set num_vidoes= (select dbms_random.value(1,50) from dual) where channel_name= (select channel_name from channel where channel_name like 'Alice%');
        update channel set num_subs= 620 where num_subs<1000 and num_vidoes>=90;
    -- for the fifth table
        select channel.channel_name ,channel_subscribe.CHANNEL_SUBSCRIBED from channel_subscribe
        inner join channel on channel.channel_id = channel_subscribe.channel_id;
        SELECT c1.channel_id, c2.channel_id FROM channel_subscribe c1
        JOIN channel_subscribe c2 ON c1.channel_subscribed = c2.channel_id WHERE c1.channel_id = c2.channel_subscribed;
        select * from channel_subscribe;
        update channel_subscribe set channel_subscribed=500 where channel_id=1;

        
    -- for the sixih table 
        select channel_id, title , (v_duration / 60 ) as in_minutes from video; 
        select  video.title , channel.channel_name , yt_user.user_name username , channel.num_subs from video
        inner join channel on channel.channel_id = video.channel_id
        inner join yt_user on yt_user.user_id = channel.user_id ;
        select video.title , video.date_of_release , video.V_duration , channel.channel_name,channel.num_subs from video
        inner join channel on channel.channel_id = video.channel_id where channel.num_subs >= 400;
        select * from video;
        update video set title='My last video' where title='My Eighth Video';
        update video set title='My favorite video' where date_of_release='2022-12-14'and CHANNEL_ID=2 ;
        --date_of_release

    -- for seventh table
        select channel_name from channel where channel_id 
        in (select channel_id from channel where user_id 
        in (select user_id from video_watched_by where video_id = 1) );
        select * from video_watched_by;
    -- for eighth table
        select * from video_likes;
    -- for ninth table
        select * from ccomment;
        update ccomment set content='I have learned so much from your videos, thank you for sharing! UPDATE: i passed all my exams!! amazing channel' where content='I have learned so much from your videos, thank you for sharing!';
        update ccomment set content='    ' where content=(select content from ccomment where content like '%expertise%');
    -- for the last table
        select * from comment_video ;

--for delete from channel table use the whole code in this block  
    drop table comment_video;
    drop table ccomment;
    drop table video_likes;
    drop table video_watched_by;
    drop table video;
    drop table channel_subscribe;
    
    select * from channel;
    delete from channel where user_id in (select user_id from yt_user where  LENGTH(user_password) < 12 );
    select * from channel;

    select * from channel;
    delete from channel where num_subs < 500;
    select * from channel;


-- drop tables code
    drop table comment_video;
    drop table ccomment;
    drop table video_likes;
    drop table video_watched_by;
    drop table video;
    drop table channel_subscribe;
    drop table channel;
    drop table login_history;
    drop table user_phone;
    drop table yt_user;
--update yt_user set user_password = 'hello b(8^3' where user_id = 7;
