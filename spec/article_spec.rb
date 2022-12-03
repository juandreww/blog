require "rails_helper"

RSpec.describe Article, type: :model do
  def article_params
    {
      title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
      status: Article.status_public, start_hour: "08:00:00", end_hour: "17:00:00",
      code: "bKzXCO", url: "rails.com", total_comments: 10
    }
  end

  context 'valid attributes' do
    it "is valid with valid attributes" do
      article = Article.new(article_params)
      article.save
      expect(article).to be_valid
    end
  end

  context 'start_hour not specified' do
    it "throws error" do
      article = Article.new(article_params)
      article.start_hour = nil
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Start hour can't be blank")
    end
  end

  context 'start_hour is greater than end_hour' do
    it "throws error" do
      article = Article.new(article_params)
      article.start_hour = "20:00:00"
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to include("Start hour must be less than or equal to")
    end
  end

  context 'url has www' do
    it "throws error" do
      article = Article.new(article_params)
      article.url = "www.yahoo.us"
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Url is reserved")
    end
  end

  context 'article_code contains number' do
    it "throws error" do
      article = Article.new(article_params)
      article.code = "article_001"
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Code only allows letters")
    end
  end

  context 'total_comments contains letter' do
    it "throws error" do
      article = Article.new(article_params)
      article.total_comments = "20 comments"
      article.save

      expect(article.invalid?).to be_truthy
      expect(article.errors.full_messages[0]).to eq("Total comments is not a number")
    end
  end

  context 'title is found not unique' do
    it "throws error" do
      article = Article.new(article_params)
      article.save

      article_2 = Article.new(article_params)
      article_2.save

      expect(article_2.invalid?).to be_truthy
      expect(article_2.errors.full_messages[0]).to eq("Title has already been taken")
    end
  end
end
