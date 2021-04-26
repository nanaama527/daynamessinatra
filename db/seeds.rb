User.destroy_all
Name.destroy_all

birthname_list = [ "Adwoa/Kwadwo", 
    "Abena/Kwabena", 
    "Akua/Kwaku", 
    "Yaa/Yaw", 
    "Afia/Kofi", 
    "Ama/Kwame",
    "Akosua/Akwasi"]


    # birthname_list = {Monday: "Adwoa/Kwadwo", 
    #     Tuesday: "Abena/Kwabena", 
    #     Wednesday: "Akua/Kwaku", 
    #     Thursday: "Yaa/Yaw", 
    #     Friday: "Afia/Kofi", 
    #     Saturday: "Ama/Kwame",
    #     Sunday: "Akosua/Akwasi"} 

dee = User.create(name: "Darlene", password: "shawtyone" , username: "PoshedDee" , ghanaian_name: "Afia")
soccer = User.create(name: "David", password: "Ronaldoforever" , username: "Chinguito" , ghanaian_name: "Kofi")
moneyman = User.create(name: "Louis", password: "SirOfori" , username: "Louiee V" , ghanaian_name: "Kwabena")
bougie = User.create(name: "Crystal", password: "CANaturals" , username: "RisqueChloe" , ghanaian_name: "Ama")
stockguy = User.create(name: "Kevin", password: "SikaAbrantie" , username: "Kwame_Asare", ghanaian_name: "Kwame")
bori = User.create(name: "Melissa", password: "Morenita", username: "brownskinMel", ghanaian_name: "Akua")



Name.create(birthname: "Afia" , description: "", user_id: dee.id, who: "my cousin")
Name.create(birthname: "Kofi" , description: "", user_id: soccer.id , who: "my brother")
Name.create(birthname: "Kwabena" , description: "", user_id: moneyman.id, who: "my bestfriend")
Name.create(birthname: "Ama" , description: "", user_id: bougie.id, who: "my cousin")
Name.create(birthname: "Kwame" , description: "", user_id: stockguy.id, who: "my uncle")
Name.create(birthname: "Akua" , description: "", user_id: bori.id, who: "random")
Name.create(birthname: "Akua" , description: "", user_id: rand(dee.id..bori.id), who: "friend")

#User.new()
    


    

puts "

All Set!

"