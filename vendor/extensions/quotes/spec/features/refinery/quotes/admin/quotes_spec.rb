# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Quotes" do
    describe "Admin" do
      describe "quotes" do
        refinery_login_with :refinery_user

        describe "quotes list" do
          before do
            FactoryGirl.create(:quote, :name => "UniqueTitleOne")
            FactoryGirl.create(:quote, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.quotes_admin_quotes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.quotes_admin_quotes_path

            click_link "Add New Quote"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Quotes::Quote.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Quotes::Quote.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:quote, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.quotes_admin_quotes_path

              click_link "Add New Quote"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Quotes::Quote.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:quote, :name => "A name") }

          it "should succeed" do
            visit refinery.quotes_admin_quotes_path

            within ".actions" do
              click_link "Edit this quote"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:quote, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.quotes_admin_quotes_path

            click_link "Remove this quote forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Quotes::Quote.count.should == 0
          end
        end

      end
    end
  end
end
