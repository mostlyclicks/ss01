# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Athletes" do
    describe "Admin" do
      describe "athletes" do
        refinery_login_with :refinery_user

        describe "athletes list" do
          before do
            FactoryGirl.create(:athlete, :name => "UniqueTitleOne")
            FactoryGirl.create(:athlete, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.athletes_admin_athletes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.athletes_admin_athletes_path

            click_link "Add New Athlete"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Athletes::Athlete.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Athletes::Athlete.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:athlete, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.athletes_admin_athletes_path

              click_link "Add New Athlete"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Athletes::Athlete.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:athlete, :name => "A name") }

          it "should succeed" do
            visit refinery.athletes_admin_athletes_path

            within ".actions" do
              click_link "Edit this athlete"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:athlete, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.athletes_admin_athletes_path

            click_link "Remove this athlete forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Athletes::Athlete.count.should == 0
          end
        end

      end
    end
  end
end
