require "rails_helper"

RSpec.describe Article, type: :model do
  it "is valid with valid attributes" do
    article = Article.new(title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
                          status: Article.status_public, start_hour: "08:00:00", end_hour: "17:00:00",
                          code: "bKzXCO", url: "rails.com")
    article.save

    expect(article).to be_valid
  end

  it "throws error when start_hour is not specified" do
    article = Article.new(title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
                          status: Article.status_public, code: "bKzXCO", url: "rails.com")
    article.save

    expect(article.invalid?).to be_truthy
    expect(article.errors.full_messages[0]).to eq("Start hour can't be blank")
  end

  it "throws error when start_hour is greater than end_hour" do
    article = Article.new(title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
                          status: Article.status_public, start_hour: "20:00:00", end_hour: "17:00:00",
                          code: "bKzXCO", url: "rails.com")
    article.save

    expect(article.invalid?).to be_truthy
    expect(article.errors.full_messages[0]).to include("Start hour must be less than or equal to")
  end

  it "throws error when url has www" do
    article = Article.new(title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
                          status: Article.status_public, start_hour: "08:00:00", end_hour: "17:00:00", url: "www.yahoo.us",
                          code: "bKzXCO")
    article.save

    expect(article.invalid?).to be_truthy
    expect(article.errors.full_messages[0]).to eq("Url is reserved")
  end

  it "returns valid object" do
    article = Article.new(title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
                          status: Article.status_public, start_hour: "08:00:00", end_hour: "17:00:00", url: "rails.com",
                          code: "bKzXCO")
    article.save

    expect(article.valid?).to be_truthy
  end

  it "throwserror when article_code contains number" do
    article = Article.new(title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
                          status: Article.status_public, start_hour: "08:00:00", end_hour: "17:00:00", url: "rails.com",
                          code: "article_001")
    article.save

    expect(article.invalid?).to be_truthy
    expect(article.errors.full_messages[0]).to eq("Code only allows letters")
  end
end
