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

User.create(name: "Darlene", password: "shawtyone" , username: "PoshedDee" , ghanaian_name: "Afia")
User.create(name: "David", password: "Ronaldoforever" , username: "Chinguito" , ghanaian_name: "Kofi")
User.create(name: "Louis", password: "SirOfori" , username: "Louiee V" , ghanaian_name: "Kwabena")
User.create(name: "Crystal", password: "CANaturals" , username: "RisqueChloe" , ghanaian_name: "Ama")
User.create(name: "Kevin", password: "SikaAbrantie" , username: "Kwame_Asare", ghanaian_name: "Kwame")
User.create(name: "Melissa", password: "Morenita", username: "brownskinMel", ghanaian_name: "Akua")



Name.create(birthname: "Afia" , description: "", user_id: 1, who: "my cousin")
Name.create(birthname: "Kofi" , description: "", user_id: 2, who: "my brother")
Name.create(birthname: "Kwabena" , description: "", user_id: 3, who: "my bestfriend")
Name.create(birthname: "Ama" , description: "", user_id: 4, who: "my cousin")
Name.create(birthname: "Kwame" , description: "", user_id: 5, who: "my uncle")
Name.create(birthname: "Akua" , description: "", user_id: 6, who: "random")
Name.create(birthname: "Akua" , description: "", user_id: rand(1..6), who: "friend")

#User.new()
    


    

puts "

All Set!

"