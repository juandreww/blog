class BannedWords < ActiveModel::Validator
  def validate(record)
    record.errors.add :base, "Some words is banned!" if record.body.downcase.include? "black"
  end
end
