require 'spec_helper'

module Refinery
  module TeamMembers
    describe TeamMember do
      describe "validations" do
        subject do
          FactoryGirl.create(:team_member,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
