require 'spec_helper'

describe ActivitySchema do
  before :all do ; @midnite = Time.now.midnight ; end # right on the hour
  describe 'valid when' do
    before :all do ; @args = {:name => 'x', :starts_every => 10, :num_questions => 1, :questions => [create(:question)]} ; end
    it 'end time is later than start time' do
      ActivitySchema.new(@args.merge(:start_time => @midnite, :end_time => @midnite - 5.minutes)).
        should have(1).error_on(:end_time)
      ActivitySchema.new(@args.merge(:end_time => @midnite, :start_time => @midnite - @args[:starts_every].minutes)).
        should be_valid
    end
    it 'start time aligns with activity start' do
      ActivitySchema.new(@args.merge(:start_time => @midnite+1.minute, :end_time => @midnite+10.minutes)).
        should have(1).error_on(:start_time)
    end
    describe 'starts_every' do
      before :all do ; @args = {:end_time => @midnite+10.minutes, :start_time => @midnite, :name => 'x',:num_questions => 1, :questions => [create(:question)]} ; end
      it 'is a divisor of 60 minutes' do
        ActivitySchema.new(@args.merge :starts_every => 7).should have(1).error_on(:starts_every)
        ActivitySchema.new(@args.merge :starts_every => 6).should be_valid
      end
      it 'is greater than minimum interval between experiments' do
        ActivitySchema.new(@args.merge :starts_every => ActivitySchema::MINIMUM_INTERVAL_BETWEEN_EXPERIMENTS - 1).should have(1).error_on(:starts_every)
      end
    end
  end
  describe 'invalid when' do
    before :all do; @args = {:name =>'x', :starts_every =>10, :num_questions =>1}; end
      it "requires at least one question" do
        ActivitySchema.new(@args.merge(:start_time => @midnite, :end_time => @midnite +10.minutes)).
          should have(1).error_on(:questions)
      end
      it "should match the number of questions" do
        ActivitySchema.new(@args.merge(:starts_every => @midnight, :end_time => @midnite + 10.minutes, :num_questions => 2, :questions => [create(:question)])).
        should have(1).error_on(:num_questions)
      end
  end
end
