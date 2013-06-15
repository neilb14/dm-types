require 'spec_helper'

try_spec do
  describe DataMapper::Property::Version do
    before :all do
      class ::User
        include DataMapper::Resource
        property :id, Serial
        property :version, Version
      end
    end

    it 'should start at 0' do
      user = User.new
      user.version.should == 0
    end

    describe '.dump' do
      before do
        @version = User.property(:version, DataMapper::Property::Version)
      end

      it 'should increment' do
        @version.dump(1).should == 2
      end
    end
  end
end
