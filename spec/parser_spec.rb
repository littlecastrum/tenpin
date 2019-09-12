RSpec.describe Tenpin::Parser do
  let(:parser) { Tenpin::Parser }
  let(:games_folder) { './spec/games' }

  def fill_frame_by(val)
    10.times.reduce([]) { |arr, curr| arr[-1].nil? ? arr << val : arr << arr[-1] + val }
  end

  it "should parse a multiplayer game" do
    first, second, third = parser.file_to_players("#{games_folder}/mixed_game")

    first_pinfalls = first.pinfalls.to_arr
    first_score = first.score.to_arr
    first_test_pinfalls = Array.new(10, ['F', 'F'])
    first_test_score = Array.new(10, 0)

    second_pinfalls = second.pinfalls.to_arr
    second_score = second.score.to_arr
    second_test_pinfalls = Array.new(10, ['5', '5'])
    second_test_pinfalls[-1] = ['5', '5', '5']
    second_test_score = fill_frame_by(15)

    third_pinfalls = third.pinfalls.to_arr
    third_score = third.score.to_arr
    third_test_pinfalls = Array.new(10, ['10'])
    third_test_pinfalls[-1] = ['10', '10', '10']
    third_test_score = fill_frame_by(30)

    expect(first_pinfalls).to eq first_test_pinfalls
    expect(first_score).to eq first_test_score
    expect(second_pinfalls).to eq second_test_pinfalls
    expect(second_score).to eq second_test_score
    expect(third_pinfalls).to eq third_test_pinfalls
    expect(third_score).to eq third_test_score
  end 
  
  it "should parse a zero score game" do
    player = parser.file_to_players("#{games_folder}/all_fails")[0]
    pinfalls = player.pinfalls.to_arr
    score = player.score.to_arr

    test_pinfalls = Array.new(10, ['F', 'F'])
    test_score = Array.new(10, 0)

    expect(pinfalls).to eq test_pinfalls
    expect(score).to eq test_score
  end 

  it "should parse a perfect game" do
    player = parser.file_to_players("#{games_folder}/perfect")[0]
    pinfalls = player.pinfalls.to_arr
    score = player.score.to_arr

    test_pinfalls = Array.new(10, ['10'])
    test_pinfalls[-1] = ['10', '10', '10']

    test_score = fill_frame_by(30)

    expect(pinfalls).to eq test_pinfalls
    expect(score).to eq test_score
  end 

  it "should exit when parsing if a pinfall exceeds 10" do
    expect { parser.file_to_players("#{games_folder}/out_of_bounds_pinfall") }.to raise_error(SystemExit)
  end 

  it "should exit when parsing if game have missing frames" do
    expect { parser.file_to_players("#{games_folder}/missing_frame") }.to raise_error(SystemExit)
  end 

  it "should exit when parsing if game have extra frames" do
    expect { parser.file_to_players("#{games_folder}/extra_frame") }.to raise_error(SystemExit)
  end 

end