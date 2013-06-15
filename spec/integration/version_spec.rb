# encoding: utf-8

require 'spec_helper'

try_spec do
  @input = "article"

  require './spec/fixtures/article'

  describe DataMapper::TypesFixtures::Article do
    supported_by :all do
      describe 'when is a new record' do
        before :all do
          @resource = DataMapper::TypesFixtures::Article.new(:title => @input, :slug => @input)
        end

        it 'has a version of 0' do
          @resource.version.should == 0
        end
      end

      describe "persisted with version" do
        before :all do
          @resource = DataMapper::TypesFixtures::Article.create(:title => @input, :slug => @input)
          @resource.reload
        end

        it 'should have incremented the version to 1' do
          @resource.version.should == 1
        end

      end
    end
  end
end
