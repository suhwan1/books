-- Active: 1710831048795@@database-9835.cn42gi2gudoq.ap-northeast-2.rds.amazonaws.com@3306@my_db

CREATE TABLE Categories(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name varchar(255) not NULL,
    category_index INT   
);

-- 2. 도서 작가를 저장하는 테이블 생성 
-- - 테이블명은 Authors 이다.  
-- - 기본키는 'author_id' (int, auto_increment) 이다.  
-- - Columns는 'name' (varchar(255)), 'address' (varchar(255)), 'age'(int) 이다.  
-- - 'name'은 비어있을 수 없다. 

CREATE TABLE Authors(
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    age INT  
);

-- 3. 도서 정보를 저장하기 위한 테이블 생성  
-- - 테이블명은 Books 이다.  
-- - 기본키는 'book_id' (int, auto_increment) 이다.  
-- - Columns은 'title'(varchar(100)), 'pub_year'(datetime), 'price'(int) 로 한다.  
-- - 외래키는 책의 카테고리 ID인 'category_id' (int) 와 책 작가의 ID인 'author_id' (int) 이다.  
-- - 모든 Columns 는 비어있을 수 없다.

-- 참고: 외래키 추가는 아래와 같은 방법으로 할 수 있다. 
-- category_id INT,
-- FOREIGN KEY (category_id) REFERENCES Categories(category_id)

CREATE TABLE Books(
    book_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(100) NOT NULL,
    pub_year DATETIME NOT NULL,
    price INT NOT NULL,
    category_id INT NOT NULL, 
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id));

-- 4. 유저 정보츨 저장할 테이블 생성
-- - 테이블명은 Users 이다.  
-- - 기본키는 'user_id' (int, auto_increment) 이다.  
-- - Columns는 'name' (varchar(255)), 'email' (varchar(255)), 'address' (varchar(255)), age(int) 이다.
-- - 'name'과 'email'은 비어있을 수 없다.

CREATE TABLE Users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    age INT NOT NULL
);

-- 5. 유저가 책을 구매한 구매내역을 저장할 테이블 생성
-- - 테이블명은 Purchases 이다.  
-- - 기본키는 'purchase_id' (int, auto_increment) 이다.  
-- - Columns는 'purchase_date' (datetime), 'quantity' (int), 'purchase_price' (int) 이다.  
-- - 외래키는 책을 구매한 유저의 ID인 'user_id' (int) 와 책의 ID인 'book_id' 이다. 
-- - 모든 컬럼을 비어있을 수 없다.

CREATE TABLE Purchases(
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_date DATETIME NOT NULL,
    quantity INT NOT NULL,
    purchase_price INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    book_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);