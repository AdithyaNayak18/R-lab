inventory_items <- character(0)
inventory_quantities <- numeric(0)

add_item <- function(item, quantity) { 
  inventory_items <<- c(inventory_items, item) 
  inventory_quantities <<- c(inventory_quantities, quantity) 
  cat("Item added to inventory.\n") 
}

update_quantity <- function(item, new_quantity) { 
  if (item %in% inventory_items) { 
    inventory_quantities[which(inventory_items == item)] <<- new_quantity
    cat("Quantity updated.\n") 
  } else cat("Item not found in inventory.\n") 
}

display_inventory <- function() { 
  cat("Inventory Items and Quantities:\n")
  for (i in 1:length(inventory_items)) 
    cat(sprintf("%s: %d\n", inventory_items[i], inventory_quantities[i])) 
}

while (TRUE) { 
  cat("\n1. Add Item\n2. Update Quantity\n3. Display Inventory\n4. Exit\n") 
  choice <- as.integer(readline("Enter your choice: ")) 
  if (choice == 1) { 
    add_item(readline("Enter item name: "), as.integer(readline("Enter quantity: "))) 
  } else if (choice == 2) { 
    update_quantity(readline("Enter item name: "), as.integer(readline("Enter new quantity: "))) 
  } else if (choice == 3) display_inventory() 
  else if (choice == 4) { 
    cat("Exiting the program. Goodbye!\n") 
    break 
  } else cat("Invalid choice. Please try again.\n") 
}
