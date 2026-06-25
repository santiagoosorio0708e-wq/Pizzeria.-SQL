USE pizzeria_db;

INSERT INTO clientes (nombre, telefono, email, direccion) VALUES
('Juan Perez', '3001234567', 'juan.perez@email.com', 'Calle 1 # 2-3'),
('Maria Rodriguez', '3109876543', 'maria.r@email.com', 'Carrera 4 # 5-6'),
('Carlos Gomez', '3205554433', 'cgomez@email.com', 'Avenida 7 # 8-9');

INSERT INTO categorias (nombre) VALUES
('Pizzas'),
('Panzarottis'),
('Bebidas'),
('Postres');

INSERT INTO ingredientes (nombre) VALUES
('Masa'), ('Queso Mozzarella'), ('Salsa de Tomate'), ('Pepperoni'), 
('Jamón'), ('Piña'), ('Champiñones'), ('Pollo'), ('Cebolla');

INSERT INTO productos (nombre, descripcion, precio, categoria_id) VALUES
('Pizza Pepperoni Mediana', 'Deliciosa pizza con extra pepperoni', 25000.00, 1),
('Pizza Hawaiana Mediana', 'Clásica pizza con jamón y piña', 24000.00, 1),
('Pizza Pollo y Champiñones', 'Pizza con trozos de pollo y champiñones frescos', 27000.00, 1),
('Panzarotti Mixto', 'Panzarotti relleno de queso, jamón y pepperoni', 12000.00, 2),
('Coca Cola 1.5L', 'Gaseosa tamaño familiar', 6000.00, 3),
('Jugo de Mora', 'Jugo natural en agua', 4000.00, 3),
('Brownie con Helado', 'Porción de brownie caliente con helado de vainilla', 8000.00, 4);

-- Relacionar Productos con Ingredientes
INSERT INTO producto_ingredientes (producto_id, ingrediente_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 1), (2, 2), (2, 3), (2, 5), (2, 6),
(3, 1), (3, 2), (3, 3), (3, 7), (3, 8),
(4, 1), (4, 2), (4, 4), (4, 5);

INSERT INTO adiciones (nombre, precio) VALUES
('Borde de Queso', 4000.00),
('Salsa de Ajo', 1500.00),
('Extra Pepperoni', 3000.00),
('Extra Queso', 2500.00);

INSERT INTO combos (nombre, descripcion, precio) VALUES
('Combo Pareja', '1 Pizza Mediana Hawaiana + 2 Jugos', 30000.00),
('Combo Familiar', '1 Pizza Pepperoni + 1 Panzarotti + 1 Gaseosa 1.5L', 40000.00);

-- Relacionar Combos con Productos
INSERT INTO combo_productos (combo_id, producto_id, cantidad) VALUES
(1, 2, 1), (1, 6, 2),
(2, 1, 1), (2, 4, 1), (2, 5, 1);

INSERT INTO pedidos (cliente_id, fecha, tipo_pedido, estado, total) VALUES
(1, '2023-10-25 19:30:00', 'En sitio', 'Entregado', 31500.00),
(2, '2023-10-25 20:15:00', 'Recoger', 'Listo', 40000.00),
(3, '2023-10-26 13:00:00', 'En sitio', 'Pendiente', 39000.00);

-- Insertar Detalle de Productos en Pedidos (Pedido 1 y Pedido 3)
INSERT INTO pedido_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 25000.00, 25000.00),
(3, 3, 1, 27000.00, 27000.00),
(3, 4, 1, 12000.00, 12000.00);

INSERT INTO pedido_adiciones (pedido_producto_id, adicion_id, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 4000.00, 4000.00),
(1, 4, 1, 2500.00, 2500.00);

INSERT INTO pedido_combos (pedido_id, combo_id, cantidad, precio_unitario, subtotal) VALUES
(2, 2, 1, 40000.00, 40000.00);
