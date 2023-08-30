def is_integer? n
    n.to_i.to_s == n
end

def clear_console
    system("clear") || system("cls")
end
