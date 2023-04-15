/*CREATE DB*/
DROP DATABASE [MICKET]
CREATE DATABASE [MICKET]
USE [MICKET]

/*DROP TABLE*/
DROP TABLE [tblSize]
GO 
DROP TABLE [tblProducts]
GO
DROP TABLE [tblCategory]
GO
DROP TABLE [tblAccount]
GO
DROP TABLE [tblCart]
/*CREATE*/
/*1. chạy lần lượt từ cate tới size*/
GO
CREATE TABLE tblCategory (
  category_id INT PRIMARY KEY,
  category_name NVARCHAR(50) NOT NULL,
);
GO
CREATE TABLE tblAccount (
  user_id INT IDENTITY(1,1) PRIMARY KEY,
  user_name nvarchar(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  is_available BIT NOT NULL, 
  is_sell BIT NOT NULL,
  is_admin BIT NOT NULL
);
GO
CREATE TABLE tblProducts (
  product_id INT IDENTITY(1,1) PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  title NVARCHAR(200),
  description VARCHAR(200),
  price DECIMAL(10,2) NOT NULL,
  image NVARCHAR(200),
  category_id INT NOT NULL,
  user_id INT NOT NULL,
  quantity INT,
  FOREIGN KEY (category_id) REFERENCES tblCategory(Category_id),
  FOREIGN KEY (user_id) REFERENCES tblAccount(user_id)
);
GO
CREATE TABLE tblSize (
  size_id INT IDENTITY(1,1) PRIMARY KEY,  
  size_name INT NOT NULL,
  product_id INT  NOT NULL,
  quantity INT NOT NULL CHECK (quantity >= 0),
  FOREIGN KEY (product_id) REFERENCES tblProducts(product_id),
);
GO
CREATE TABLE tblCart (
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  size_id INT NOT NULL,
  quantity INT,
  FOREIGN KEY (user_id) REFERENCES tblAccount(user_id),
  FOREIGN KEY (product_id) REFERENCES tblProducts(product_id),
  FOREIGN KEY (size_id) REFERENCES tblSize(size_id)
);

/*Contrainst*/


/*2. xong rồi add contrains*/
ALTER TABLE tblAccount ADD DEFAULT ((1)) FOR is_available;

ALTER TABLE tblProducts 
ADD CONSTRAINT FK_tblProducts_tblCategory 
FOREIGN KEY (category_id) REFERENCES tblCategory(category_id) 
ON DELETE CASCADE;

ALTER TABLE tblProducts 
ADD CONSTRAINT FK_tblProducts_tblAccount 
FOREIGN KEY (user_id) REFERENCES tblAccount(user_id) 
ON DELETE CASCADE;

ALTER TABLE tblSize 
ADD CONSTRAINT FK_tblSize_product 
FOREIGN KEY (product_id) REFERENCES tblProducts(product_id) 
ON DELETE CASCADE;

/*Trigger*/
/*trigger này là để làm kho bán giày*/
/*cái trigger này thì phải insert dữ liệu products trước sau đó mới khởi tạo cái này rồi insert size*/
DROP TRIGGER trg_update_product_quantity
CREATE TRIGGER trg_update_product_quantity
ON tblSize
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE tblProducts
    SET quantity = (
        SELECT SUM(quantity)
        FROM tblSize
        WHERE tblSize.product_id = tblProducts.product_id
    )
    FROM tblProducts
    INNER JOIN inserted ON tblProducts.product_id = inserted.product_id
END;

CREATE TRIGGER tr_DeleteSize
ON tblSize
AFTER DELETE
AS
BEGIN
    UPDATE p
    SET p.quantity = p.quantity - d.quantity
    FROM tblProducts p
    INNER JOIN deleted d ON p.product_id = d.product_id

END


INSERT INTO tblAccount (user_name, password, is_available, is_sell, is_admin)
VALUES
('minh', '123', 1 ,1 , 1),
('kha', '123', 1 ,1 , 0),
('tan', '123', 1, 1, 0)
GO

INSERT INTO tblCategory(category_id, category_name) 
VALUES 
(1, 'ADIDAS'),
(2, 'NIKE'),
(3, 'BITIS'),
(4, 'CONVERSE')
GO

INSERT INTO tblProducts (product_name, title, description, price, image, category_id, user_id) 
VALUES 
('ADIDAS Ultraboost', 'ADIDAS Ultraboost', 'The Ultraboost is one of ADIDAS most popular running shoes', 150.00, 'https://assets.adidas.com/images/w_600,f_auto,q_auto/b56f062b132c400ab494ac67011578a5_9366/Giay_Ultraboost_4.0_DNA_trang_FY9120_01_standard.jpg', 1, 1),

('NIKE Air Max 97', 'NIKE Air Max 97', 'The Air Max 97 is a popular NIKE sneaker known for its unique design', 170.00, 'https://cdn.tgdd.vn/Products/Images/9980/295241/giay-lifestyle-nam-nike-air-max-97-dm0027-001-2.jpg', 2, 2),

('BITIS Hunter X', 'BITIS Hunter X', 'The Hunter X is a premium sneaker from BITIS with a unique design', 200.00, 'https://product.hstatic.net/1000230642/product/dsuh00502den__2__42dd9d32ec0e4b8eba2a14c9972c4a97_grande.jpg', 3, 1),

('CONVERSE Chuck Taylor All Star', 'CONVERSE Chuck Taylor All Star', 'The Chuck Taylor All Star is a classic and popular sneaker from CONVERSE', 60.00, 'https://product.hstatic.net/200000265619/product/121186-1_d83cf53a24ef440ea44f5c28778298a0_1024x1024.jpg', 4, 1),

('ADIDAS NMD', 'ADIDAS NMD', 'The NMD is a popular lifestyle shoe from ADIDAS with a comfortable and unique design', 130.00, 'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/5e45b3506c0646eaa72eaf3400bd8d77_9366/gi%C3%A0y-nmd_r1.jpg', 1, 2),

('NIKE Air Jordan 1', 'NIKE Air Jordan 1', 'The Air Jordan 1 is a classic NIKE sneaker that has been popular for decades', 160.00, 'https://static.nike.com/a/images/t_prod_ss/w_960,c_limit,f_auto/953f8c77-48ab-4583-b040-c04a3a93ab32/air-jordan-1-ko-chicago-release-date.jpg', 2, 1),

('BITIS Eclipse', 'BITIS Eclipse', 'The Eclipse is a premium sneaker from BITIS with a sleek design', 180.00, 'https://img.my-best.vn/content_section/choice_component/sub_contents/b3815a275ec17f846578fd660bd927f4.jpg?ixlib=rails-4.2.0&q=70&lossless=0&w=690&fit=max&s=83b047e286c6febaad6324505cc0f4e5', 3, 3),

('CONVERSE One Star', 'CONVERSE One Star', 'The One Star is a classic and popular sneaker from CONVERSE with a simple yet stylish design', 70.00, 'https://images.stockx.com/images/Converse-One-Star-Ox-Comme-des-Garcons-PLAY-Black-Product.jpg?fit=fill&bg=FFFFFF&w=1200&h=857&fm=webp&auto=compress&dpr=2&trim=color&updated_at=1659591621&q=75', 4, 3),

('Nike Air Max 270 React', 'Nike Air Max 270 React - Men''s Shoes', 'The Nike Air Max 270 React combines lightweight, breathable materials with a full-length React foam midsole for a super-soft ride that feels as good as it looks.', 150.00, 'https://cdn.tgdd.vn/Products/Images/9980/277720/giay-lifestyle-nu-nike-air-max-270-react-cv8818-102-m-1.jpg', 2, 1),

('Adidas Ultraboost 21', 'Adidas Ultraboost 21 - Women''s Shoes', 'The Adidas Ultraboost 21 features an updated Primeknit+ upper that adapts to the shape of your foot for a personalized fit, and Boost cushioning that returns energy with every stride.', 180.00, 'https://runningstore.vn/wp-content/uploads/2022/11/6845f9b9c88b0fd5569a.jpg', 1, 2),

('Nike Air Max 90', 'New Release', 'This is the latest Nike Air Max 90 release.', 99.99, 'https://cdn.tgdd.vn/Products/Images/9980/299138/giay-lifestyle-nu-nike-air-max-90-dx0115-100-1.jpg', 2, 3),

('Converse Chuck Taylor All Star', 'Converse Chuck Taylor All Star - Unisex Shoes', 'The Converse Chuck Taylor All Star is a classic, versatile shoe that can be dressed up or down. With a canvas upper and rubber sole, it''s both comfortable and durable.', 50.00, 'https://cdn.shopify.com/s/files/1/0456/5070/6581/products/M9160C-1_748742ea-7280-4686-910d-3a7b7d5a0fb6_1024x1024@2x.jpg?v=1668400594', 4, 3),
 
('Nike Air Force 1', 'Classic Sneakers', 'A classic silhouette that never goes out of style.', 99.99, 'https://stockx.imgix.net/Nike-Air-Force-1-Low-White-07-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&q=90&dpr=2&trim=color&updated_at=1561409052', 1, 1),
 
('Adidas Superstar', 'Iconic Sneakers', 'The classic shell-toe design with the iconic three stripes.', 89.99, 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/50d5f624ee6944aa9f45ae32012dd6ad_9366/Giay_Superstar_adidas_x_LEGOr_trang_GV8885_01_standard.jpg', 2, 1),
 
('Vans Old Skool', 'Skateboarding Sneakers', 'The original classic skate shoe.', 69.99, 'https://bizweb.dktcdn.net/thumb/1024x1024/100/140/774/products/vans-old-skool-black-white-vn000d3hy28-1.jpg', 3, 2),
 
('Converse Chuck Taylor All Star Low', 'All-Purpose Sneakers', 'A timeless design that looks great with any outfit.', 79.99, 'https://product.hstatic.net/200000265619/product/121178-1_7ae11c7ec1b44e70b4689c4c3f063087_1024x1024.jpg', 4, 2);
GO
INSERT INTO tblSize (size_name, product_id, quantity)
VALUES
(36, 1, 2), (37, 1, 2), (38, 1, 2), (39, 1, 2), (40, 1, 3), (41, 1, 2), (42, 1, 2), (43, 1, 3), (44, 1, 2),　　
(36, 2, 9), (37, 2, 8), (38, 2, 7), (39, 2, 3), (40, 2, 5), (41, 2, 2), (42, 2, 3), (43, 2, 1), (44, 2, 3),
(36, 3, 2), (37, 3, 4), (40, 3, 5), (41, 3, 6), (42, 3, 2), (43, 3, 2), (44, 3, 1),
(38, 4, 1), (39, 4, 1), (40, 4, 2), (41, 4, 8), (42, 4, 1), (43, 4, 5), (44, 4, 4),
(38, 5, 1), (39, 5, 1), (40, 5, 1), (41, 5, 1), (42, 5, 1), (43, 5, 2), (44, 5, 3),
(37, 6, 1), (38, 6, 1), (39, 6, 1), (40, 6, 1), (41, 6, 2), (42, 6, 4), (43, 6, 6), (44, 6, 8),
(36, 7, 1), (37, 7, 1), (38, 7, 1), (39, 7, 1), (40, 7, 1), (41, 7, 3), (42, 7, 2), (43, 7, 1), (44, 7, 1),
(37, 8, 1), (38, 8, 1), (39, 8, 2), (40, 8, 2), (41, 8, 3), (42, 8, 3), (43, 8, 3), (44, 8, 3),
(36, 9, 1), (37, 9, 2), (38, 9, 3), (39, 9, 1), (40, 9, 1), (41, 9, 2), (42, 9, 2), (43, 9, 2), (44, 9, 2),
(36, 10, 1), (37, 10, 2), (38, 10,4), (39, 10, 1), (41, 10, 1), (42, 10, 1), (43, 10, 3), (44, 10, 3),
(36, 11, 1), (37, 11, 2), (38, 11 ,4), (39, 11, 1), (40, 11, 1), (41, 11, 1), (42, 11, 1), (43, 11, 1), (44, 11, 1),
(36, 12, 1), (37, 12, 2), (38, 12, 4), (41, 12, 1), (42, 12, 1), (43, 12, 1), (44, 12, 1),
(36, 13, 1), (37, 13, 2), (38, 13, 1), (39, 13, 2), (40, 13, 2), (41, 13, 1), (42, 13, 1), (43, 13, 1), (44, 13, 1),
(36, 14, 1), (37, 14, 2), (38, 14, 1), (39, 14, 2), (40, 14, 2), (41, 14, 1), (42, 14, 1), (43, 14, 1), (44, 14, 1),
(36, 15, 1), (37, 15, 2), (38, 15, 1), (39, 15, 2), (40, 15, 2), (41, 15, 1), (42, 15, 1), (43, 15, 1), (44, 15, 1),
(36, 16, 1), (37, 16, 2), (38, 16, 1), (39, 16, 2), (40, 16, 2), (41, 16, 1), (42, 16, 1), (43, 16, 1), (44, 16, 1);
GO

