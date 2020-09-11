
    @url1 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    @url2 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=b"
    @url3 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=c"
    @url4 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=d"
    @url5 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=e"
    @url6 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=f"
    @url7 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=g"
    @url8 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=h"
    @url9 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=i"
    @url10 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=j"
    @url11 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=k"
    @url12 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=l"
    @url13 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=m"
    @url14 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=n"
    @url15 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=o"
    @url16 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=p"
    @url17 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=q"
    @url18 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=r"
    @url19 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=s"
    @url20 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=t"
    @url21 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=u"
    @url22 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=v"
    @url23 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=w"
    @url24 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=x"
    @url25 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=y"
    @url26 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=z"
    
    
    def all_drinks
        uri1 = URI.parse(@url1)
        response1 = Net::HTTP.get_response(uri1)
        uri2 = URI.parse(@url2)
        response2 = Net::HTTP.get_response(uri2)
        uri3 = URI.parse(@url3)
        response3 = Net::HTTP.get_response(uri3)
        uri4 = URI.parse(@url4)
        response4 = Net::HTTP.get_response(uri4)
        uri5 = URI.parse(@url5)
        response5 = Net::HTTP.get_response(uri5)
        uri6 = URI.parse(@url6)
        response6 = Net::HTTP.get_response(uri6)
        uri7 = URI.parse(@url7)
        response7 = Net::HTTP.get_response(uri7)
        uri8 = URI.parse(@url8)
        response8 = Net::HTTP.get_response(uri8)
        uri9 = URI.parse(@url9)
        response9 = Net::HTTP.get_response(uri9)
        uri10 = URI.parse(@url10)
        response10 = Net::HTTP.get_response(uri10)
        uri11 = URI.parse(@url11)
        response11 = Net::HTTP.get_response(uri11)
        uri12 = URI.parse(@url12)
        response12 = Net::HTTP.get_response(uri12)
        uri13 = URI.parse(@url13)
        response13 = Net::HTTP.get_response(uri13)
        uri14 = URI.parse(@url14)
        response14 = Net::HTTP.get_response(uri14)
        uri15 = URI.parse(@url15)
        response15 = Net::HTTP.get_response(uri15)
        uri16 = URI.parse(@url16)
        response16 = Net::HTTP.get_response(uri16)
        uri17 = URI.parse(@url17)
        response17 = Net::HTTP.get_response(uri17)
        uri18 = URI.parse(@url18)
        response18 = Net::HTTP.get_response(uri18)
        uri19 = URI.parse(@url19)
        response19 = Net::HTTP.get_response(uri19)
        uri20 = URI.parse(@url20)
        response20 = Net::HTTP.get_response(uri20)
        uri21 = URI.parse(@url21)
        response21 = Net::HTTP.get_response(uri21)
        uri22 = URI.parse(@url22)
        response22 = Net::HTTP.get_response(uri22)
        uri23 = URI.parse(@url23)
        response23 = Net::HTTP.get_response(uri23)
        uri24 = URI.parse(@url24)
        response24 = Net::HTTP.get_response(uri24)
        uri25 = URI.parse(@url25)
        response25 = Net::HTTP.get_response(uri25)
        uri26 = URI.parse(@url26)
        response26 = Net::HTTP.get_response(uri26)
        
        
        drink_array = response1.body, response2.body, response3.body, response4.body, response5.body, response6.body, response7.body, response8.body, response9.body, response10.body, response11.body, response12.body, response13.body, response14.body, response15.body, response16.body, response17.body, response18.body, response19.body, response20.body, response21.body, response22.body, response23.body, response24.body, response25.body, response26.body
        drink_array
    end
    
    def make_work
        count = 0
        final_array = []
        while count < 25 do 
            # 2 should be 26, lowered for testing purposes
        x = JSON.parse(all_drinks[count])
        final_array.push(x)
        count+=1
        end
        final_array
    end

    # def seed_names
    #     q = make_work
    #     counter1 = 0
    #     counter2 = 0
    #     while counter2 <= (q[0]["drinks"].length)
    #         # binding.pry
    #         Drink.new(name:q[0]["drinks"][counter2]["strDrink"])
    #         counter2 += 1
    #     end
    # end


    def select_names
        q = make_work
        # binding.pry
        names = []
        names.push(q.collect{|xx| xx["drinks"][0]["strDrink"]})
        #names.push(q.collect{|xx| xx["drinks"][0]["strDrink"]})
        names.push(q.collect{|xx| xx["drinks"][1]["strDrink"]})
        #binding.pry
        #count +=1
        # end
            
        names
    end
    
    binding.pry