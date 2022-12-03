require "rails_helper"

RSpec.describe Article, type: :model do
  let(:article) { create(:article, title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
                          status: Article.status_public, start_hour: "08:00:00", end_hour: "17:00:00",
                          code: "bKzXCO", url: "rails.com") }

  context 'valid attributes' do
    it "is valid with valid attributes" do
      expect(article).to be_valid
    end
  end

  context 'start_hour not specified' do
    it "throws error" do
      article.start_hour = nil
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Start hour can't be blank")
    end
  end

  context 'start_hour is greater than end_hour' do
    it "throws error" do
      article.start_hour = "20:00:00"
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to include("Start hour must be less than or equal to")
    end
  end

  context 'url has www' do
    it "throws error" do
      article.url = "www.yahoo.us"
      article.save
      byebug
      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Url is reserved")
    end
  end

  context 'article_code contains number' do
    it "throws error" do
      article.code = "article_001"
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Code only allows letters")
    end
  end
end
