# SQL (Lang)

**File:** `/Users/charlo/.dotfiles/.config/memo/_posts/2026-01-22-Databases-(Winter-2026).md`

## Notes

```SQL
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
```

FOREIGN KEY creates a reference to another table's field

With Some more options:

```SQL
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
```
