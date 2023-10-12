require 'rails_helper'

RSpec.describe Chapter, type: :model do
  it "has correct primary key" do
    expect(described_class.primary_key).to eq ["book_number", "number"]
  end

  context "valid" do
    let(:book) { Book.create(number: 1, title: "First book").reload }

    subject(:chapter) { described_class.new(book:, number: 1, title: "Chapter one") }

    it { is_expected.to be_valid }

    it "can save" do
      expect { chapter.save! }.not_to raise_exception
    end

    context "is saved" do
      before { chapter.save! }

      it "can be found" do
        expect(described_class.find([book.number, chapter.number])).to eq chapter
        expect(book.chapters.find_by(number:chapter.number)).to eq chapter
      end

      describe "update_all" do
        subject(:update_all) { Chapter.joins(:book).where(book: {title: "First book"}).update_all(title: "Chapter") }

        it "updates all" do
          expect { update_all }.to change { book.chapters.pluck(:title).to_a }.to(["Chapter"])
        end
      end
    end
  end
end
