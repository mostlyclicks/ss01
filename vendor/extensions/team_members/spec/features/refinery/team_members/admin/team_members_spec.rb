# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "TeamMembers" do
    describe "Admin" do
      describe "team_members" do
        refinery_login_with :refinery_user

        describe "team_members list" do
          before do
            FactoryGirl.create(:team_member, :name => "UniqueTitleOne")
            FactoryGirl.create(:team_member, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.team_members_admin_team_members_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.team_members_admin_team_members_path

            click_link "Add New Team Member"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::TeamMembers::TeamMember.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::TeamMembers::TeamMember.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:team_member, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.team_members_admin_team_members_path

              click_link "Add New Team Member"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::TeamMembers::TeamMember.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:team_member, :name => "A name") }

          it "should succeed" do
            visit refinery.team_members_admin_team_members_path

            within ".actions" do
              click_link "Edit this team member"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:team_member, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.team_members_admin_team_members_path

            click_link "Remove this team member forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::TeamMembers::TeamMember.count.should == 0
          end
        end

      end
    end
  end
end
