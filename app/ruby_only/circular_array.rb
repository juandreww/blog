def prints(menu, starting_index)
  menu_size = menu.size
  twice_sized_menu = generate_twice_sized_menu(menu, menu_size)

  i = starting_index
  while i < menu_size + starting_index
    puts(" ") if i > starting_index
    puts(twice_sized_menu[i].to_s)
    i += 1
  end
end

def generate_twice_sized_menu(menu, menu_size)
  twice_sized_menu = [] * menu_size * 2
  i = 0

  while i < menu_size
    twice_sized_menu[i] = twice_sized_menu[menu_size + i] = menu[i]
    i += 1
  end

  twice_sized_menu
end

domino_pizza_menus = ["0. grilled beef supreme", "1. cheesy meatball blast", "2. ultimate cheese melt",
                      "3. american frankie sausage", "4. american classic cheeseburger"]
starting_index = 3
prints(domino_pizza_menus, starting_index)
