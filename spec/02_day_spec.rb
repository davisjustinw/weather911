
describe "Day" do
  month = Luned::Month.build_from_api(2018, 2)
 describe ".new_with_int" do
    it "initializes a day object if the numeric year, month and day are valid" do
      expect(Luned::Day.new_with_int(1999, 2, 13)).to be_an_instance_of(Luned::Day)
    end

    it "return falsey if not a valid year, month and day" do
      expect(Luned::Day.new_with_int(1999, 2, 31)).to be_falsey
    end

    it ".all includes newly created Day object" do
      obj = Luned::Day.new_with_int(1999, 2, 1)
      expect(Luned::Day.all[obj.time]).to eq(obj)
    end
  end

  describe "#add" do
    it "adds Day to all" do

      day = Luned::Day.new_with_int(2019, 2, 3)
      day.add
      expect(Luned::Day.all[day.time]).to eq(day)
    end
  end

  describe "#build_observations" do
    it "fills out the Days hour objects with observation objects filled wil dark sky data" do
      day = month.days[1]
      day.build_observations
      expect(day.hours[day.hours.keys.sample].observation).to be_truthy
      expect(day.summary).not_to be_empty
      expect(day.hours.size).to be(24)
    end
  end

  describe "#count" do
    it "returns number of calls associated with the day" do
      #need to fix

      day = month.days[1]
      expect(day.count).to eq(293)
    end
  end



  describe ".valid?" do
    it "returns true if valid parameters for month" do

      expect(Luned::Day.valid?(2019, 1, 4)).to be_truthy
    end

    it "returns false if not valid parameters for month" do
      expect(Luned::Day.valid?(2019, 2, 30)).to be_falsey
    end
  end

end
