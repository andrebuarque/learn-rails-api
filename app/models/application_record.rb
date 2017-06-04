class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def as_json(options={})
    json = super(options)
    json[:created_at] = I18n.l(self.created_at.to_date)
    json[:updated_at] = I18n.l(self.updated_at.to_date)
    json
  end
end
