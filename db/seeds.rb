require_relative('../models/characters')
require_relative('../models/teams')

Character.delete_all()
Team.delete_all()

# New teams
team1 = Team.new ({
  "owner" => "Dave",
  "team_name" => "Stark Contrast"
  })

team2 = Team.new ({
  "owner" => "Andy",
  "team_name" => "Jamie's right hand man"
  })

team1.save()
team2.save()

# New Characters

character1 = Character.new ({
  "name" => "Sansa Stark",
  "bio" => "Second child of Eddard and Catelyn Stark. She was held in King's landing, married to Tyrion before heading back North and was married to Ramsay Bolton. She is protected by Brienne of Tarth.",
  "pic_url" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJALJdR3Dggo6yesS95f30IX30DHbo8Bn--9unPR6zsRE89ny3",
  "score" => "15",
  "team_id" => team1.id
  })

character2 = Character.new ({
  "name" => "Bronn",
  "bio" => "Originally a sellsword for Tyrion Lannister, but following his actions at the Battle of Blackwater he was made a Knight.",
  "pic_url" => "https://m.media-amazon.com/images/M/MV5BMTY0MzI5MjY1OV5BMl5BanBnXkFtZTcwODM1ODg4OQ@@._V1_.jpg",
  "score" => "25",
  "team_id" => team2.id
  })

character3 = Character.new ({
  "name" => "The Night's King",
  "bio" => "Terrifying leader of the White Walkers.",
  "pic_url" => "https://s2.r29static.com//bin/entry/982/720x864,80/1796850/image.jpg",
  "score" => "5",
  "team_id" => team1.id
  })

  character1.save()
  character2.save()
  character3.save()
