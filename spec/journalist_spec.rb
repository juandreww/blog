require "rails_helper"

RSpec.describe Journalist, type: :model do
  def article_params
    {
      title: "Rose, Queen of Flower", body: "Minimum is 10 characters", eula: true,
      status: Article.status_public, start_hour: "08:00:00", end_hour: "17:00:00",
      code: "bKzXCO", url: "rails.com", total_comments: 10
    }
  end

  def journalist_params
    {
      name: "Axel Romero"
    }
  end

  def release_schedule_params
    {
      title: "Release",
      date: Time.zone.now.strftime("%d/%m/%Y")
    }
  end

  def device_params
    {
      device_number: "QG-9002NF"
    }
  end

  def account_params
    {
      username: "account_tester"
    }
  end

  def company_params
    {
      name: "the great runchise"
    }
  end

  context 'when journalist has three articles' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save

      3.times do |index|
        article = journalist.articles.new(article_params)
        article.url = "#{article.url}/#{index}"
        article.save
        expect(article.valid?).to be_truthy

        release_schedule = article.release_schedules.new(release_schedule_params)
        release_schedule.journalist_id = journalist.id
        release_schedule.save
        expect(release_schedule.valid?).to be_truthy

        expect(journalist.articles.size).to eq(index + 1)
      end

      expect(journalist.valid?).to be_truthy
      expect(Article.all.size).to eq(3)
    end
  end

  context 'when journalist has one account' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save

      device = Device.new(device_params)
      device.journalist_id = journalist.id
      device.save

      account = Account.new(account_params)
      account.device_id = device.id
      account.save

      expect(journalist.valid?).to be_truthy
      expect(device.valid?).to be_truthy
      expect(account.valid?).to be_truthy
      expect(journalist.account.present?).to be_truthy
    end
  end

  context 'when journalist works in 2 companies' do
    it "is valid" do
      journalist = Journalist.new(journalist_params)
      journalist.save
      expect(journalist.valid?).to be_truthy

      2.times do |index|
        company = journalist.companies.new(company_params)
        company.save
        expect(company.valid?).to be_truthy
      end
    end
  end
end
