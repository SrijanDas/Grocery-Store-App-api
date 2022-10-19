
-- CREATE DATABASE gc_store;

-- USE gc_store;

CREATE TABLE `gc_store`.`uom` (
  `uom_id` INT NOT NULL AUTO_INCREMENT,
  `uom_name` VARCHAR(45) NULL,
  PRIMARY KEY (`uom_id`));
  
CREATE TABLE `gc_store`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NOT NULL,
  `price_per_unit` DOUBLE NOT NULL,
  `uom_id` INT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  INDEX `uom_id_idx` (`uom_id` ASC) VISIBLE,
  CONSTRAINT `uom_id`
    FOREIGN KEY (`uom_id`)
    REFERENCES `gc_store`.`uom` (`uom_id`)
    ON DELETE SET NULL
    ON UPDATE RESTRICT);
    
CREATE TABLE `gc_store`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(100) NOT NULL,
  `total` DOUBLE NOT NULL,
  `date_time` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`));
  
CREATE TABLE `gc_store`.`order_details` (
  `order_item_id` INT NOT NULL,
  `order_id` INT NULL,
  `product_id` INT NULL,
  `quantity` DOUBLE NOT NULL,
  `total_price` DOUBLE NULL,
  PRIMARY KEY (`order_item_id`),
  INDEX `fk_order_id_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `gc_store`.`orders` (`order_id`)
    ON DELETE SET NULL
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `gc_store`.`products` (`product_id`)
    ON DELETE SET NULL
    ON UPDATE RESTRICT);




    
