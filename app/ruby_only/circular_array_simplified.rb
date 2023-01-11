def prints(menu, starting_index)
  menu_size = menu.size
  i = starting_index

  while i < menu_size + starting_index
    puts(" ") if i > starting_index
    puts(menu[(i % menu_size)])
    i += 1
  end
end

domino_pizza_menus = ["0. grilled beef supreme", "1. cheesy meatball blast", "2. ultimate cheese melt",
                      "3. american frankie sausage", "4. american classic cheeseburgers"]
starting_index = 3
prints(domino_pizza_menus, starting_index)
