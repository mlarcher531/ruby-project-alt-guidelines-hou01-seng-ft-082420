$prompt = TTY::Prompt.new(active_color: :yellow)
$font = TTY::Font.new(:starwars)
$pastel1 = Pastel.new

def welcome_screen
  system "clear"
  puts $pastel1.green($font.write("IBA Cocktail App"))
  p "Welcome to The Un-Official IBA Cocktail App!"
  acct = $prompt.yes?("Do you have an account?")
  if acct == false; new_user_info; elsif acct == true; user_login end
end

def new_user_info
  system "clear"
  username = $prompt.ask("Please pick a username:")
  npassword = $prompt.mask("Please set your password:")
  #display_info(username, npassword)
  User.create(name: username, password: npassword, status: "active")
  system "clear"
  p "Welcome to the family #{username}, let's get drunk!"
  @user = username
  Fav_List.create(name: @user, drink_id1: nil, drink_id2: nil, drink_id3: nil, drink_id4: nil, drink_id5: nil)
  # binding.pry
end

#still needs verification if acct exists and password is correct

def user_login
  system "clear"
  existing_user = $prompt.ask("Please enter your username:")
  system "clear"
  existing_pw = $prompt.mask("Please enter your password:")
  @user = existing_user
  user = User.where(name: @user)
  if user[0][:password] != existing_pw
    p "wrong password, please try again"
    welcome_screen
  else
    p "password accepted"
    system "clear"
    p "Welcome back, #{existing_user}, let's get drunk!"
  end
end

#serch for drink or see favs
#to add functionality (like give random drink) add in what do
def what_to_do
  # system "clear"
  what_do = $prompt.select("Do you want to browse for drinks, see your favorites, or see a random cocktail?", %w(Browse Favorites Random Quit))
  # binding.pry
  if what_do == "Favorites"
    show_fav_list
  elsif what_do == "Browse"
    y = $prompt.select("Would you like to browse by ingredients or search by name?", %w(Ingredients Name))
    if y == "Ingredients"
      liquor_ask
    else y == "Name"
      answer = $prompt.ask("What is the name of the drink you would like to find?")
      drink_by_name(answer)     end
  elsif what_do == "Random"
    array = (1..76).to_a
    rand_drink_id = array.sample
    rand = Drink.where(id: rand_drink_id)
    # binding.pry
    puts $pastel1.blue($font.write("#{rand[0][:name]}"))
    p "Your lucky drink is #{rand[0][:name]}!"
    drink_details(rand[0][:name])
  else what_do == "Quit"
    welcome_screen   end
end

def show_fav_list
  a = Fav_List.where(name: @user)
  # name = a[0][:name]
  if a[0][:drink_id5] != nil
    drink1 = Drink.where(id: a[0][:drink_id1])
    drink2 = Drink.where(id: a[0][:drink_id2])
    drink3 = Drink.where(id: a[0][:drink_id3])
    drink4 = Drink.where(id: a[0][:drink_id4])
    drink5 = Drink.where(id: a[0][:drink_id5])
    list_drinks = drink1, drink2, drink3, drink4, drink5
    list = list_drinks.collect { |drink| drink[0].name }
    system "clear"
    puts $pastel1.green($font.write("Favorites"))
    fav_drink = $prompt.select("Pick one of your favorites to see other drinks like it!", list ,'Exit')
    if fav_drink == 'Exit'
      system "clear"
      what_to_do
    else
    end
    a = Drink.where(name: fav_drink)
    b = a[0][:liquor_id]
    c = Liquor.where(id: b)
    d = c[0][:name]
    # binding.pry
    drinks_by_liquor(d)
  elsif a[0][:drink_id4] != nil
    drink1 = Drink.where(id: a[0][:drink_id1])
    drink2 = Drink.where(id: a[0][:drink_id2])
    drink3 = Drink.where(id: a[0][:drink_id3])
    drink4 = Drink.where(id: a[0][:drink_id4])
    list_drinks = drink1, drink2, drink3, drink4
    list = list_drinks.collect { |drink| drink[0].name }
    system "clear"
    puts $pastel1.green($font.write("Favorites"))
    fav_drink = $prompt.select("Pick one of your favorites to see other drinks like it!",list ,'Exit')
    if fav_drink == 'Exit'
      system "clear"
      what_to_do
    else
    end
    a = Drink.where(name: fav_drink)
    b = a[0][:liquor_id]
    c = Liquor.where(id: b)
    d = c[0][:name]
    # binding.pry
    drinks_by_liquor(d)
  elsif a[0][:drink_id3] != nil
    drink1 = Drink.where(id: a[0][:drink_id1])
    drink2 = Drink.where(id: a[0][:drink_id2])
    drink3 = Drink.where(id: a[0][:drink_id3])
    list_drinks = drink1, drink2, drink3
    list = list_drinks.collect { |drink| drink[0].name }
    system "clear"
    puts $pastel1.green($font.write("Favorites"))
    fav_drink = $prompt.select("Pick one of your favorites to see other drinks like it!", list ,'Exit')
    if fav_drink == 'Exit'
      system "clear"
      what_to_do
    else
    end
    a = Drink.where(name: fav_drink)
    b = a[0][:liquor_id]
    c = Liquor.where(id: b)
    d = c[0][:name]
    # binding.pry
    drinks_by_liquor(d)
  elsif a[0][:drink_id2] != nil
    drink1 = Drink.where(id: a[0][:drink_id1])
    drink2 = Drink.where(id: a[0][:drink_id2])
    list_drinks = drink1, drink2
    list = list_drinks.collect { |drink| drink[0].name }
    system "clear"
    puts $pastel1.green($font.write("Favorites"))
    fav_drink = $prompt.select("Pick one of your favorites to see other drinks like it!", list ,'Exit')
    if fav_drink == 'Exit'
      system "clear"
      what_to_do
    else
    end
    a = Drink.where(name: fav_drink)
    b = a[0][:liquor_id]
    c = Liquor.where(id: b)
    d = c[0][:name]
    # binding.pry
    drinks_by_liquor(d)
  elsif a[0][:drink_id1] != nil
    drink1 = Drink.where(id: a[0][:drink_id1])
    # binding.pry
    system "clear"
    puts $pastel1.green($font.write("Favorites"))
    fav_drink = $prompt.select("Pick one of your favorites to see other drinks like it!", drink1[0][:name], 'Exit')
    if fav_drink == 'Exit'
      system "clear"
      what_to_do
    else
    end
    a = Drink.where(name: fav_drink)
    b = a[0][:liquor_id]
    c = Liquor.where(id: b)
    d = c[0][:name]
    # binding.pry
    drinks_by_liquor(d)
  else
    system "clear"
    p "You have not selected any favorites yet!"
    what_to_do
  end
end

def liquor_ask
  system "clear"
  answer = $prompt.select("What kind of cocktail would you like today?",
                          %w(Vodka Gin Whiskey Bourbon Tequila Rum Cognac Campari Brandy
                             P.G.A. Chambord Mezcal Prosecco Cocci_Americano Galliano Creme_de_Menthe Creme_de_cassis Spiced_Rum Champagne).sort, per_page: 20)
  p "Let's see what we can find...."
  drinks_by_liquor(answer)
end

def drinks_by_liquor(answer)
  system "clear"
  a = Liquor.where(name: answer)
  # binding.pry
  b = Drink.where(liquor_id: a[0][:id])
  # binding.pry
  c = b.collect { |drink| drink.name }
  d = c.each do |name|
    name
  end
  # binding.pry
  picked_drink = $prompt.select("#{@user}, check out these drinks that use #{a[0][:name]}:", d, per_page: 10)
  drink_details(picked_drink)
end

def drink_details(picked_drink)
  system "clear"
  @a = Drink.where(name: picked_drink)
  # binding.pry
  name = @a[0][:name]
  pliquor = Liquor.where(id: @a[0][:liquor_id])
  pl_name = pliquor[0][:name]
  if @a[0][:liquor_id2] != nil
    sliquor = SecondaryLiquor.where(id: @a[0][:liquor_id2])
    sl_name = sliquor[0][:name]
  end
  if @a[0][:mixer_id] != nil
    pmixer = Mixer.where(id: @a[0][:mixer_id])
    pm_name = pmixer[0][:name]
  end
  if @a[0][:mixer_id2] != nil
    smixer = SecondaryMixer.where(id: @a[0][:mixer_id2])
    sm_name = smixer[0][:name]
  end
  # binding.pry
  ing_list = pl_name, sl_name, pm_name, sm_name
  puts $pastel1.blue($font.write("#{name}"))
  p "#{name}s are made with #{ing_list[0]}, #{ing_list[1]}, #{ing_list[2]}, and #{ing_list[3]}."

  fav_add = $prompt.yes?("Would you like to add this drink to your favorite list?")
  if fav_add == true
    a = Fav_List.where(name: @user)
    b = a[0]
    if b.drink_id1 == nil; b.drink_id1 = @a[0][:id]
      b.save     elsif b.drink_id2 == nil; b.drink_id2 = @a[0][:id]
      b.save     elsif b.drink_id3 == nil; b.drink_id3 = @a[0][:id]
      b.save     elsif b.drink_id4 == nil; b.drink_id4 = @a[0][:id]
      b.save     elsif b.drink_id5 == nil; b.drink_id5 = @a[0][:id]
      b.save     else
      p "You already have 5 favorite drinks, you alcoholic!"
    end
    # binding.pry
  end

  answer = $prompt.yes?("Would you like to see similiar drinks with these ingredients?")
  if answer == true
    pick = $prompt.select("Choose an ingredient to find drinks that also use it:", ing_list)
    # binding.pry
    if pick == ing_list[0]
      a = Liquor.where(name: pick)
      b = a[0][:id]
      c = Drink.where(liquor_id: b) or Drink.where(liquor_id2: b)
      d = c.collect { |f| f.name }
      d
      system "clear"
      picked_drink = $prompt.select("Check these drinks out:", d)
      drink_details(picked_drink)
      #  binding.pry
      # binding.pry
    elsif pick == ing_list[1]
      a = SecondaryLiquor.where(name: pick)
      # binding.pry
      b = a[0][:id]
      c = Drink.where(liquor_id2: b) or Drink.where(liquor_id: b)
      d = c.collect { |f| f.name }
      d
      picked_drink = $prompt.select("Check these drinks out:", d)
      drink_details(picked_drink)
    elsif pick == ing_list[2]
      a = Mixer.where(name: pick)
      b = a[0][:id]
      c = Drink.where(mixer_id: b) or Drink.where(mixer_id2: b)
      d = c.collect { |f| f.name }
      d
      picked_drink = $prompt.select("Check these drinks out:", d)
      drink_details(picked_drink)
    elsif pick == ing_list[3]
      a = SecondaryMixer.where(name: pick)
      # binding.pry
      b = a[0][:id]
      c = Drink.where(mixer_id2: b) or Drink.where(mixer_id: b)
      d = c.collect { |f| f.name }
      d
      picked_drink = $prompt.select("Check these drinks out:", d)
      drink_details(picked_drink)
    end
  elsif answer == false
    what_to_do
  end
end

def drink_by_name(name)
  name2 = name.split(" ")
  name3 = name2.map { |word| word.downcase.capitalize }
  name4 = name3.join(" ")
  # binding.pry
  a = Drink.where(name: name4)
  if a == []
    p "Sorry, we could not find that drink in the IBA list."
    liquor = $prompt.ask("What kind of liquor is used?")
    l2 = liquor.capitalize
    drinks_by_liquor(l2)
  else
    p "You are in luck, #{a[0][:name]} is an official IBA cocktail!"
    drink_details(a[0][:name])
  end
end
