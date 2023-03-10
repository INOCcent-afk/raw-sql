CREATE TABLE TweetUser (    
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Tweet (
    id BIGSERIAL PRIMARY KEY,
    tweetMessage VARCHAR(255),
    tweetUser_id INTEGER NOT NULL,
    parentId INTEGER,

    FOREIGN KEY (tweetUser_id) REFERENCES TweetUser (id),
    FOREIGN KEY (id) REFERENCES Tweet (id)
);

CREATE TABLE Tweets (
    "A" integer NOT NULL REFERENCES "tweet"(id) ON DELETE CASCADE ON UPDATE CASCADE,
    "B" integer NOT NULL REFERENCES "tweet"(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TweetLike (
    id BIGSERIAL PRIMARY KEY,
    tweetUser_id INTEGER NOT NULL,
    tweetId INTEGER NOT NULL,

    FOREIGN KEY (tweetUser_id) REFERENCES TweetUser (id),
    FOREIGN KEY (tweetId) REFERENCES Tweet (id)
);

-- Create User
insert into TweetUser (email, password) values ('test@gmail.com', 'test');

-- Create Tweet
insert into Tweet (tweetmessage, tweetuser_id) values ('My first Tweet', 1);

CREATE TABLE tweetUser (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE tweet (
    id SERIAL PRIMARY KEY,
    tweetMessage VARCHAR(255),
    tweetUserId INT NOT NULL,

    FOREIGN KEY (tweetUserId) REFERENCES tweetUser (id)
);

CREATE TABLE tweets (
    tweetParentId INTEGER NOT NULL,
    tweetId INTEGER NOT NULL,

    FOREIGN KEY (tweetParentId) REFERENCES tweet(id),
    FOREIGN KEY (tweetId) REFERENCES tweet(id)
);

CREATE TABLE tweetLike (
    id SERIAL PRIMARY KEY,
    tweetUserId INT NOT NULL,
    tweetId INT NOT NULL,

    FOREIGN KEY (tweetUserId) REFERENCES tweetUser (id),
    FOREIGN KEY (tweetId) REFERENCES tweet (id)
);

