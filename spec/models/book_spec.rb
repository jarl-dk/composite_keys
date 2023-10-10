require 'rails_helper'

RSpec.describe Book, type: :model do
  it "infers primary key" do
    expect(described_class.primary_key).to eq "number"
  end

  context "valid book" do
    subject(:book) { described_class.new(number: 1, title: "First book") }

    it { is_expected.to be_valid }

    it "can save" do
      expect { book.save! }.not_to raise_exception
    end

    context "is saved" do
      before { book.save! }

      it "can be found" do
        expect(described_class.find(1)).to eq book
      end

      context "with chapters" do
        before do
          book.chapters << Chapter.new(number: 1, title: "Chapter one")
          book.chapters << Chapter.new(number: 2, title: "Chapter two")
        end

        it "has chapters" do
          expect(book.chapters).to have_attributes(size: 2)
        end
      end
    end
  end
end
