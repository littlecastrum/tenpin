RSpec.describe Tenpin::Score do
  let(:score_counter) { Tenpin::Score.new }

  def throw_many(count, pins)
    count.times { score_counter << pins }
  end

  def throw_spare
    score_counter << 5
    score_counter << 5
  end

  def throw_strike
    score_counter << 10
  end

  def throw_nine
    score_counter << 9
    score_counter << 0
  end

  it "should be able to score a gutter game" do
    throw_many(20, 0)

    expect(score_counter.calculate).to eq 0
  end

  it "should score correctly an all 1s game" do
    throw_many(20, 1)

    expect(score_counter.calculate).to eq 20
  end

  it "should score one spare" do
    throw_spare
    score_counter << 3
    throw_many(17, 0)

    expect(score_counter.calculate).to eq 16
  end

  it "should score one strike" do
    throw_strike
    score_counter << 3
    score_counter << 4
    throw_many(16, 0)

    expect(score_counter.calculate).to eq 24
  end

  it "should score a perfect game" do
    throw_many(12, 10)

    expect(score_counter.calculate).to eq 300
  end

  it "should score an all spares game" do
    throw_many(21, 5)

    expect(score_counter.calculate).to eq 150
  end

  it "should score an all nine game" do
    10.times { throw_nine }

    expect(score_counter.calculate).to eq 90
  end
end