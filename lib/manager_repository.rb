require_relative "./items"
require_relative "./orders"

class ManagerRepository
    def list_items
        sql = "SELECT * FROM items;"
        result = DatabaseConnection.exec_params(sql, [])

        array = []

        result.each do |hash|
            item = Items.new
            item.id = hash['id'].to_i
            item.name = hash['name']
            item.price = hash['price']
            item.quantity = hash['quantity'].to_i

            array.push(item)
        end

        return array
    end

    def list_orders
        sql = "SELECT * FROM orders;"
        result = DatabaseConnection.exec_params(sql, [])

        array = []

        result.each do |hash|
            order = Orders.new
            order.id = hash['id'].to_i
            order.customer = hash['customer']
            order.order_date = hash['order_date']

            array.push(order)
        end

        return array
    end

    def items_in_order(id)
        sql = "SELECT items.id, items.name, items.price, items.quantity FROM items
        JOIN items_orders ON items_orders.item_id = items.id
        JOIN orders ON items_orders.order_id = orders.id
        WHERE orders.id = $1;"
        params = [id]
        result = DatabaseConnection.exec_params(sql, params)

        array = []

        result.each do |hash|
            item = Items.new
            item.id = hash['id'].to_i
            item.name = hash['name']
            item.price = hash['price']
            item.quantity = hash['quantity'].to_i

            array.push(item)
        end

        return array
    end

    def orders_with_item(id)
        sql = "SELECT orders.id, orders.customer, orders.order_date FROM orders
        JOIN items_orders ON items_orders.order_id = orders.id
        JOIN items ON items_orders.item_id = items.id
        WHERE items.id = $1;"
        params = [id]
        result = DatabaseConnection.exec_params(sql, params)

        array = []

        result.each do |hash|
            order = Orders.new
            order.id = hash['id'].to_i
            order.customer = hash['customer']
            order.order_date = hash['order_date']

            array.push(order)
        end

        return array
    end

    def create_item(item)
        sql = "INSERT INTO items (name, price, quantity) VALUES ($1, $2, $3)"
        params = [item.name, item.price, item.quantity]

        DatabaseConnection.exec_params(sql, params)
    end

    def create_order(order, items)
        sql = "INSERT INTO orders (customer, order_date) VALUES ($1, $2)"
        params = [order.customer, order.order_date]

        DatabaseConnection.exec_params(sql, params)

        while items != []
            sql = "INSERT INTO items_orders (item_id, order_id) VALUES ($1, $2)"
            params = [items[0], list_orders.length]

            DatabaseConnection.exec_params(sql, params)
            items.shift
        end
    end
end