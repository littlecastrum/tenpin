RSpec.describe Tenpin::Pinfalls do
  let(:frame_counter) { Tenpin::Pinfalls.new }

  def mark_many(count, pins)
    count.times { frame_counter << pins }
  end

  def mark_strike
    frame_counter << '10'
  end

  it "should add an empty frame once the current one have ended" do
    frame_counter << '2'
    not_ended_frame = frame_counter.to_arr.map(&:dup)
    
    frame_counter << '3'
    ended_frame = frame_counter.to_arr

    expect(not_ended_frame).to eq [['2']]
    expect(ended_frame).to eq [['2', '3'], []]
  end 

  it "should show only one value for frames with strikes" do
    mark_strike

    expect(frame_counter.to_arr).to eq [['10'], []]
  end

  it "should allow for 3 values on last frame" do
    mark_many(12, '10')
    test_arr = Array.new(10, ['10'])
    test_arr[-1] = ['10', '10', '10']

    expect(frame_counter.to_arr).to eq test_arr
  end

  it "should exit when a 4th throw is attempted in the last frame" do
    expect { mark_many(13, '10') }.to raise_error(SystemExit)
  end

end