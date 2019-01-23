require("minitest/autorun")
require('minitest/rg')
require_relative('../models/characters')
require_relative('../models/teams')

# Team tests

class TeamTest < MiniTest::Test

  def setup
    @team = Team.new("Micheal", "Valyrian Dragons")

  def test_team_has_owner
    assert_equal("Micheal", @team.owner())
  end

  def test_team_has_team_name
    assert_equal("Valyrain Dragons", @team.team_name())
  end

# Character tests
class CharacterTest < MiniTest::Test

  def setup
    @character = Character.new("Jon Snow", "Illegitmate son of Eddard Stark", "https://i.stack.imgur.com/6Zr5C.jpg", 5, 2)
  end

  def test_character_has_name
    assert_equal("Jon Snow", @character.name())
  end

  def test_character_has_bio
    assert_equal("Illegitmate son of Eddard Stark", @character.bio())
  end

  def test_character_has_pic_url
    assert_equal("https://i.stack.imgur.com/6Zr5C.jpg", @character.pic_url())
  end

  def test_character_has_score
    assert_equal(5, @character.score())
  end

  def test_character_has_team_id
    assert_equal(2, @character.team_id())
  end

end

# Additional method checks in seeds.rb
