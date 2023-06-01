-- noinspection SqlDialectInspectionForFile

-- noinspection SqlNoDataSourceInspectionForFile

CREATE Database bilibili
CREATE TABLE UpInfo (
    UpID INT PRIMARY KEY,
    Gender NVARCHAR(10),
    UpName NVARCHAR(50),
    Birthday DATE,
    Region NVARCHAR(50),
    Certification NVARCHAR(50)
);
    

CREATE TABLE VideoInfo (
    VideoID INT PRIMARY KEY,
    Title NVARCHAR(100),
    UploadTime DATETIME,
    PlayCount INT,
    DanmakuCount INT,
    LikeCount INT,
    FavoriteCount INT,
    ShareCount INT,
    CoinCount INT,
    CommentCount INT,
    UpID INT,
    CONSTRAINT FK_UpID FOREIGN KEY (UpID) REFERENCES UpInfo(UpID),
    CONSTRAINT IX_UpID_VideoID UNIQUE (UpID, VideoID)
);


CREATE TABLE FansInfo (
    FansID INT PRIMARY KEY,
    Nickname NVARCHAR(50),
    Gender NVARCHAR(10),
    Region NVARCHAR(50),
    FollowTime DATETIME,
    FansLevel INT,
    LevelExperience INT,
    UpID INT,

    CONSTRAINT IX_UpID_FansID UNIQUE (UpID, FansID)
);

CREATE TABLE CommentInfo (
    CommentID INT IDENTITY(1,1) PRIMARY KEY,
    CommentContent NVARCHAR(MAX),
    CommentTime DATETIME,
    CommenterID INT,
    CommenterName NVARCHAR(50),
    Likes INT,
    UpID INT,
    VideoID INT,
    CreateTime DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_VideoID FOREIGN KEY (VideoID) REFERENCES VideoInfo(VideoID)
);

CREATE INDEX IX_UpID_VideoID ON CommentInfo (UpID, VideoID);
CREATE TABLE column(
  author_id int,
  author_username varchar(255),
  category varchar(255),
  upload_time datetime,
  post_id int PRIMARY KEY,
  post_title varchar(255),
  post_word_count varchar(255),
  post_like_count varchar(255),
  post_comment_count varchar(255),
  post_view_count varchar(255),
  post_favorite_count varchar(255),
  post_coins_count varchar(255),
  post_share_count varchar(255),
  post_summary varchar(255),
  crawl_time datetime
)

CREATE TABLE banned (
  user_name varchar(255),
  user_id int PRIMARY KEY,
  ban_type varchar(255),
  ban_duration varchar(255),
  ban_time datetime
)

CREATE TABLE game_list (
  game_name varchar(255) PRIMARY KEY,
  game_description varchar(255),
  game_website varchar(255)
)